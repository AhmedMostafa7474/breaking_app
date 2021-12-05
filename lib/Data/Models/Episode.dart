// To parse this JSON data, do
//
//     final episode = episodeFromJson(jsonString);

import 'dart:convert';

Episode episodeFromJson(String str) => Episode.fromJson(json.decode(str));

String episodeToJson(Episode data) => json.encode(data.toJson());

class Episode {
  Episode({
    required this.episodeId,
    required this.title,
    required  this.season,
    required this.episode,
    required this.airDate,
    required this.characters,
  });

  int episodeId;
  String title;
  String season;
  String episode;
  String airDate;
  List<String> characters;
  String rate="0.0";
  String Description="";
  factory Episode.fromJson(Map<String, dynamic> json) => Episode(
    episodeId: json["episode_id"],
    title: json["title"],
    season: json["season"],
    episode: json["episode"],
    airDate: json["air_date"],
    characters: List<String>.from(json["characters"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "episode_id": episodeId,
    "title": title,
    "season": season,
    "episode": episode,
    "air_date": airDate,
    "characters": List<dynamic>.from(characters.map((x) => x)),
  };
}
