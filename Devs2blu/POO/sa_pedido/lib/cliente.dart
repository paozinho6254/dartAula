import 'package:mysql_client/mysql_client.dart';

class Cliente {
  // Inicia o conn para as conexões com o banco
  final MySQLConnection conn;

  // Inicializa uma instância da classe Cliente com uma conexão
  Cliente(this.conn);

  // Insere um novo cliente na tabela clientes
  Future<void> incluir(String nome, String email) async {
    try {
      await conn.execute(
        // Comando enviado para o banco
        'INSERT INTO clientes (nome, email) VALUES (:nome, :email)',
        {'nome': nome, 'email': email},
      );
      print('Cliente incluído com sucesso: $nome');
    } catch (erro) {
      print('Erro na inclusão do cliente: $erro');
    }
  }

  // Listagem dos clientes ordenados por ID
  Future<void> listar() async {
    try {
      var result = await conn.execute(
        // Comando enviado para o banco
        'SELECT id, nome, email FROM clientes ORDER BY id',
      );

      // Se as linhas estiverem vazias retornamos tabela vazia
      if (result.rows.isEmpty) {
        print('Nenhum cliente encontrado.');
        return;
      }

      // listamos assim os clientes
      for (var linha in result.rows) {
        final id = linha.typedColByName<int>('id');
        final nome = linha.typedColByName<String>('nome');
        final email = linha.typedColByName<String>('email');

        print('ID: $id, Nome: $nome, Email: $email');
      }
    } catch (erro) {
      print('Erro na listagem de clientes: $erro');
    }
  }
}