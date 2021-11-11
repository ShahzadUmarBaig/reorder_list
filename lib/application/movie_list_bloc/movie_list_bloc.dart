import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:reorder_list_app/domain/movie.dart';
import 'package:reorder_list_app/infrastructure/movie_service.dart';

part 'movie_list_bloc.freezed.dart';
part 'movie_list_event.dart';
part 'movie_list_state.dart';

class MovieListBloc extends Bloc<MovieListEvent, MovieListState> {
  MovieListBloc() : super(MovieListState.initial()) {
    fetchMovies(5);
    on<MoviesFetched>((event, emit) {
      emit(state.copyWith(
        moviesListOption: optionOf(event.movies),
        resultOption: optionOf(null),
      ));
    });

    on<OnReorder>((event, emit) async {
      emit(state.copyWith(submissionInProgress: true));

      List<Movie> movieList = state.moviesListOption.getOrElse(() => []);

      // Either<Error, Unit> result = await MovieService().reorderMovies(
      //   oldIndex: event.oldIndex,
      //   newIndex: event.newIndex,
      //   movies: state.moviesListOption.getOrElse(() => []),
      // );

      emit(state.copyWith(
        submissionInProgress: false,
        // resultOption: optionOf(result),
      ));
    });
  }

  fetchMovies(int limit) async {
    List<Movie> movies = await MovieService().loadMovies(limit);
    add(MovieListEvent.moviesFetched(movies: movies));
  }
}
