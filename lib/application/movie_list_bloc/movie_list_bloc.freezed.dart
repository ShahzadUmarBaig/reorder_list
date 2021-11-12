// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'movie_list_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$MovieListEventTearOff {
  const _$MovieListEventTearOff();

  OnReorder onReorder({required int oldIndex, required int newIndex}) {
    return OnReorder(
      oldIndex: oldIndex,
      newIndex: newIndex,
    );
  }

  MoviesFetched moviesFetched({required List<Movie> movies}) {
    return MoviesFetched(
      movies: movies,
    );
  }

  OnEndOfPage onEndOfPage() {
    return OnEndOfPage();
  }
}

/// @nodoc
const $MovieListEvent = _$MovieListEventTearOff();

/// @nodoc
mixin _$MovieListEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int oldIndex, int newIndex) onReorder,
    required TResult Function(List<Movie> movies) moviesFetched,
    required TResult Function() onEndOfPage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int oldIndex, int newIndex)? onReorder,
    TResult Function(List<Movie> movies)? moviesFetched,
    TResult Function()? onEndOfPage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int oldIndex, int newIndex)? onReorder,
    TResult Function(List<Movie> movies)? moviesFetched,
    TResult Function()? onEndOfPage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnReorder value) onReorder,
    required TResult Function(MoviesFetched value) moviesFetched,
    required TResult Function(OnEndOfPage value) onEndOfPage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(OnReorder value)? onReorder,
    TResult Function(MoviesFetched value)? moviesFetched,
    TResult Function(OnEndOfPage value)? onEndOfPage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnReorder value)? onReorder,
    TResult Function(MoviesFetched value)? moviesFetched,
    TResult Function(OnEndOfPage value)? onEndOfPage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovieListEventCopyWith<$Res> {
  factory $MovieListEventCopyWith(
          MovieListEvent value, $Res Function(MovieListEvent) then) =
      _$MovieListEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$MovieListEventCopyWithImpl<$Res>
    implements $MovieListEventCopyWith<$Res> {
  _$MovieListEventCopyWithImpl(this._value, this._then);

  final MovieListEvent _value;
  // ignore: unused_field
  final $Res Function(MovieListEvent) _then;
}

/// @nodoc
abstract class $OnReorderCopyWith<$Res> {
  factory $OnReorderCopyWith(OnReorder value, $Res Function(OnReorder) then) =
      _$OnReorderCopyWithImpl<$Res>;
  $Res call({int oldIndex, int newIndex});
}

/// @nodoc
class _$OnReorderCopyWithImpl<$Res> extends _$MovieListEventCopyWithImpl<$Res>
    implements $OnReorderCopyWith<$Res> {
  _$OnReorderCopyWithImpl(OnReorder _value, $Res Function(OnReorder) _then)
      : super(_value, (v) => _then(v as OnReorder));

  @override
  OnReorder get _value => super._value as OnReorder;

  @override
  $Res call({
    Object? oldIndex = freezed,
    Object? newIndex = freezed,
  }) {
    return _then(OnReorder(
      oldIndex: oldIndex == freezed
          ? _value.oldIndex
          : oldIndex // ignore: cast_nullable_to_non_nullable
              as int,
      newIndex: newIndex == freezed
          ? _value.newIndex
          : newIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$OnReorder implements OnReorder {
  _$OnReorder({required this.oldIndex, required this.newIndex});

  @override
  final int oldIndex;
  @override
  final int newIndex;

  @override
  String toString() {
    return 'MovieListEvent.onReorder(oldIndex: $oldIndex, newIndex: $newIndex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OnReorder &&
            (identical(other.oldIndex, oldIndex) ||
                other.oldIndex == oldIndex) &&
            (identical(other.newIndex, newIndex) ||
                other.newIndex == newIndex));
  }

  @override
  int get hashCode => Object.hash(runtimeType, oldIndex, newIndex);

  @JsonKey(ignore: true)
  @override
  $OnReorderCopyWith<OnReorder> get copyWith =>
      _$OnReorderCopyWithImpl<OnReorder>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int oldIndex, int newIndex) onReorder,
    required TResult Function(List<Movie> movies) moviesFetched,
    required TResult Function() onEndOfPage,
  }) {
    return onReorder(oldIndex, newIndex);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int oldIndex, int newIndex)? onReorder,
    TResult Function(List<Movie> movies)? moviesFetched,
    TResult Function()? onEndOfPage,
  }) {
    return onReorder?.call(oldIndex, newIndex);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int oldIndex, int newIndex)? onReorder,
    TResult Function(List<Movie> movies)? moviesFetched,
    TResult Function()? onEndOfPage,
    required TResult orElse(),
  }) {
    if (onReorder != null) {
      return onReorder(oldIndex, newIndex);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnReorder value) onReorder,
    required TResult Function(MoviesFetched value) moviesFetched,
    required TResult Function(OnEndOfPage value) onEndOfPage,
  }) {
    return onReorder(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(OnReorder value)? onReorder,
    TResult Function(MoviesFetched value)? moviesFetched,
    TResult Function(OnEndOfPage value)? onEndOfPage,
  }) {
    return onReorder?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnReorder value)? onReorder,
    TResult Function(MoviesFetched value)? moviesFetched,
    TResult Function(OnEndOfPage value)? onEndOfPage,
    required TResult orElse(),
  }) {
    if (onReorder != null) {
      return onReorder(this);
    }
    return orElse();
  }
}

