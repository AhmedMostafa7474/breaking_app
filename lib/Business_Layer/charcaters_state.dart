part of 'charcaters_cubit.dart';

@immutable
abstract class CharcatersState {}

class CharcatersInitial extends CharcatersState {}

class CharcatersLoaded extends CharcatersState
{
  final List<Character> characters;
  CharcatersLoaded(this.characters);
}
class CharactersError extends CharcatersState
{

}