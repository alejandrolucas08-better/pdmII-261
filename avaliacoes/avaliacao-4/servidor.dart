import 'dart:io';    
import 'dart:convert'; 

void main() async {
    // Define o endereço IP (localhost) e a porta
    final String host = InternetAddress.loopbackIPv4.address;
    final int port = 3000;
    
    try {
        // Cria o ServerSocket vinculado ao host e porta
        final server = await ServerSocket.bind(host, port);
        print('### Servidor IoT Iniciado ###');
        print('Esperando por conexões em $host:$port ...\n');
    
        // Escuta por novas conexões de dispositivos (clientes)
        await for (Socket client in server) {
          handleConnection(client);
        }
    }catch (e) {
        print('Erro no servidor: $e');
    }
}

/// Função assíncrona para processar a comunicação com cada cliente
void handleConnection(Socket client) {
    final String clientInfo = '${client.remoteAddress.address}:${client.remotePort}';
    print('Dispositivo conectado: $clientInfo');

    // Ouve o stream de dados enviados pelo cliente
    client
        .cast<List<int>>()
        .transform(utf8.decoder)
        .listen(
        (data) {
        final timestamp = DateTime.now().toString().split('.').first;
        print('[$timestamp] Leitura recebida de $clientInfo: \n$data°C\n');
    },
    onError: (error) {
        print('Erro na conexão com $clientInfo: $error');
        client.close();
    },
    onDone: () {
        print('--- Dispositivo $clientInfo desconectado ---\n');
        client.close();
    },
  );
}