abstract class OnReorder implements MovieListEvent {
  factory OnReorder({required int oldIndex, required int newIndex}) =
      _$OnReorder;

  int get oldIndex;
  int get newIndex;
  @JsonKey(ignore: true)
  $OnReorderCopyWith<OnReorder> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MoviesFetchedCopyWith<$Res> {
  factory $MoviesFetchedCopyWith(
          MoviesFetched value, $Res Function(MoviesFetched) then) =
      _$MoviesFetchedCopyWithImpl<$Res>;
  $Res call({List<Movie> movies});
}

/// @nodoc
class _$MoviesFetchedCopyWithImpl<$Res>
    extends _$MovieListEventCopyWithImpl<$Res>
    implements $MoviesFetchedCopyWith<$Res> {
  _$MoviesFetchedCopyWithImpl(
      MoviesFetched _value, $Res Function(MoviesFetched) _then)
      : super(_value, (v) => _then(v as MoviesFetched));

  @override
  MoviesFetched get _value => super._value as MoviesFetched;

  @override
  $Res call({
    Object? movies = freezed,
  }) {
    return _then(MoviesFetched(
      movies: movies == freezed
          ? _value.movies
          : movies // ignore: cast_nullable_to_non_nullable
              as List<Movie>,
    ));
  }
}

/// @nodoc

class _$MoviesFetched implements MoviesFetched {
  _$MoviesFetched({required this.movies});

  @override
  final List<Movie> movies;

  @override
  String toString() {
    return 'MovieListEvent.moviesFetched(movies: $movies)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MoviesFetched &&
            const DeepCollectionEquality().equals(other.movies, movies));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(movies));

  @JsonKey(ignore: true)
  @override
  $MoviesFetchedCopyWith<MoviesFetched> get copyWith =>
      _$MoviesFetchedCopyWithImpl<MoviesFetched>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int oldIndex, int newIndex) onReorder,
    required TResult Function(List<Movie> movies) moviesFetched,
    required TResult Function() onEndOfPage,
  }) {
    return moviesFetched(movies);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int oldIndex, int newIndex)? onReorder,
    TResult Function(List<Movie> movies)? moviesFetched,
    TResult Function()? onEndOfPage,
  }) {
    return moviesFetched?.call(movies);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int oldIndex, int newIndex)? onReorder,
    TResult Function(List<Movie> movies)? moviesFetched,
    TResult Function()? onEndOfPage,
    required TResult orElse(),
  }) {
    if (moviesFetched != null) {
      return moviesFetched(movies);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnReorder value) onReorder,
    required TResult Function(MoviesFetched value) moviesFetched,
    required TResult Function(OnEndOfPage value) onEndOfPage,
  }) {
    return moviesFetched(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(OnReorder value)? onReorder,
    TResult Function(MoviesFetched value)? moviesFetched,
    TResult Function(OnEndOfPage value)? onEndOfPage,
  }) {
    return moviesFetched?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnReorder value)? onReorder,
    TResult Function(MoviesFetched value)? moviesFetched,
    TResult Function(OnEndOfPage value)? onEndOfPage,
    required TResult orElse(),
  }) {
    if (moviesFetched != null) {
      return moviesFetched(this);
    }
    return orElse();
  }
}

abstract class MoviesFetched implements MovieListEvent {
  factory MoviesFetched({required List<Movie> movies}) = _$MoviesFetched;

  List<Movie> get movies;
  @JsonKey(ignore: true)
  $MoviesFetchedCopyWith<MoviesFetched> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OnEndOfPageCopyWith<$Res> {
  factory $OnEndOfPageCopyWith(
          OnEndOfPage value, $Res Function(OnEndOfPage) then) =
      _$OnEndOfPageCopyWithImpl<$Res>;
}

/// @nodoc
class _$OnEndOfPageCopyWithImpl<$Res> extends _$MovieListEventCopyWithImpl<$Res>
    implements $OnEndOfPageCopyWith<$Res> {
  _$OnEndOfPageCopyWithImpl(
      OnEndOfPage _value, $Res Function(OnEndOfPage) _then)
      : super(_value, (v) => _then(v as OnEndOfPage));

  @override
  OnEndOfPage get _value => super._value as OnEndOfPage;
}

/// @nodoc

class _$OnEndOfPage implements OnEndOfPage {
  _$OnEndOfPage();

