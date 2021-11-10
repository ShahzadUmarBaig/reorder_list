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
  CollectionReference collection =
      FirebaseFirestore.instance.collection("movies");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<QuerySnapshot>(
          future: collection.get(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: Text("Error"),
              );
            }

            if (snapshot.hasData) {
              int length = snapshot.data!.docs.length;
              return ReorderableListView.builder(
                onReorder: (int oldIndex, int newIndex) {
                  print(oldIndex);
                  print(snapshot.data!.docs[oldIndex].data());
                  print(newIndex);
                  print(snapshot.data!.docs[newIndex].data());
                },
                itemCount: length,
                itemBuilder: (context, index) {
                  Map data = snapshot.data!.docs[index].data() as Map;
                  return ListTile(
                    key: ValueKey(data),
                    title: Text(data["name"]),
                  );
                },
              );
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
