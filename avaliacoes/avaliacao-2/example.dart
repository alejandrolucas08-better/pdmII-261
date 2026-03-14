import 'pilha.dart';

class Pessoa {
  String nome;
  int idade;

  Pessoa(this.nome, this.idade);

  @override
  String toString() {
    return "$nome ($idade anos)";
  }
}

void main() {

  print("=== Pilha de inteiros ===");
  Pilha<int> pilhaInt = Pilha<int>();

  pilhaInt.empilhar(10);
  pilhaInt.empilhar(20);
  pilhaInt.empilhar(30);

  pilhaInt.mostrarPilha();


  print("\n=== Pilha de Strings ===");
  Pilha<String> pilhaString = Pilha<String>();

  pilhaString.empilhar("A");
  pilhaString.empilhar("B");
  pilhaString.empilhar("C");

  pilhaString.mostrarPilha();


  print("\n=== Pilha de doubles ===");
  Pilha<double> pilhaDouble = Pilha<double>();

  pilhaDouble.empilhar(1.5);
  pilhaDouble.empilhar(2.7);
  pilhaDouble.empilhar(3.9);

  pilhaDouble.mostrarPilha();


  print("\n=== Pilha de objetos Pessoa ===");
  Pilha<Pessoa> pilhaPessoa = Pilha<Pessoa>();

  pilhaPessoa.empilhar(Pessoa("Ana", 20));
  pilhaPessoa.empilhar(Pessoa("Carlos", 25));
  pilhaPessoa.empilhar(Pessoa("Maria", 30));

  pilhaPessoa.mostrarPilha();
}
