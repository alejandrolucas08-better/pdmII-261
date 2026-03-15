import 'pilha.dart';

class Pessoa {
  String nome;
  int idade;

  Pessoa(this.nome, this.idade);

  @override
  String toString() {
    return "Pessoa(nome: $nome, idade: $idade)";
  }
}

void main() {

  print("====== PILHA DE OBJETOS (Pessoa) ======");

  Pilha<Pessoa> pilhaPessoa = Pilha<Pessoa>();

  pilhaPessoa.empilhar(Pessoa("Ana", 20));
  pilhaPessoa.empilhar(Pessoa("Carlos", 25));
  pilhaPessoa.empilhar(Pessoa("Marina", 30));

  pilhaPessoa.mostrarPilha();
  pilhaPessoa.mostrarTopo();
  pilhaPessoa.desempilhar();
  pilhaPessoa.mostrarPilha();

  print("\n====== PILHA DE INTEIROS ======");

  Pilha<int> pilhaInt = Pilha<int>();

  pilhaInt.empilhar(10);
  pilhaInt.empilhar(20);
  pilhaInt.empilhar(30);

  pilhaInt.mostrarPilha();
  pilhaInt.mostrarTopo();
  pilhaInt.desempilhar();
  pilhaInt.mostrarPilha();


  print("\n====== PILHA DE STRINGS ======");

  Pilha<String> pilhaString = Pilha<String>();

  pilhaString.empilhar("Alfa");
  pilhaString.empilhar("Beta");
  pilhaString.empilhar("Gama");

  pilhaString.mostrarPilha();
  pilhaString.mostrarTopo();
  pilhaString.desempilhar();
  pilhaString.mostrarPilha();


  print("\n====== PILHA DE DOUBLE ======");

  Pilha<double> pilhaDouble = Pilha<double>();

  pilhaDouble.empilhar(1.5);
  pilhaDouble.empilhar(2.7);
  pilhaDouble.empilhar(3.9);

  pilhaDouble.mostrarPilha();
  pilhaDouble.mostrarTopo();
  pilhaDouble.desempilhar();
  pilhaDouble.mostrarPilha();


  print("\n====== PILHA DE BOOLEAN ======");

  Pilha<bool> pilhaBool = Pilha<bool>();

  pilhaBool.empilhar(true);
  pilhaBool.empilhar(false);
  pilhaBool.empilhar(true);

  pilhaBool.mostrarPilha();
  pilhaBool.mostrarTopo();
  pilhaBool.desempilhar();
  pilhaBool.mostrarPilha();
}
