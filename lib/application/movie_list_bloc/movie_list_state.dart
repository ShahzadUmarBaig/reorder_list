part of 'movie_list_bloc.dart';

@freezed
class MovieListState with _$MovieListState {
  factory MovieListState({
    required Option<List<Movie>> moviesListOption,
    required bool submissionInProgress,
    required Option<Either<Error, Unit>> resultOption,
  }) = _MovieListState;

  factory MovieListState.initial() {
    return _MovieListState(
      moviesListOption: optionOf(MovieService.movieList),
      submissionInProgress: false,
      resultOption: optionOf(null),
    );
  }
}
