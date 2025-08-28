import 'package:mysql_client/mysql_client.dart';
import 'cliente.dart';
import 'pedido.dart';

// Configuração de conexão com banco de dados, alterar com base no user e localhost... que for acessar!
const String _dbHost = '127.0.0.1';
const int _dbPort = 3306;
const String _dbUser = 'paozinho'; 
const String _dbPassword = 'senha'; 
const String _dbDatabase = 'loja'; 

void main() async {
  // Inicializa a conexão com o banco de dados
  final conn = await _connectToDatabase();

  // Se conexão for nula ele retorna vazio sem se conectar com o banco
  if (conn == null) {
    print('Não foi possível estabelecer conexão com o banco de dados.');
    return;
  }

  print('Conectado ao banco de dados');

  // Instâncias das classes
  final clienteRepo = Cliente(conn);
  final pedidoRepo = Pedido(conn);

  try {
    // Incluir clientes
    print('\n--- Incluindo Clientes ---');
    await clienteRepo.incluir('João Silva', 'joao@example.com');
    await clienteRepo.incluir('Maria Oliveira', 'maria@example.com');

    // Incluir pedidos ( IDs 1 e 2 dos clientes inseridos)
    print('\n--- Incluindo Pedidos ---');
    await pedidoRepo.incluir(1, 'Pedido de eletrônicos', 150.50);
    await pedidoRepo.incluir(1, 'Pedido de livros', 80.00);
    await pedidoRepo.incluir(2, 'Pedido de roupas', 200.00);

    // Consulta 1: Listar pedidos com dados do cliente
    await pedidoRepo.listarComCliente();

    // Consulta 2: Resumo por cliente
    await pedidoRepo.resumoPorCliente();
  } catch (erro) {
    print('Ocorreu um erro: $erro');
  } finally {
    await conn.close();
    print('Conexão com o MySQL fechada.');
  }
}

// Responsavel por connectar ao banco, pegando as informações no topo e usando aqui
Future<MySQLConnection?> _connectToDatabase() async {
  try {
    final conn = await MySQLConnection.createConnection(
      host: _dbHost,
      port: _dbPort,
      userName: _dbUser,
      databaseName: _dbDatabase,
      password: _dbPassword,
    );
    // Espera conexão
    await conn.connect();
    // para retornar e testar se tem erro e o catch pega
    return conn;
  } catch (erro) {
    print('Erro ao conectar ao banco de dados: $erro');
    return null;
  }
}