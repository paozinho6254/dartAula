import 'package:mysql_client/mysql_client.dart';

class Pedido {
  final MySQLConnection conn;

  Pedido(this.conn);

  //  Executa uma consulta SQL para inserir pedido
  Future<void> incluir(int clienteId, String descricao, double valor) async {
    try {
      // Comando para o banco
      await conn.execute(
        'INSERT INTO pedidos (cliente_id, descricao, valor) VALUES (:cliente_id, :descricao, :valor)',
        {'cliente_id': clienteId, 'descricao': descricao, 'valor': valor},
      );
      print('Pedido incluído com sucesso para cliente ID $clienteId');
    } catch (erro) {
      print('Erro na inclusão do pedido: $erro');
    }
  }

  // Consulta 1: Listagem de pedidos com dados do cliente
  Future<void> listarComCliente() async {
    try {
      // consulta SQL para exibur pedidos linkados com os clientes
      var result = await conn.execute(
        '''
        SELECT p.id, p.descricao, p.valor, c.nome, c.email 
        FROM pedidos p
        INNER JOIN clientes c ON p.cliente_id = c.id
        ORDER BY p.id
        ''',
      );

      // Se as linhas estiverem vazias retornamos tabela vazia
      if (result.rows.isEmpty) {
        print('Nenhum pedido encontrado.');
        return;
      }

      // Extrai os valores dos campos
      print('--- Listagem de Pedidos com Dados do Cliente ---');
      for (var linha in result.rows) {
        final id = linha.typedColByName<int>('id');
        final descricao = linha.typedColByName<String>('descricao');
        // Converte o valor DECIMAL para double a partir de string
        final valor = double.parse(linha.typedColByName<String>('valor') ?? '0.0');
        final nome = linha.typedColByName<String>('nome');
        final email = linha.typedColByName<String>('email');

        print('Pedido ID: $id, Descrição: $descricao, Valor: $valor, Cliente: $nome ($email)');
      }
    } catch (erro) {
      print('Erro na listagem de pedidos com cliente: $erro');
    }
  }

  // Consulta 2: Resumo de pedidos por cliente com total gasto
  Future<void> resumoPorCliente() async {
    try {
      // consulta SQL para exibur resumo dos pedidos linkados com os clientes
      var result = await conn.execute(
        '''
        SELECT c.id, c.nome, COUNT(p.id) AS num_pedidos, SUM(p.valor) AS total_gasto
        FROM clientes c
        LEFT JOIN pedidos p ON c.id = p.cliente_id
        GROUP BY c.id
        ORDER BY total_gasto DESC
        ''',
      );
      // Se as linhas estiverem vazias retornamos tabela vazia
      if (result.rows.isEmpty) {
        print('Nenhum resumo disponível.');
        return;
      }

      // se tudo der certo é retornado o resumo de cada cliente que fez pedidos
      print('--- Resumo de Pedidos por Cliente ---');
      for (var linha in result.rows) {
        final id = linha.typedColByName<int>('id');
        final nome = linha.typedColByName<String>('nome');
        final numPedidos = linha.typedColByName<int>('num_pedidos');
        // Converte o total_gasto DECIMAL para double a partir de string
        final totalGasto = double.parse(linha.typedColByName<String>('total_gasto') ?? '0.0');

        print('Cliente ID: $id, Nome: $nome, Número de Pedidos: $numPedidos, Total Gasto: $totalGasto');
      }
    } catch (erro) {
      print('Erro no resumo de pedidos por cliente: $erro');
    }
  }
}