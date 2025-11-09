import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Para o SystemNavigator
import 'package:hive_flutter/hive_flutter.dart'; // Para o ValueListenableBuilder e o Hive
import 'add_edit_sheep_page.dart';

import '../models/sheep_breed.dart'; // Para nosso Enum e a função 'getBreedName'
import '../models/sheep_model.dart'; // Para o objeto Sheep

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _navigateToForm(BuildContext context, {Sheep? sheep}) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddEditSheepPage(sheep: sheep)),
    );
  }

  @override
  Widget build(BuildContext context) {
    // 1. O ValueListenableBuilder "escuta" a nossa caixa de ovelhas.
    //    Ele vai se reconstruir (e tudo abaixo dele) sempre que a caixa mudar.
    return ValueListenableBuilder<Box<Sheep>>(
      // 2. Apontamos para a caixa que abrimos no main.dart
      valueListenable: Hive.box<Sheep>('sheep_box').listenable(),

      // 3. O 'builder' é a função que desenha a tela.
      //    Ela nos dá a 'box' atualizada.
      builder: (context, box, _) {
        // 4. Pegamos todos os valores de dentro da caixa e transformamos em uma Lista
        final sheepList = box.values.toList();

        return Scaffold(
          appBar: AppBar(
            // 5. ATENDENDO AO REQUISITO: Contar as ovelhas
            title: Text('Meu Rebanho (${sheepList.length})'),
          ),

          // 7. Corpo da página
          body: _buildBody(sheepList), // Estamos separando a lógica do corpo
          // 8. Botão flutuante para adicionar novas ovelhas (próximo passo)
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              _navigateToForm(context);
            },
            tooltip: 'Adicionar Ovelha',
            child: const Icon(Icons.add),
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(16),
            child: Center(
              heightFactor: 1.5,
              child: TextButton.icon(
                onPressed: SystemNavigator.pop,
                icon: Icon(Icons.exit_to_app_rounded, size: 28),
                label: Text('Clique para sair', style: TextStyle(fontSize: 24)),
                
              ),
            ),
          ),
        );
      },
    );
  }

  // Widget auxiliar para construir o corpo
  Widget _buildBody(List<Sheep> sheepList) {
    if (sheepList.isEmpty) {
      return const Center(
        child: Text(
          'Nenhuma ovelha cadastrada.\nClique no botão "+" para adicionar.',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16),
        ),
      );
    }

    // Se a lista não está vazia, mostramos o ListView
    // Usamos .builder para performance (só constrói o que está na tela)
    return ListView.builder(
      itemCount: sheepList.length,
      itemBuilder: (context, index) {
        // Pega a ovelha específica desta linha
        final sheep = sheepList[index];

        // 11. ListTile é o widget padrão para linhas de lista
        return ListTile(
          leading: const Icon(Icons.pets, size: 36),
          // Um ícone para a ovelha

          // 12. Mostramos o RFID (identificador) e a Raça
          title: Text('${sheep.rfid} - ${getBreedName(sheep.breed)}'),
          subtitle: Text('${sheep.getBreedVaccinated()}'),
          // Usando nossa função auxiliar

          // 13. ATENDENDO AO REQUISITO: Botão de editar
          trailing: IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              _navigateToForm(context, sheep: sheep);
            },
          ),
        );
      },
    );
  }
}
