import 'package:bloc/bloc.dart';
import 'package:breaking_app/Data/Models/Episode.dart';
import 'package:breaking_app/Data/Repo/EpisodeRepo.dart';
import 'package:meta/meta.dart';

part 'episode_state.dart';

class EpisodeCubit extends Cubit<EpisodeState> {
  final EpisodeRepo _episodeRepo;
  List <Episode> episodes=[];
  List<List<dynamic>> _data = [];
  EpisodeCubit(this._episodeRepo) : super(EpisodeInitial());

  Future<List<Episode>>GetAllEpisodes(Url)
  async {
    print(Url);
    episodes= await _episodeRepo.GetAllEpisode(Url);
    _data =await _episodeRepo.GetEpisodeDetails();
    print(_data[1]);
    int counter=1;
    for(Episode e in episodes)
      {
        e.rate=_data[counter][3].toString();
        e.Description="\n "+_data[counter][5].toString();
        counter++;
      }
    emit(EpisodesLoaded(episodes));
    return episodes;
  }
}
