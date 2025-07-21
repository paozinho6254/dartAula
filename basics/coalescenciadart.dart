void main(){

  Map<String, String?> usuario1 = {
    'nome' : 'Pãozinho',
    'email': 'paozinho6254@gmail.com',
    'telefone' : null,
    'endereco' : null,
  };

  print('Cadastro de usuarios\n');
  print('Usuário 1');
  String nome1 = usuario1['nome'] ?? 'Nome não informado';
  String email1 = usuario1['email'] ?? 'Email não informado';
  String telefone1 = usuario1['telefone'] ?? 'Telefone não informado';
  String endereco1 = usuario1['endereco'] ?? 'Endereço não informado';

  print('Nome     : $nome1');
  print('Email    : $email1');
  print('Telefone : $telefone1');
  print('Endereço : $endereco1');
}