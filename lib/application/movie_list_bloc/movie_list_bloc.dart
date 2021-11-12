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
        lazyLoadingMovies: false,
        resultOption: optionOf(null),
      ));
    });

    on<OnEndOfPage>((event, emit) async {
      emit(state.copyWith(
        lazyLoadingMovies: true,
        fetchLimit: state.fetchLimit + 5,
        resultOption: optionOf(null),
      ));
      List<Movie> movies = await MovieService().loadMovies(state.fetchLimit);
      add(MovieListEvent.moviesFetched(movies: movies));
    });

    on<OnReorder>((event, emit) async {
      List<Movie> movieListBeforeUpdate = [];
      movieListBeforeUpdate.addAll(state.moviesListOption.getOrElse(() => []));
      List<Movie> updatedMoviesLocally = reorderMoviesLocally(
        newIndex: event.newIndex,
        oldIndex: event.oldIndex,
        movieListBeforeUpdate: movieListBeforeUpdate,
      );
      emit(state.copyWith(
        submissionInProgress: true,
        moviesListOption: optionOf(updatedMoviesLocally),
        resultOption: optionOf(null),
      ));

      Either<Error, Unit> result = await MovieService().reorderMovies(
        oldIndex: event.oldIndex,
        newIndex: event.newIndex,
        movies: movieListBeforeUpdate,
      );

      emit(state.copyWith(
        submissionInProgress: false,
        resultOption: optionOf(result),
      ));
    });
  }

  fetchMovies(int limit) async {
    List<Movie> movies = await MovieService().loadMovies(limit);
    add(MovieListEvent.moviesFetched(movies: movies));
  }

  List<Movie> reorderMoviesLocally({
    required int oldIndex,
    required int newIndex,
    required List<Movie> movieListBeforeUpdate,
  }) {
    List<Movie> movieList = [];
    movieList.addAll(movieListBeforeUpdate);

    if (oldIndex < newIndex) {
      newIndex -= 1;
      // batch.update(myCollection.doc(movies[newIndex].id), {'index': oldIndex});
      for (int i = oldIndex + 1; i <= newIndex && i < movieList.length; i++) {
        Movie movie = movieList[i];
        Movie updatedMovie = Movie(
          index: i - 1,
          name: movie.name,
          number: movie.number,
          id: movie.id,
        );
        movieList[i] = updatedMovie;
      }

      Movie movie = movieList[oldIndex];
      Movie updatedMovie = Movie(
        index: newIndex,
        name: movie.name,
        number: movie.number,
        id: movie.id,
      );
      movieList[oldIndex] = updatedMovie;
    }
    if (newIndex < oldIndex) {
      // batch.update(myCollection.doc(movies[newIndex].id), {'index': oldIndex});
      for (int i = newIndex; i < oldIndex; i++) {
        Movie movie = movieList[i];
        Movie updatedMovie = Movie(
          index: i + 1,
          name: movie.name,
          number: movie.number,
          id: movie.id,
        );
        movieList[i] = updatedMovie;
      }

      Movie movie = movieList[oldIndex];
      Movie updatedMovie = Movie(
        index: newIndex,
        name: movie.name,
        number: movie.number,
        id: movie.id,
      );
      movieList[oldIndex] = updatedMovie;
    }
    movieList.sort((a, b) => a.index > b.index ? 1 : -1);
    return movieList;
  }
}
