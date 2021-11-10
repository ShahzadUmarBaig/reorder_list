import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:very_good_infinite_list/very_good_infinite_list.dart'
    as infinite;

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
          if (snapshot.hasData) return const MyHomePage();
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class InfiniteList extends StatelessWidget {
  const InfiniteList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: infinite.InfiniteList<String>(
        itemLoader: _itemLoader,
        builder: infinite.InfiniteListBuilder<String>(
          success: (context, item) => ListTile(title: Text(item)),
        ),
      ),
    );
  }

  Future<List<String>?> _itemLoader(int limit, {int start = 0}) async {
    await Future<void>.delayed(const Duration(seconds: 1));
    if (start >= 100) return null;
    if (Random().nextInt(2) == 0) throw Exception('Oops!');
    if (Random().nextInt(5) == 0) throw infinite.InfiniteListException();
    return List.generate(limit, (index) => 'Item ${start + index}');
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  CollectionReference myCollection =
      FirebaseFirestore.instance.collection("moviesss");

  late List<Movie> movies;

  bool _updating = false;
  bool _loadingMovies = true;
  int showingTotalMovies = 5;

  void loadMovies() async {
    QuerySnapshot snap =
        await myCollection.orderBy('index').limit(showingTotalMovies).get();

    movies = snap.docs
        .map((e) => Movie.fromJson(e.id, e.data() as Map<String, dynamic>))
        .toList();

    setState(() {
      _loadingMovies = false;
    });
  }

  @override
  void initState() {
    loadMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
            child: _updating || _loadingMovies
                ? CircularProgressIndicator()
                : LazyLoadScrollView(
                    onEndOfPage: () {
                      showingTotalMovies += 5;
                      loadMovies();
                    },
                    child: ReorderableListView(
                      onReorder: (oldIndex, newIndex) {
                        setState(() {
                          _updating = true;
                        });
                        updateCollection(oldIndex, newIndex);
                      },
                      children: movies
                          .map((e) => ListTile(
                                key: ValueKey(e),
                                leading: Text('${e.index}'),
                                title: Text(e.name),
                              ))
                          .toList(),
                    ),
                  )),
      ),
    );
  }

  updateCollection(int oldIndex, int newIndex) async {
    // if ( newIndex > movies.length - 1) {
    //   setState(() {
    //     _updating = false;
    //   });
    //   return;
    // }
    // if ( oldIndex > movies.length - 1) {
    //   setState(() {
    //     _updating = false;
    //   });
    //   return;
    // }

    WriteBatch batch = FirebaseFirestore.instance.batch();
    print('oi: $oldIndex, ni: $newIndex');

    if (oldIndex < newIndex) {
      newIndex -= 1;
      // batch.update(myCollection.doc(movies[newIndex].id), {'index': oldIndex});
      for (int i = oldIndex + 1; i <= newIndex && i < movies.length; i++) {
        batch.update(myCollection.doc(movies[i].id), {'index': i - 1});
      }

      batch.update(myCollection.doc(movies[oldIndex].id), {'index': newIndex});
    }
    if (newIndex < oldIndex) {
      // batch.update(myCollection.doc(movies[newIndex].id), {'index': oldIndex});
      for (int i = newIndex; i < oldIndex; i++) {
        batch.update(myCollection.doc(movies[i].id), {'index': i + 1});
      }

      batch.update(myCollection.doc(movies[oldIndex].id), {'index': newIndex});
    }

    await batch.commit();
    // Movie temp = movies[oldIndex];
    //
    // await myCollection.doc(movies[newIndex].id).set(movies[oldIndex].toJson());
    // await myCollection.doc(movies[oldIndex].id).set(temp.toJson());
    _updating = false;
    loadMovies();

    setState(() {});
  }
}

class Movie {
  final int index;
  final String name;
  final int? number;
  final String id;

  Movie({
    required this.index,
    required this.name,
    required this.number,
    required this.id,
  });

  factory Movie.fromJson(String id, Map<String, dynamic> json) {
    return Movie(
      id: id,
      name: json['name'],
      index: json['index'],
      number: json['number'],
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'index': index,
        'number': number,
      };
}
