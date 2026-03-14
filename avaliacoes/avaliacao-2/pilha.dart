class Pilha <T> {
    List<T> elementos =[];
    
    void empilhar(T valor) {
        elementos.add(valor);
        print("$valor foi empilhado");
    }
    
    void desempilhar() {
        if (elementos.isEmpty){
            print("A pilha está vazia");
        } else {
            T removido = elementos.removeLast();
            print("$removido foi desempilhado");
        }
    }
    
    void mostrarTopo() {
        if (elementos.isEmpty) {
            print("Pilha vazia");
        } else {
            print("\nTopo da pilha: ${elementos.last}");
        }
    }
    
    void mostrarPilha() {
        print("\nElementos da Pilha:");
        for (int i = elementos.length -1; i>=0; i--){
            print(elementos[i]);
        }
    }
}
