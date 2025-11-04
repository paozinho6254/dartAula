// lib/character_detail_screen.dart
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'character_model.dart'; // Importamos nosso modelo

class CharacterDetailScreen extends StatefulWidget {
  final int characterId;

  const CharacterDetailScreen({super.key, required this.characterId});

  @override
  State<CharacterDetailScreen> createState() => _CharacterDetailScreenState();
}

class _CharacterDetailScreenState extends State<CharacterDetailScreen> {
  Character? _character;
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _fetchCharacterDetail();
  }

  Future<void> _fetchCharacterDetail() async {
    final startTime = DateTime.now();
    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final url =
      Uri.parse('https://umapyoi.net/api/v1/character/${widget.characterId}');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final Character character = characterDetailFromJson(response.body);

        final duration = DateTime.now().difference(startTime);
        if (duration < const Duration(seconds: 3)) {
          await Future.delayed(const Duration(seconds: 3) - duration);
        }

        setState(() {
          _character = character;
          _isLoading = false;
        });
      } else {
        throw Exception('Falha ao carregar detalhes (Código: ${response.statusCode})');
      }
    } catch (e) {
      final duration = DateTime.now().difference(startTime);
      if (duration < const Duration(seconds: 3)) {
        await Future.delayed(const Duration(seconds: 3) - duration);
      }
      setState(() {
        _error = e.toString();
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_character?.nameEn ?? 'Carregando...'),
      ),
      body: _buildBody(),
    );
  }

  // Função auxiliar para o body
  Widget _buildBody() {
    if (_isLoading) {
      return Center(
        child: Image.network(
          'https://i.redd.it/6uc7kozvbnef1.gif', // <- SEU GIF AQUI
          width: 300, // Ajuste o tamanho
        ),
      );
    }

    if (_error != null) {
      return Center(
        child: Text(
          'Erro ao carregar: $_error',
          style: const TextStyle(color: Colors.red),
        ),
      );
    }

    if (_character == null) {
      return const Center(child: Text('Personagem não encontrado.'));
    }

    // --- CONSTRUÇÃO PRINCIPAL DA TELA ---
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. NOVO: Usando o 'sns_header' como banner
          if (_character!.sns_header != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  _character!.sns_header!,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, progress) =>
                  progress == null ? child : const CircularProgressIndicator(),
                  errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.broken_image, size: 100, color: Colors.grey),
                ),
              ),
            ),

          Text(
            _character!.nameEn,
            style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
          Text(
            _character!.nameJp,
            style: const TextStyle(fontSize: 18, color: Colors.grey),
          ),

          if (_character!.slogan != null)
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                '"${_character!.slogan!}"',
                style: const TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
              ),
            ),

          const Divider(height: 30),

          // 2. Perfil
          Text(
            _character!.profile ?? 'Sem perfil disponível.',
            style: const TextStyle(fontSize: 16, height: 1.5), // Melhora a leitura
          ),

          const Divider(height: 30),

          // 3. NOVO: Seção de Estatísticas
          const Text(
            'Detalhes',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),

          // Usando uma função helper para formatar (veja abaixo)
          _buildStatRow(
            icon: Icons.cake_outlined,
            label: 'Aniversário',
            // Verificamos se os dois campos existem
            value: (_character!.birth_day != null && _character!.birth_month != null)
                ? '${_character!.birth_day} / ${_character!.birth_month}'
                : '??',
          ),
          _buildStatRow(
            icon: Icons.height,
            label: 'Altura',
            value: '${_character!.height ?? '??'} cm',
          ),
          _buildStatRow(
            icon: Icons.scale_outlined,
            label: 'Peso',
            value: _character!.weight ?? '??',
          ),
        ],
      ),
    );
  }

  /// --- NOVO: Widget Helper ---
  /// Criei esta função auxiliar para evitar repetição de código
  /// e manter os dados (aniversário, altura, peso) alinhados e formatados.
  Widget _buildStatRow({required IconData icon, required String label, required String value}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.blueGrey, size: 20),
          const SizedBox(width: 12),
          // Label (ex: "Altura:")
          SizedBox(
            width: 100, // Largura fixa para alinhar os valores
            child: Text(
              '$label:',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
          // Valor (ex: "167 cm")
          // Expanded garante que o texto quebre a linha se for muito longo
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
