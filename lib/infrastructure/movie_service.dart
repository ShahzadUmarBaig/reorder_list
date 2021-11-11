import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:reorder_list_app/domain/movie.dart';

class MovieService {
  CollectionReference myCollection =
      FirebaseFirestore.instance.collection("moviesss");

  static List<Movie> movieList = [];

  Future<List<Movie>> loadMovies(int limit) async {
    QuerySnapshot snap = await myCollection.orderBy('index').limit(limit).get();

    movieList = snap.docs
        .map((e) => Movie.fromJson(e.id, e.data() as Map<String, dynamic>))
        .toList();

    return movieList;
  }

  Future<Either<Error, Unit>> reorderMovies({
    required int oldIndex,
    required int newIndex,
    required List<Movie> movies,
  }) async {
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
    return right(unit);
    // Movie temp = movies[oldIndex];
    //
    // await myCollection.doc(movies[newIndex].id).set(movies[oldIndex].toJson());
    // await myCollection.doc(movies[oldIndex].id).set(temp.toJson());
    // _updating = false;
    // loadMovies();
    //
    // setState(() {});
    //
  }

  // updateCollection(int oldIndex, int newIndex) async {
  //   // if ( newIndex > movies.length - 1) {
  //   //   setState(() {
  //   //     _updating = false;
  //   //   });
  //   //   return;
  //   // }
  //   // if ( oldIndex > movies.length - 1) {
  //   //   setState(() {
  //   //     _updating = false;
  //   //   });
  //   //   return;
  //   // }
  //
  //   WriteBatch batch = FirebaseFirestore.instance.batch();
  //   print('oi: $oldIndex, ni: $newIndex');
  //
  //   if (oldIndex < newIndex) {
  //     newIndex -= 1;
  //     // batch.update(myCollection.doc(movies[newIndex].id), {'index': oldIndex});
  //     for (int i = oldIndex + 1; i <= newIndex && i < movies.length; i++) {
  //       batch.update(myCollection.doc(movies[i].id), {'index': i - 1});
  //     }
  //
  //     batch.update(myCollection.doc(movies[oldIndex].id), {'index': newIndex});
  //   }
  //   if (newIndex < oldIndex) {
  //     // batch.update(myCollection.doc(movies[newIndex].id), {'index': oldIndex});
  //     for (int i = newIndex; i < oldIndex; i++) {
  //       batch.update(myCollection.doc(movies[i].id), {'index': i + 1});
  //     }
  //
  //     batch.update(myCollection.doc(movies[oldIndex].id), {'index': newIndex});
  //   }
  //
  //   await batch.commit();
  //   // Movie temp = movies[oldIndex];
  //   //
  //   // await myCollection.doc(movies[newIndex].id).set(movies[oldIndex].toJson());
  //   // await myCollection.doc(movies[oldIndex].id).set(temp.toJson());
  //   _updating = false;
  //   loadMovies();
  //
  //   setState(() {});
  // }

}
