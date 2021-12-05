import 'dart:convert';

import 'package:breaking_app/Data/Models/Characters.dart';
import 'package:breaking_app/Data/WebServices/Characters_web_services.dart';

class CharactersRepo
{
   final CharactersWebServices _charactersWebServices;

  CharactersRepo(this._charactersWebServices);

   Future<List<Character>> GetAllCharacters(Url)async
   {
      var body = await _charactersWebServices.GetAllCharacters(Url);
      var jsonresponse =json.decode(body) as List<dynamic>;
      return jsonresponse.map((e) => Character.fromJson(e)).toList();
   }
}