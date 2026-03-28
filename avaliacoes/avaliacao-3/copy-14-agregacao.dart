// 14-agregacao.dart  
// Agregação e Composição
import 'dart:convert';

class Dependente {
  late String _nome;

  Dependente(String nome) {
    this._nome = nome;
  }

  Map<String, dynamic> toJson() {
    return {
      'Nome': _nome,
    };
  }
}

class Funcionario {
  late String _nome;
  late List<Dependente> _dependentes;

  Funcionario(String nome, List<Dependente> dependentes) {
    this._nome = nome;
    this._dependentes = dependentes;
  }

  Map<String, dynamic> toJson() {
    return {
      'Nome': _nome,
      'Dependentes': _dependentes.map((d) => d.toJson()).toList(),
    };
  }
}

class EquipeProjeto {
  late String _nomeProjeto;
  late List<Funcionario> _funcionarios;

  EquipeProjeto(String nomeprojeto, List<Funcionario> funcionarios) {
    _nomeProjeto = nomeprojeto;
    _funcionarios = funcionarios;
  }

  Map<String, dynamic> toJson() {
    return {
      'nomeProjeto': _nomeProjeto,
      'funcionarios': _funcionarios.map((f) => f.toJson()).toList(),
    };
  }
}

void main() {
  // 1. Criar varios objetos Dependentes
  Dependente dep1 = Dependente("Bruno de Sá");
  Dependente dep2 = Dependente("Arthur Antunes");
  Dependente dep3 = Dependente("Rivaldo Vítor");
  Dependente dep4 = Dependente("Rebeca Ferreira");
  Dependente dep5 = Dependente("Luca Zidane");
  Dependente dep6 = Dependente("Enzo Zidane");

  // 2. Criar varios objetos Funcionario e Associar os Dependentes criados aos respectivos funcionarios
  Funcionario func1 = Funcionario("Zico", [dep1, dep2]);
  Funcionario func2 = Funcionario("Rivaldo", [dep3, dep4]);
  Funcionario func3 = Funcionario("Zinédine Zidane", [dep5, dep6]);

  // 4. Criar uma lista de Funcionarios
  List<Funcionario> funcionarios = [func1, func2, func3];

  // 5. Criar um objeto Equipe Projeto chamando o metodo
  //    contrutor que da nome ao projeto e insere uma
  //    coleção de funcionario
  EquipeProjeto equipe = EquipeProjeto("Projeto Melhores Meias", funcionarios);

  // 6. Printar no formato JSON o objeto Equipe Projeto.
  print(jsonEncode(equipe.toJson()));
}