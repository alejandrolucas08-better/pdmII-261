import 'dart:io';
import 'dart:async';
import 'dart:math';

void main() async {
      final String host = '127.0.0.1';
      final int port = 3000;
    
      try {
        final socket = await Socket.connect(host, port);
        print('### Conectado ao Servidor IoT ###');
    
        // 1. Definição de limites
        double minTemp = 28.0;
        double maxTemp = 50.0;
        
        // 2. O Timer.periodic substitui o seu 'while'
        Timer.periodic(Duration(seconds: 10), (timer) {
          
          // Lógica para encerrar após 5 minutos
          if (timer.tick > 30) { // 30 execuções * 10 seg = 300 seg (5 min)
            print('Encerrando monitoramento...');
            timer.cancel();
            socket.close();
            return;
          }
    
          // 3. Gerando temperatura aleatória
          double temp = minTemp + Random().nextDouble() * (maxTemp - minTemp);
          String payload = temp.toStringAsFixed(1);

          
          // Enviando apenas o valor para o servidor processar
          socket.write(payload);
        });
    
      } catch (e) {
        print('Erro ao conectar: $e');
      }
}