  @override
  String toString() {
    return 'MovieListEvent.onEndOfPage()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is OnEndOfPage);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int oldIndex, int newIndex) onReorder,
    required TResult Function(List<Movie> movies) moviesFetched,
    required TResult Function() onEndOfPage,
  }) {
    return onEndOfPage();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int oldIndex, int newIndex)? onReorder,
    TResult Function(List<Movie> movies)? moviesFetched,
    TResult Function()? onEndOfPage,
  }) {
    return onEndOfPage?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int oldIndex, int newIndex)? onReorder,
    TResult Function(List<Movie> movies)? moviesFetched,
    TResult Function()? onEndOfPage,
    required TResult orElse(),
  }) {
    if (onEndOfPage != null) {
      return onEndOfPage();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnReorder value) onReorder,
    required TResult Function(MoviesFetched value) moviesFetched,
    required TResult Function(OnEndOfPage value) onEndOfPage,
  }) {
    return onEndOfPage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(OnReorder value)? onReorder,
    TResult Function(MoviesFetched value)? moviesFetched,
    TResult Function(OnEndOfPage value)? onEndOfPage,
  }) {
    return onEndOfPage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnReorder value)? onReorder,
    TResult Function(MoviesFetched value)? moviesFetched,
    TResult Function(OnEndOfPage value)? onEndOfPage,
    required TResult orElse(),
  }) {
    if (onEndOfPage != null) {
      return onEndOfPage(this);
    }
    return orElse();
  }
}

abstract class OnEndOfPage implements MovieListEvent {
  factory OnEndOfPage() = _$OnEndOfPage;
}

/// @nodoc
class _$MovieListStateTearOff {
  const _$MovieListStateTearOff();

  _MovieListState call(
      {required Option<List<Movie>> moviesListOption,
      required bool submissionInProgress,
      required bool lazyLoadingMovies,
      required int fetchLimit,
      required Option<Either<Error, Unit>> resultOption}) {
    return _MovieListState(
      moviesListOption: moviesListOption,
      submissionInProgress: submissionInProgress,
      lazyLoadingMovies: lazyLoadingMovies,
      fetchLimit: fetchLimit,
      resultOption: resultOption,
    );
  }
}

/// @nodoc
const $MovieListState = _$MovieListStateTearOff();

/// @nodoc
mixin _$MovieListState {
  Option<List<Movie>> get moviesListOption =>
      throw _privateConstructorUsedError;
  bool get submissionInProgress => throw _privateConstructorUsedError;
  bool get lazyLoadingMovies => throw _privateConstructorUsedError;
  int get fetchLimit => throw _privateConstructorUsedError;
  Option<Either<Error, Unit>> get resultOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MovieListStateCopyWith<MovieListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovieListStateCopyWith<$Res> {
  factory $MovieListStateCopyWith(
          MovieListState value, $Res Function(MovieListState) then) =
      _$MovieListStateCopyWithImpl<$Res>;
  $Res call(
      {Option<List<Movie>> moviesListOption,
      bool submissionInProgress,
      bool lazyLoadingMovies,
      int fetchLimit,
      Option<Either<Error, Unit>> resultOption});
}

/// @nodoc
class _$MovieListStateCopyWithImpl<$Res>
    implements $MovieListStateCopyWith<$Res> {
  _$MovieListStateCopyWithImpl(this._value, this._then);

  final MovieListState _value;
  // ignore: unused_field
  final $Res Function(MovieListState) _then;

  @override
  $Res call({
    Object? moviesListOption = freezed,
    Object? submissionInProgress = freezed,
    Object? lazyLoadingMovies = freezed,
    Object? fetchLimit = freezed,
    Object? resultOption = freezed,
  }) {
    return _then(_value.copyWith(
      moviesListOption: moviesListOption == freezed
          ? _value.moviesListOption
          : moviesListOption // ignore: cast_nullable_to_non_nullable
              as Option<List<Movie>>,
      submissionInProgress: submissionInProgress == freezed
          ? _value.submissionInProgress
          : submissionInProgress // ignore: cast_nullable_to_non_nullable
              as bool,
      lazyLoadingMovies: lazyLoadingMovies == freezed
          ? _value.lazyLoadingMovies
          : lazyLoadingMovies // ignore: cast_nullable_to_non_nullable
              as bool,
      fetchLimit: fetchLimit == freezed
          ? _value.fetchLimit
          : fetchLimit // ignore: cast_nullable_to_non_nullable
              as int,
      resultOption: resultOption == freezed
          ? _value.resultOption
          : resultOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<Error, Unit>>,
    ));
  }
}

/// @nodoc
abstract class _$MovieListStateCopyWith<$Res>
    implements $MovieListStateCopyWith<$Res> {
  factory _$MovieListStateCopyWith(
          _MovieListState value, $Res Function(_MovieListState) then) =
      __$MovieListStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {Option<List<Movie>> moviesListOption,
      bool submissionInProgress,
      bool lazyLoadingMovies,
      int fetchLimit,
      Option<Either<Error, Unit>> resultOption});
}

