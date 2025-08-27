import 'package:mysql_client/mysql_client.dart';

// Configuração de conexão com banco de dados
// Diretivas para conexão com o banco
const String _dbHost = '127.0.0.1'; 
const int _dbPort = 3306;

// diretivas do usuário e o nome do database (altere conforme a sua necessidade)
const String _dbUser = 'paozinho';
const String _dbPassword = 'senha';
const String _dbDatabase = 'biblioteca';
void main() async {
  // Inicializa a conexão com o banco de dados
  final conn = await _connectToDatabase();

  // se conn não conectar é null e falha a conexão
  if (conn == null) {
    print('Não foi possível estabelecer conexão com o banco de dados.');
    return;
  }

  print('Conectado ao banco de dados');

  //aqui executa os comando MySql
  try {
    print('\n--- Incluindo Livro ---');
    await _incluirLivro(conn, 'Sempre use o github', 'Dostoiévski');
    print('\n--- Listando livros ---');
    await _listarLivros(conn);
  } catch (erro) {
    print('Ocorreu na inclusão do livro: $erro');
  } finally {
      await conn.close();
      print('Conexão com o MySQL fechada.');
  }
}

// --- Funções CRUD ---

Future<MySQLConnection?> _connectToDatabase() async {

  try {
    // Usando MySQLConnection.createConnection para uma abordagem mais moderna
    final conn = await MySQLConnection.createConnection(
      host: _dbHost,
      port: _dbPort,
      userName: _dbUser,
      databaseName: _dbDatabase,
      password: _dbPassword,
      secure : true,
    );
    await conn.connect();
    return conn;
  } catch (erro) {
    print('Erro ao conectar ao banco de dados: $erro');
    return null;
  }
}


Future<void> _incluirLivro(
  MySQLConnection conn,
  String titulo,
  String autor,)
  async {
    await conn.execute(
      'insert into livros (titulo, autor) values (:titulo,:autor)',
      {'titulo': titulo,'autor': autor},);
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