part of 'movie_list_bloc.dart';

@freezed
class MovieListState with _$MovieListState {
  factory MovieListState({
    required Option<List<Movie>> moviesListOption,
    required bool submissionInProgress,
    required bool lazyLoadingMovies,
    required int fetchLimit,
    required Option<Either<Error, Unit>> resultOption,
  }) = _MovieListState;

  factory MovieListState.initial() {
    return _MovieListState(
      fetchLimit: 5,
      moviesListOption: optionOf(null),
      lazyLoadingMovies: false,
      submissionInProgress: false,
      resultOption: optionOf(null),
    );
  }
}
