/// Interface selada para garantir que o "jogo de linguagem" 
/// seja limitado ao domínio que definimos (Exaustividade).
sealed class ProtocoloDeSignificado {
  String interpretar(String sinalBruto);
}

/// Implementação focada na Dimensão Sintática/Técnica.
class ProtocoloTecnico implements ProtocoloDeSignificado {
  @override
  String interpretar(String sinalBruto) {
    // A significação é uma função matemática do dado.
    final magnitude = sinalBruto.length * 42;
    return 'Sinal "$sinalBruto" quantificado: espectro de $magnitude unidades.';
  }
}

/// Implementação focada na Dimensão Pragmática/Hermenêutica.
/// Removido o acento "ê" do identificador para conformidade ASCII.
class ProtocoloHermeneutico implements ProtocoloDeSignificado {
  @override
  String interpretar(String sinalBruto) {
    // A significação é uma evocação cultural/histórica.
    return 'Sinal "$sinalBruto" interpretado como vestígio de uma prática anterior.';
  }
}

/// O Motor de Contexto agora protege o estado e expressa a transição de regras.
class MotorDeContexto {
  ProtocoloDeSignificado _protocolo;

  MotorDeContexto(this._protocolo);

  /// O significado não reside no dado, mas na aplicação da regra atual.
  String processar(String dado) => _protocolo.interpretar(dado);

  /// Altera o "Jogo de Linguagem" em tempo de execução.
  void mudarJogo(ProtocoloDeSignificado novoProtocolo) {
    _protocolo = novoProtocolo;
  }
}

void main() {
  const sinal = 'delta-7';
  final motor = MotorDeContexto(ProtocoloTecnico());

  // Jogada 1: O paradigma da precisão.
  print('Paradigma Técnico: ${motor.processar(sinal)}');

  // Transição: Mudança na "Forma de Vida" do sistema.
  motor.mudarJogo(ProtocoloHermeneutico());

  // Jogada 2: O paradigma da interpretação.
  print('Paradigma Hermeneutico: ${motor.processar(sinal)}');
}