part of 'movie_list_bloc.dart';

@freezed
class MovieListEvent with _$MovieListEvent {
  factory MovieListEvent.onReorder({
    required int oldIndex,
    required int newIndex,
  }) = OnReorder;

  factory MovieListEvent.moviesFetched({
    required List<Movie> movies,
  }) = MoviesFetched;
}
