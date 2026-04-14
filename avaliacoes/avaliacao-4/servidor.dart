import 'dart:io';    
import 'dart:convert'; 

void main() async {
    // Configuração de rede: loopback (127.0.0.1) e porta 3000
    final String host = InternetAddress.loopbackIPv4.address;
    final int port = 3000;
    
    try {
        // Inicializa o servidor e reserva a porta no Sistema Operacional
        final server = await ServerSocket.bind(host, port);
        print('### Servidor IoT Iniciado ###');
        print('Esperando por conexões em $host:$port ...\n');
    
        // Loop assíncrono que aguarda a conexão de novos dispositivos
        // Cada 'client' é uma instância única da classe Socket
        await for (Socket client in server) {
          handleConnection(client);
        }
    }catch (e) {
        print('Erro no servidor: $e');
    }
}

/// Função assíncrona para processar a comunicação com cada cliente
void handleConnection(Socket client) {
    // Armazena IP e Porta do sensor para identificação nos logs
    final String clientInfo = '${client.remoteAddress.address}:${client.remotePort}';
    print('Dispositivo conectado: $clientInfo');

    // Tratamento do fluxo de dados (Stream)
    client
        .cast<List<int>>() // Garante que os bytes sejam lidos como lista de inteiros
        .transform(utf8.decoder) // Decodificador: transforma bytes (UTF-8) em texto (String)
        .listen(
        (data) {
        // Callback disparado sempre que o sensor envia uma nova temperatura
        final timestamp = DateTime.now().toString().split('.').first;
        print('\n[$timestamp] Leitura recebida de $clientInfo: $data°C');
    },
    onError: (error) {
        print('Erro na conexão com $clientInfo: $error');
        client.close(); // Fecha o socket em caso de falha para liberar recursos
    },
    onDone: () {
        // Disparado quando o sensor encerra a conexão (ex: após os 5 min)
        print('--- Dispositivo $clientInfo desconectado ---\n');
        client.close();
    },
  );
}