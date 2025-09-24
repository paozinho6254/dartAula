class RepositorioPessoasRemote implements RepositorioPessoas {
  
  @override
  void adicionar(String nome) {
    
  }

  @override
  void apagar(int idPessoa) {
    
  }

  @override
  String ler(int idPessoa) {
    
    return 'Charlesna2Guerra';
  }

}

// Digamos que este é um banco de dados local, do qual roda os dados no dispositivo
class RepositorioPessoasLocal implements RepositorioPessoas {
 
  @override
  void adicionar(String nome) {
    
  }

  @override
  void apagar(int idPessoa) {
    
  }

  @override
  String ler(int idPessoa) {

    return 'Pãozinho';
  }

}

abstract class RepositorioPessoas {

  String ler(int idPessoa);

  void adicionar(String nome);
  
  void apagar(int idPessoa);

}