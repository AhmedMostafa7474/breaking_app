part of 'episode_cubit.dart';

@immutable
abstract class EpisodeState {}

class EpisodeInitial extends EpisodeState {}
class EpisodesLoaded extends EpisodeState
{
  final List<Episode> episodes;
  EpisodesLoaded(this.episodes);
}
class EpisodesError extends EpisodeState
{

}