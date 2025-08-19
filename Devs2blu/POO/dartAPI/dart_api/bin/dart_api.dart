import 'dart:io';
import 'dart:convert';
import 'package:mysql_client/mysql_client.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:shelf_router/shelf_router.dart';

// --- Configuração de Conexão com Banco de Dados (copiado do banco01.dart) ---
const String _dbHost = '127.0.0.1';
const int _dbPort = 3306;
const String _dbUser = 'marcio';
const String _dbPassword = 'senha';
const String _dbDatabase = 'biblioteca1';

Future<MySQLConnection?> _connectToDatabase() async {
  try {
    final conn = await MySQLConnection.createConnection(
      host: _dbHost,
      port: _dbPort,
      userName: _dbUser,
      databaseName: _dbDatabase,
      password: _dbPassword,
      secure: false,
    );
    await conn.connect();
    return conn;
  } catch (erro) {
    print('Erro ao conectar ao banco de dados: $erro');
    return null;
  }
}

void main() async {
  final Router _router = Router();
  final int serverPort = 8083; // Mantemos 8083 conforme seu teste

  // --- Handler para a rota raiz (opcional) ---
  _router.get('/', (Request request) {
    return Response.ok('Bem-vindo à API da Biblioteca!');
  });

  // ------------------------------------------
  // --- Endpoints da API para Livros (CRUD) ---
  // ------------------------------------------

  // Criar a pipeline de middlewares (logRequests para ver requisições no console)
  final handler = Pipeline()
      .addMiddleware(logRequests())
      .addHandler(_router.call);

  // Iniciar o servidor HTTP
  try {
    final server = await shelf_io.serve(
      handler,
      InternetAddress.loopbackIPv4,
      serverPort,
    );
    print(
      'Servidor API ouvindo em http://${server.address.host}:${server.port}',
    );
  } on SocketException catch (e) {
    if (e.message.contains('permissões de acesso') ||
        e.osError?.errorCode == 10013 ||
        e.osError?.errorCode == 10048 ||
        e.message.contains('já está em uso') ||
        e.message.contains('Address already in use')) {
      print(
        '\n========================================================================',
      );
      print(
        'ERRO: A porta $serverPort já está em uso ou você não tem permissão para usá-la.',
      );
      print('Por favor, verifique se outro programa está utilizando a porta.');
      print('Você pode tentar:');
      print(
        '  1. Mudar a porta no código (ex: para 8081, 9000, etc.) e reiniciar o servidor.',
      );
      print('  2. Fechar o programa que está usando a porta $serverPort.');
      print(
        '========================================================================\n',
      );
    } else {
      print('Ocorreu um erro de rede inesperado ao iniciar o servidor: $e');
    }
  } catch (e) {
    print('Ocorreu um erro inesperado ao iniciar o servidor: $e');
  }
}
