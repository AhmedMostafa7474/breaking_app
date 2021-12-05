import 'package:bloc/bloc.dart';
import 'package:breaking_app/Data/Models/Characters.dart';
import 'package:breaking_app/Data/Repo/CharactersRepo.dart';
import 'package:meta/meta.dart';

part 'charcaters_state.dart';

class CharcatersCubit extends Cubit<CharcatersState> {
  final CharactersRepo charactersRepo;
  List<Character> chars=[];
  CharcatersCubit(this.charactersRepo) : super(CharcatersInitial());

  Future<List<Character>>GetAllCharacters(Url)
  async {
    chars=await charactersRepo.GetAllCharacters(Url);
    emit(CharcatersLoaded(chars));
    return chars;
}
}
