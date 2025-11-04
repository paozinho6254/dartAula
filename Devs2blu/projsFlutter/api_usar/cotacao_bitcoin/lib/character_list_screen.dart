// lib/character_list_screen.dart
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'character_model.dart'; // Importamos nosso modelo
import 'character_detail_screen.dart'; // Importamos a tela de detalhe (vamos criar)

class CharacterListScreen extends StatefulWidget {
  const CharacterListScreen({super.key});

  @override
  State<CharacterListScreen> createState() => _CharacterListScreenState();
}

class _CharacterListScreenState extends State<CharacterListScreen> {
  List<Character> _characters = [];
  bool _isLoading = true;
  String? _error; // Variável para guardar mensagens de erro

  @override
  void initState() {
    super.initState();
    _fetchCharacterList();
  }

  void _navigateToDetail(int characterId) {
    // É aqui que a mágica da navegação acontece!
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CharacterDetailScreen(characterId: characterId),
      ),
    );
  }

  Future<void> _fetchCharacterList() async {
    final startTime = DateTime.now();

    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final url = Uri.parse('https://umapyoi.net/api/v1/character/info');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<Character> characters = characterListFromJson(response.body);

        // 2. Calculamos quanto tempo a API demorou
        final duration = DateTime.now().difference(startTime);

        // 3. Se demorou MENOS de 1 segundo, esperamos o restante
        if (duration < const Duration(seconds: 3)) {
          await Future.delayed(const Duration(seconds: 3) - duration);
        }

        // 4. Finalmente, atualizamos a tela
        setState(() {
          _characters = characters;
          _isLoading = false;
        });
      } else {
        // Trata erro de API
        throw Exception('Falha ao carregar lista (Código: ${response.statusCode})');
      }
    } catch (e) {
      // 2 (Erro). Calculamos o tempo mesmo em caso de erro
      final duration = DateTime.now().difference(startTime);

      // 3 (Erro). Se demorou MENOS de 1 segundo, esperamos o restante
      if (duration < const Duration(seconds: 3)) {
        await Future.delayed(const Duration(seconds: 3) - duration);
      }

      // 4 (Erro). Atualizamos a tela com o erro
      setState(() {
        _error = e.toString();
        _isLoading = false;
      });
    }
  }

  // ... (função _navigateToDetail permanece a mesma) ...

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personagens de umamusume 🐎'),
      ),
      body: _buildBody(), // Usamos uma função auxiliar para organizar
    );
  }

  // Função auxiliar para o body
  Widget _buildBody() {
    // 1. Se está carregando, mostra o GIF
    if (_isLoading) {
      return Center(
        child: Image.network(
          "https://i.redd.it/6uc7kozvbnef1.gif", // <- SEU GIF AQUI
          width: 300, // Ajuste o tamanho conforme necessário
        ),
      );
    }

    // 2. Se deu erro, mostra a mensagem
    if (_error != null) {
      return Center(
        child: Text(
          'Erro ao carregar: $_error',
          style: const TextStyle(color: Colors.red),
        ),
      );
    }

    // 3. Se tudo deu certo, mostra a lista
    return ListView.builder(
      itemCount: _characters.length,
      itemBuilder: (context, index) {
        final character = _characters[index];
        return Card(
          margin: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: Image.network(
              character.thumbImg,
              width: 50,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, progress) =>
              progress == null ? child : const CircularProgressIndicator(strokeWidth: 2),
              errorBuilder: (context, error, stackTrace) =>
              const Icon(Icons.error),
            ),
            title: Text(character.nameEn),
            subtitle: Text(character.nameJp),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              _navigateToDetail(character.id);
            },
          ),
        );
      },
    );
  }
}