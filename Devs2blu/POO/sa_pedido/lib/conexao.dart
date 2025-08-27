import 'package:mysql_client/mysql_client.dart';
import 'tipo_produto.dart';
import 'cliente.dart';
import 'produto.dart';
import 'pedido.dart';

// Configuração de conexão
const String _dbHost = '127.0.0.1';
const int _dbPort = 3306;
const String _dbUser = 'paozinho';
const String _dbPassword = 'senha';
const String _dbDatabase = 'loja';


void main() async {
  final conn = await _connectToDatabase();

  if (conn == null) {
    print('Não foi possível estabelecer conexão com o banco de dados.');
    return;
  }
  print('Conectado ao banco de dados');

  try {
    print('\n----Inclusão de cliente----');
    await _incluirCliente(conn, )
    //Se possível, fazer um main para rodar o pedido da pessoa e o que ela quer fazer
    //Eu não aguento mais esses métodos desgraçados de ensino

  } catch (erro) {
    print('Erro: $erro');
  } finally {
    await conn.close();
    print('Conexão encerrada.');
  }
}

// =======================
// Funções de Conexão
// =======================
Future<MySQLConnection?> _connectToDatabase() async {
  try {
    final conn = await MySQLConnection.createConnection(
      host: _dbHost,
      port: _dbPort,
      userName: _dbUser,
      databaseName: _dbDatabase,
      password: _dbPassword,
    );
    await conn.connect();
    return conn;
  } catch (erro) {
    print('Erro ao conectar: $erro');
    return null;
  }
}

Future<void> _incluirCliente(
  MySQLConnection conn,
  String nome,
  String email,)
  async {
    await conn.execute(
      'insert into livros (titulo, autor) values (:titulo,:autor)',
      {'nome': nome,'email': email},);
      print('livro incluido sucessfull');
      try{} catch (erro) {
        print("erro na inclusão $erro");
      }
  }

Future<void> _listarLivros(MySQLConnection conn) async {
  try {
    var result = await conn.execute(
      'SELECT idlivro, titulo, autor FROM livros ORDER BY idlivro',
    );

    if (result.rows.isEmpty) {
      print('Não achei nada');
      return;
    }

    for (var linha in result.rows) {
      final id = linha.typedColByName<int>('idlivro'); 
      final titulo = linha.typedColByName<String>('titulo');
      final autor = linha.typedColByName<String>('autor');

      print('Id: $id, Título: $titulo, Autor: $autor');
    }
  } catch (erro) {
    print("Errouuuu $erro");
  }
}

