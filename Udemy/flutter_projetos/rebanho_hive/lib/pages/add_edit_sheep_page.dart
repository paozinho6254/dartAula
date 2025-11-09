// lib/pages/add_edit_sheep_page.dart
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:flutter/src/material/text_button.dart';
import '../utils/rfid_input_formatter.dart';
import 'package:flutter/services.dart';
import '../models/sheep_breed.dart';
import '../models/sheep_model.dart';

class AddEditSheepPage extends StatefulWidget {
  // 1. O objeto 'sheep' é opcional.
  // Se ele for nulo, estamos ADICIONANDO.
  // Se ele não for nulo, estamos EDITANDO.
  final Sheep? sheep;

  const AddEditSheepPage({super.key, this.sheep});

  @override
  State<AddEditSheepPage> createState() => _AddEditSheepPageState();
}

class _AddEditSheepPageState extends State<AddEditSheepPage> {
  // 2. Chave global para identificar e validar nosso formulário
  final _formKey = GlobalKey<FormState>();

  // 3. Controladores para os campos de texto
  late TextEditingController _rfidController;
  late TextEditingController _ageController;

  // 4. Variáveis de estado para os outros campos
  SheepBreed? _selectedBreed;
  bool _isVaccinated = false;

  // 5. Variável auxiliar para sabermos o modo da tela
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();

    // 6. LÓGICA DE EDIÇÃO:
    //    Verificamos se recebemos uma ovelha (widget.sheep)
    if (widget.sheep != null) {
      _isEditing = true;
      // Se estamos editando, preenchemos os campos com os dados existentes
      _rfidController = TextEditingController(text: widget.sheep!.rfid);
      _ageController = TextEditingController(
        text: widget.sheep!.age.toString(),
      );
      _selectedBreed = widget.sheep!.breed;
      _isVaccinated = widget.sheep!.isVaccinated;
    } else {
      // Se estamos adicionando, apenas iniciamos os controladores vazios
      _rfidController = TextEditingController();
      _ageController = TextEditingController();
    }
  }

  // 7. Boa prática: Limpar os controladores quando a tela é destruída
  @override
  void dispose() {
    _rfidController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  // 8. Função para SALVAR (Adicionar ou Editar)
  void _saveForm() {
    // 9. Valida o formulário
    if (_formKey.currentState == null || !_formKey.currentState!.validate()) {
      // Se a validação falhar, não faz nada.
      return;
    }

    // 10. Pega a caixa do Hive
    final box = Hive.box<Sheep>('sheep_box');

    // 11. Prepara o objeto com os dados do formulário
    final rfid = _rfidController.text;
    final age = int.tryParse(_ageController.text) ?? 0; // Converte para int
    final breed =
        _selectedBreed!; // '!' pois a validação garante que não é nulo
    final isVaccinated = _isVaccinated;

    if (_isEditing) {
      // 12. MODO EDIÇÃO: Atualiza os campos do objeto existente
      //     Como 'Sheep' extends 'HiveObject', podemos fazer isso:
      widget.sheep!.rfid = rfid;
      widget.sheep!.age = age;
      widget.sheep!.breed = breed;
      widget.sheep!.isVaccinated = isVaccinated;

      widget.sheep!.save(); // Salva as alterações no objeto existente
    } else {
      // 13. MODO ADIÇÃO: Cria um novo objeto
      final newSheep = Sheep(
        rfid: rfid,
        age: age,
        isVaccinated: isVaccinated,
        breed: breed,
      );

      box.add(newSheep); // Adiciona o novo objeto à caixa
    }

    // 14. ATENDENDO AO REQUISITO: Fecha a tela do formulário
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // 15. Título dinâmico
        title: Text(_isEditing ? 'Editar Ovelha' : 'Adicionar Ovelha'),
      ),
      // 17. SingleChildScrollView: Evita que o teclado "quebre" a tela
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        // 18. O Widget Form
        child: Form(
          key: _formKey,
          // Conecta a chave ao formulário
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // 19. Campo RFID
              TextFormField(
                controller: _rfidController,
                decoration: const InputDecoration(
                  labelText: 'RFID (999-XXXXXXXXXXXXXXX)',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.qr_code_scanner),
                  counterText: "",
                ),
                keyboardType: TextInputType.visiblePassword,
                inputFormatters: [
                  // 1. Limite total de 19 chars (3 + 1 + 15)
                  LengthLimitingTextInputFormatter(19),
                  // 2. Nosso formatador customizado
                  RfidInputFormatter(),
                ],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o RFID';
                  }
                  final rfidPattern = RegExp(r'^[0-9]{3}-[0-9a-zA-Z]{15}$');
                  if (!rfidPattern.hasMatch(value)) {
                    return 'Formato inválido. O RFID deve estar completo.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // 20. Campo Idade
              TextFormField(
                controller: _ageController,
                decoration: const InputDecoration(
                  labelText: 'Idade (anos)',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.calendar_today),
                ),
                keyboardType: TextInputType.number, // Teclado numérico
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira a idade';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Por favor, insira um número válido';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // 21. Campo Raça (Dropdown)
              DropdownButtonFormField<SheepBreed>(
                value: _selectedBreed,
                decoration: const InputDecoration(
                  labelText: 'Raça',
                  border: OutlineInputBorder(),
                ),
                hint: const Text('Selecione a raça...'),
                // Mapeia os valores do Enum (dorper, texel, ...)
                // para itens no Dropdown
                items: SheepBreed.values.map((breed) {
                  return DropdownMenuItem(
                    value: breed,
                    child: Text(getBreedName(breed)), // 'Dorper', 'Texel', ...
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedBreed = value;
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return 'Por favor, selecione a raça';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // 22. Campo Vacinada (Switch)
              //    ATENDENDO AO REQUISITO: "botão de Iphone" (Switch)
              SwitchListTile(
                title: const Text('Vacinada?'),
                value: _isVaccinated,
                onChanged: (newValue) {
                  setState(() {
                    _isVaccinated = newValue;
                  });
                },
                secondary: Icon(
                  _isVaccinated ? Icons.check_circle : Icons.cancel,
                  color: _isVaccinated ? Colors.green : Colors.grey,
                ),
              ),
              // 16. Botão de Salvar na AppBar
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          //Altura em relação a bottom do app
          heightFactor: 1.5,
          child: TextButton.icon(
            icon: Icon(Icons.save, color: Colors.black, size: 24),

            label: Text(
              'Salvar',
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),

            onPressed: _saveForm,

            style: TextButton.styleFrom(
              backgroundColor: Colors.lightGreen,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(40),
              ),
              side: const BorderSide(width: 2),
              padding: EdgeInsetsGeometry.all(30),
            ),
          ),
        )
      ),
    );
  }
}
