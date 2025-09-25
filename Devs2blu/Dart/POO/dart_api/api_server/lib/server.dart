import 'dart:convert';
import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:shelf_router/shelf_router.dart';
import 'package:mysql_client/mysql_client.dart';

// --- Configuração do Banco ---
const String _dbHost = '127.0.0.1';
const int _dbPort = 3306;
const String _dbUser = 'root';
const String _dbPass = 'sua_senha';
const String _dbDatabase = 'meu_banco';

// Função para conectar ao banco
Future<MySQLConnection?> _connectToDatabase() async {
  try {
    final conn = await MySQLConnection.createConnection(
      host: _dbHost,
      port: _dbPort,
      userName: _dbUser,
      password: _dbPass,
      databaseName: _dbDatabase,
    );
    await conn.connect();
    return conn;
  } catch (e) {
    print('Erro ao conectar no banco: $e');
    return null;
  }
}

Future<void> main() async {
  final router = Router();

  // ------------------------------------------
  // --- Endpoints da API para Livros (CRUD) ---
  // ------------------------------------------

  // Criar livro (POST /livros)
  router.post('/livros', (Request request) async {
    final conn = await _connectToDatabase();
    if (conn == null) {
      return Response.internalServerError(
        body: jsonEncode({'message': 'Erro ao conectar ao banco de dados.'}),
      );
    }
    try {
      final String content = await utf8.decodeStream(request.read());
      if (content.isEmpty) {
        return Response.badRequest(
          body: jsonEncode({'message': 'Corpo da requisição vazio.'}),
        );
      }

      final Map<String, dynamic> body = jsonDecode(content);
      final String? titulo = body['titulo'] as String?;
      final String? autor = body['autor'] as String?;

      if (titulo == null || autor == null || titulo.isEmpty || autor.isEmpty) {
        return Response.badRequest(
          body: jsonEncode({'message': 'Título e autor são obrigatórios.'}),
        );
      }

      var result = await conn.execute(
        'INSERT INTO livros (titulo, autor) VALUES (:titulo, :autor)',
        {'titulo': titulo, 'autor': autor},
      );

      return Response(
        HttpStatus.created,
        body: jsonEncode({
          'message': 'Livro incluído com sucesso!',
          'id': result.lastInsertID.toInt(), // ⚡ BigInt → int
        }),
        headers: {'Content-Type': 'application/json; charset=utf-8'},
      );
    } catch (e) {
      print('Erro ao incluir livro na API: $e');
      return Response.internalServerError(
        body: jsonEncode({'message': 'Erro interno ao incluir livro.'}),
      );
    } finally {
      await conn.close();
    }
  });

  // TODO: aqui você pode adicionar GET /livros, PUT /livros/<id>, DELETE etc.

  // Middleware de log
  final handler =
      Pipeline().addMiddleware(logRequests()).addHandler(router);

  // Inicia o servidor
  final server = await shelf_io.serve(handler, InternetAddress.anyIPv4, 8080);
  print('✅ Servidor rodando em http://${server.address.host}:${server.port}');
}
