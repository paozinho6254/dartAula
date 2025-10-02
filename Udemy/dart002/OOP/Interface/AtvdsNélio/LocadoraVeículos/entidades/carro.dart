class Carro {

    String modelo;

    Carro({required this.modelo});

    get getModelo{
        return this.modelo;
    }

    set setModelo(String valor){
        this.modelo = valor;
    }

}