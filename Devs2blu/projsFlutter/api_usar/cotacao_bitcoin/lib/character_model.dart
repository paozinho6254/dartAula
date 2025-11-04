// lib/character_model.dart
import 'dart:convert';

// Função helper para decodificar a lista (vamos usar na Tela 1)
List<Character> characterListFromJson(String str) =>
    List<Character>.from(json.decode(str).map((x) => Character.fromJson(x)));

// Função helper para decodificar um único personagem (vamos usar na Tela 2)
Character characterDetailFromJson(String str) =>
    Character.fromJson(json.decode(str));

class Character {
  // --- Campos da Lista (principais) ---
  final int id;
  final String nameEn;
  final String nameJp;
  final String thumbImg;

  // --- Campos dos Detalhes (podem ser nulos) ---
  final String? profile;
  final String? sns_header;
  final int? height;
  final String? weight;
  final String? slogan;
  final int? birth_month;
  final int? birth_day;
  final String? strengths;
  final String? weaknesses;
  final String? residence;

  Character({
    required this.id,
    required this.nameEn,
    required this.nameJp,
    required this.thumbImg,
    // Opcionais
    this.profile,
    this.sns_header,
    this.height,
    this.weight,
    this.slogan,
    this.birth_month,
    this.birth_day,
    this.strengths,
    this.weaknesses,
    this.residence,
  });

  // Esta é a função "mágica" que converte o JSON em um objeto Character
  // É um "construtor de fábrica"
  factory Character.fromJson(Map<String, dynamic> json) => Character(
    // Campos obrigatórios
    id: json["id"],
    nameEn: json["name_en"],
    nameJp: json["name_jp"],
    thumbImg: json["thumb_img"],

    // Campos opcionais (só vêm na tela de detalhes)
    // Usamos '??' (null-coalescing) para garantir que sejam nulos se não existirem
    profile: json["profile"],
    sns_header: json["sns_header"],
    height: json["height"],
    weight: json["weight"],
    slogan: json["slogan"],
    birth_month: json["birth_month"],
    birth_day: json["birth_day"],
    strengths: json["strengths"],
    weaknesses: json["weaknesses"],
    residence: json["residence"],

  );
}