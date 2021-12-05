import 'dart:convert';

import 'package:breaking_app/Data/Models/Episode.dart';
import 'package:breaking_app/Data/WebServices/Episode_web_services.dart';
import 'package:csv/csv.dart';
import 'package:flutter/services.dart';

class EpisodeRepo {
  Episode_web_services _episode_web_services;

  EpisodeRepo(this._episode_web_services);

  Future<List<Episode>> GetAllEpisode(String Url) async {
    var body = await _episode_web_services.GetAllEpisode(Url);
    var jsonresponse = json.decode(body) as List<dynamic>;
    return jsonresponse.map((e) => Episode.fromJson(e)).toList();
  }
  Future<List<List<dynamic>>> GetEpisodeDetails()
  async{
    final _rawData = await rootBundle.loadString("assets/BreakingBadData.csv");
    List<List<dynamic>> _listData = CsvToListConverter().convert(_rawData);
    return _listData;
  }
}