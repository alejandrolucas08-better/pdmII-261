import 'dart:io';
import 'dart:async';
import 'dart:math';

void main() async {
    final String host = '127.0.0.1';
    final int port = 3000;
    
    try {
        final socket = await Socket.connect(host, port);
        print('### Conectado ao Servidor IoT ###');
        
        // Definição de limites de temperatura
        double minTemp = 28.0;
        double maxTemp = 50.0;
            
        // Timer.periodic: Cria um loop assíncrono que não bloqueia o programa
        // Executa a função de callback a cada 10 segundos
        Timer.periodic(Duration(seconds: 10), (timer) {
              
        // Lógica para encerrar após 1 minutos
        if (timer.tick > 6) { // 6 execuções * 10 seg = 60 seg (1 min)
            print('Encerrando monitoramento...');
            timer.cancel();
            socket.close();
            return;
        }
        
        // Simulação de leitura do sensor usando números aleatórios
        double temp = minTemp + Random().nextDouble() * (maxTemp - minTemp);

        // Formata o número para 1 casa decimal e converte para String
        String payload = temp.toStringAsFixed(1);
    
              
        // Envia os dados via socket (serão recebidos como bytes pelo servidor)
        socket.write(payload);
        });
    
    } catch (e) {
        print('Erro ao conectar: $e');
    }
}