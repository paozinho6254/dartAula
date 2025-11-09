import 'package:flutter/services.dart';

/*
  Esta classe força a máscara "999-XXXXXXXXXXXXXXX"
  - Os 3 primeiros caracteres DEVE ser dígitos [0-9].
  - Após os 3 dígitos, insere um hífen '-' automaticamente.
  - Após o hífen, permite 15 caracteres [0-9, a-z, A-Z].
  - Bloqueia qualquer outro caractere.
*/
class RfidInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    final String newText = newValue.text;
    final StringBuffer buffer = StringBuffer();
    int rawIndex = 0; // Posição no texto "cru" (sem formatação)

    // Remove qualquer hífen que o usuário tenha tentado digitar
    // para termos um texto "cru" (raw) para processar.
    final String rawText = newText.replaceAll('-', '');

    // PARTE 1: Os 3 dígitos (999)
    int digitsCount = 0;
    while (digitsCount < 3 && rawIndex < rawText.length) {
      final String char = rawText[rawIndex];
      // Se for um dígito, aceita
      if (RegExp(r'[0-9]').hasMatch(char)) {
        buffer.write(char);
        digitsCount++;
      }
      rawIndex++; // Avança no texto cru
    }

    // PARTE 2: O Hífen (-)
    // Adiciona o hífen automaticamente se já temos 3 dígitos
    // E se o usuário digitou mais coisas (que virão após o hífen)
    if (digitsCount == 3 && rawIndex < rawText.length) {
      buffer.write('-');
    }

    // PARTE 3: Os 15 caracteres (XXXXXXXXXXXXXXX)
    int charsCount = 0;
    while (charsCount < 15 && rawIndex < rawText.length) {
      final String char = rawText[rawIndex];
      // Se for dígito OU letra (alfanumérico), aceita
      if (RegExp(r'[0-9a-zA-Z]').hasMatch(char)) {
        buffer.write(char.toUpperCase());
        charsCount++;
      }
      rawIndex++; // Avança no texto cru
    }

    final String formattedText = buffer.toString();

    // Calcula a nova posição do cursor
    // Isso garante que o cursor se mova corretamente
    // mesmo quando filtramos caracteres ou adicionamos o hífen
    int selectionIndex = newValue.selection.end;

    // Calcula quantos caracteres foram "perdidos" (filtrados)
    int filteredChars = newValue.text.length - formattedText.length;

    // A nova posição é a posição antiga menos os filtrados
    int newSelection = selectionIndex - filteredChars;

    // Garante que o cursor não fique em uma posição inválida
    if (newSelection < 0) newSelection = 0;
    if (newSelection > formattedText.length) newSelection = formattedText.length;

    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(offset: newSelection),
    );
  }
}