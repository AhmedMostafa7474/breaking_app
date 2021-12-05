// To parse this JSON data, do
//
//     final character = characterFromJson(jsonString);

import 'dart:convert';

Character characterFromJson(String str) => Character.fromJson(json.decode(str));

String characterToJson(Character data) => json.encode(data.toJson());

class Character {
  Character({
    required this.charId,
    required this.name,
    required this.birthday,
    required this.occupation,
    required this.img,
    required  this.status,
    required  this.appearance,
    required  this.nickname,
    required this.portrayed,
  });

  int charId;
  String name;
  String birthday;
  List<String> occupation;
  String img;
  String status;
  List<int> appearance;
  String nickname;
  String portrayed;

  factory Character.fromJson(Map<String, dynamic> json) => Character(
    charId: json["char_id"],
    name: json["name"],
    birthday: json["birthday"],
    occupation: List<String>.from(json["occupation"].map((x) => x)),
    img: json["img"],
    status: json["status"],
    appearance: List<int>.from(json["appearance"].map((x) => x)),
    nickname: json["nickname"],
    portrayed: json["portrayed"],
  );

  Map<String, dynamic> toJson() => {
    "char_id": charId,
    "name": name,
    "birthday": birthday,
    "occupation": List<dynamic>.from(occupation.map((x) => x)),
    "img": img,
    "status": status,
    "appearance": List<dynamic>.from(appearance.map((x) => x)),
    "nickname": nickname,
    "portrayed": portrayed,
  };
}