/// @nodoc
class __$MovieListStateCopyWithImpl<$Res>
    extends _$MovieListStateCopyWithImpl<$Res>
    implements _$MovieListStateCopyWith<$Res> {
  __$MovieListStateCopyWithImpl(
      _MovieListState _value, $Res Function(_MovieListState) _then)
      : super(_value, (v) => _then(v as _MovieListState));

  @override
  _MovieListState get _value => super._value as _MovieListState;

  @override
  $Res call({
    Object? moviesListOption = freezed,
    Object? submissionInProgress = freezed,
    Object? lazyLoadingMovies = freezed,
    Object? fetchLimit = freezed,
    Object? resultOption = freezed,
  }) {
    return _then(_MovieListState(
      moviesListOption: moviesListOption == freezed
          ? _value.moviesListOption
          : moviesListOption // ignore: cast_nullable_to_non_nullable
              as Option<List<Movie>>,
      submissionInProgress: submissionInProgress == freezed
          ? _value.submissionInProgress
          : submissionInProgress // ignore: cast_nullable_to_non_nullable
              as bool,
      lazyLoadingMovies: lazyLoadingMovies == freezed
          ? _value.lazyLoadingMovies
          : lazyLoadingMovies // ignore: cast_nullable_to_non_nullable
              as bool,
      fetchLimit: fetchLimit == freezed
          ? _value.fetchLimit
          : fetchLimit // ignore: cast_nullable_to_non_nullable
              as int,
      resultOption: resultOption == freezed
          ? _value.resultOption
          : resultOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<Error, Unit>>,
    ));
  }
}

/// @nodoc

class _$_MovieListState implements _MovieListState {
  _$_MovieListState(
      {required this.moviesListOption,
      required this.submissionInProgress,
      required this.lazyLoadingMovies,
      required this.fetchLimit,
      required this.resultOption});

  @override
  final Option<List<Movie>> moviesListOption;
  @override
  final bool submissionInProgress;
  @override
  final bool lazyLoadingMovies;
  @override
  final int fetchLimit;
  @override
  final Option<Either<Error, Unit>> resultOption;

  @override
  String toString() {
    return 'MovieListState(moviesListOption: $moviesListOption, submissionInProgress: $submissionInProgress, lazyLoadingMovies: $lazyLoadingMovies, fetchLimit: $fetchLimit, resultOption: $resultOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MovieListState &&
            (identical(other.moviesListOption, moviesListOption) ||
                other.moviesListOption == moviesListOption) &&
            (identical(other.submissionInProgress, submissionInProgress) ||
                other.submissionInProgress == submissionInProgress) &&
            (identical(other.lazyLoadingMovies, lazyLoadingMovies) ||
                other.lazyLoadingMovies == lazyLoadingMovies) &&
            (identical(other.fetchLimit, fetchLimit) ||
                other.fetchLimit == fetchLimit) &&
            (identical(other.resultOption, resultOption) ||
                other.resultOption == resultOption));
  }

  @override
  int get hashCode => Object.hash(runtimeType, moviesListOption,
      submissionInProgress, lazyLoadingMovies, fetchLimit, resultOption);

  @JsonKey(ignore: true)
  @override
  _$MovieListStateCopyWith<_MovieListState> get copyWith =>
      __$MovieListStateCopyWithImpl<_MovieListState>(this, _$identity);
}

abstract class _MovieListState implements MovieListState {
  factory _MovieListState(
      {required Option<List<Movie>> moviesListOption,
      required bool submissionInProgress,
      required bool lazyLoadingMovies,
      required int fetchLimit,
      required Option<Either<Error, Unit>> resultOption}) = _$_MovieListState;

  @override
  Option<List<Movie>> get moviesListOption;
  @override
  bool get submissionInProgress;
  @override
  bool get lazyLoadingMovies;
  @override
  int get fetchLimit;
  @override
  Option<Either<Error, Unit>> get resultOption;
  @override
  @JsonKey(ignore: true)
  _$MovieListStateCopyWith<_MovieListState> get copyWith =>
      throw _privateConstructorUsedError;
}
