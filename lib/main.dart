import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<QuerySnapshot>(
          future: myCollection.orderBy('index').limit(5).get(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              movies = snapshot.data!.docs
                  .map((e) =>
                      Movie.fromJson(e.id, e.data() as Map<String, dynamic>))
                  .toList();
              return _updating
                  ? CircularProgressIndicator()
                  : ReorderableListView(
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
                    );
            }
            return CircularProgressIndicator();
          },
        ),
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

    setState(() {
      _updating = false;
    });
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
