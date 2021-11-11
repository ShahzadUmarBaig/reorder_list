import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:reorder_list_app/application/movie_list_bloc/movie_list_bloc.dart';
import 'package:reorder_list_app/domain/movie.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const Text('Hello'),
      home: FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          if (snapshot.hasError) return const Center(child: Text("Error"));
          if (snapshot.hasData) return MyHomePage();
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Movie List')),
      body: SafeArea(
        child: BlocProvider(
          create: (context) => MovieListBloc(),
          child: MovieList(),
        ),
      ),
    );
  }
}

class MovieList extends StatefulWidget {
  const MovieList({Key? key}) : super(key: key);

  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  late List<Movie> movies;

  bool _updating = false;
  bool _loadingMovies = true;
  int showingTotalMovies = 5;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MovieListBloc, MovieListState>(
      listener: (_, state) {},
      builder: (_, state) {
        return LazyLoadScrollView(
          onEndOfPage: () {},
          child: state.moviesListOption.fold(
            () => const Center(child: Text('Fetching movies...')),
            (moviesList) {
              return IgnorePointer(
                ignoring: state.submissionInProgress,
                child: ReorderableListView(
                  header: ListTile(
                    title: state.submissionInProgress
                        ? const Text('Please wait ...')
                        : const Text('Long tap to reorder movies'),
                  ),
                  onReorder: (oldIndex, newIndex) {
                    context.read<MovieListBloc>().add(MovieListEvent.onReorder(
                          oldIndex: oldIndex,
                          newIndex: newIndex,
                        ));
                  },
                  children: moviesList
                      .map((movie) => ListTile(
                            key: ValueKey(movie),
                            leading: Text('${movie.index}'),
                            title: Text(movie.name),
                          ))
                      .toList(),
                ),
              );
            },
          ),
        );
      },
    );
  }

// @override
// Widget build(BuildContext context) {
//   return Center(
//       child: _updating || _loadingMovies
//           ? CircularProgressIndicator()
//           : LazyLoadScrollView(
//               onEndOfPage: () {
//                 showingTotalMovies += 5;
//                 loadMovies();
//               },
//               child: ReorderableListView(
//                 onReorder: (oldIndex, newIndex) {
//                   setState(() {
//                     _updating = true;
//                   });
//                   updateCollection(oldIndex, newIndex);
//                 },
//                 children: movies
//                     .map((e) => ListTile(
//                           key: ValueKey(e),
//                           leading: Text('${e.index}'),
//                           title: Text(e.name),
//                         ))
//                     .toList(),
//               ),
//             ));
// }

}
