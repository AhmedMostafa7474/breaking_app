import 'package:breaking_app/Business_Layer/charcaters_cubit.dart';
import 'package:breaking_app/Business_Layer/episode_cubit.dart';
import 'package:breaking_app/Data/Models/Characters.dart';
import 'package:breaking_app/Data/Models/SeasonsScreenChoice.dart';
import 'package:breaking_app/Data/Models/Series.dart';
import 'package:breaking_app/Data/Repo/CharactersRepo.dart';
import 'package:breaking_app/Data/Repo/EpisodeRepo.dart';
import 'package:breaking_app/Data/WebServices/Characters_web_services.dart';
import 'package:breaking_app/Data/WebServices/Episode_web_services.dart';
import 'package:breaking_app/Presentation/Screens/Characters_Details.dart';
import 'package:breaking_app/Presentation/Screens/Characters_Screen.dart';
import 'package:breaking_app/Presentation/Screens/Home_Screen.dart';
import 'package:breaking_app/Presentation/Screens/Seasons_Details.dart';
import 'package:breaking_app/Presentation/Screens/Seasons_Screen.dart';
import 'package:breaking_app/Presentation/Screens/Series_Screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  late CharactersRepo _charactersRepo;
  late CharcatersCubit _charcatersCubit;
  late EpisodeRepo _episodeRepo;
  late EpisodeCubit _episodeCubit;

  AppRouter() {
    _charactersRepo = CharactersRepo(CharactersWebServices());
    _charcatersCubit = CharcatersCubit(_charactersRepo);
    _episodeRepo=EpisodeRepo(Episode_web_services());
    _episodeCubit=EpisodeCubit(_episodeRepo);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) =>  series_screen(),
            );
      case "Home":
        final _series=settings.arguments as series;
        return MaterialPageRoute(
          builder: (_) =>  home_screen(_series),
        );
      case 'Chars':
        final url=settings.arguments as List<String>;
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (BuildContext context) => _charcatersCubit,
                  child: characters_screen(url[0]),
                ));
        case 'Char_details':
          final character=settings.arguments as Character;
         return MaterialPageRoute(builder: (_)=> charactersDetails(character));
        case "Seasons":
          final _season=settings.arguments as List<String>;
          return MaterialPageRoute(
            builder: (_) =>  seasonsScreen(_season),
          );
        case 'Seasons_details':
          final argument=settings.arguments as List<String>;
          return MaterialPageRoute(builder: (_)=>BlocProvider(
              create: (BuildContext context) => _episodeCubit,
              child: season_details(argument)));
    }
  }
}
