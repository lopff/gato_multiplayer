import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';
import 'package:rxdart/rxdart.dart';
import './globals.dart';

class Document<T> {
  final Firestore _db = Firestore.instance;
  final String path;
  DocumentReference ref;

  Document({this.path}) {
    ref = _db.document(path);
  }

  /*Future<T> getData() {
    return ref.get().then((v) => Global.models[T](v.data) as T);
  }

  Stream<T> streamData() {
    return ref.snapshots().map((v) => Global.models[T](v.data) as T);
  }*/

  Future<void> insert(Map data) {
    return _db
        .collection(this.path)
        .document()
        .setData(Map<String, dynamic>.from(data));
  }

  Future<void> update(Map data) {
    return ref.setData(Map<String, dynamic>.from(data), merge: true);
  }

  Future<void> delete() {
    return ref.delete();
  }
}

class Collection<T> {
  final Firestore _db = Firestore.instance;
  final String path;
  CollectionReference ref;

  Collection({this.path}) {
    ref = _db.collection(path);
  }
/*
  Future<List<T>> getData() async {
    var snapshots = await ref.getDocuments();
    return snapshots.documents
        .map((doc) => Global.models[T](doc.documentID, doc.data) as T)
        .toList();
  }

  Stream<List<T>> streamData() {
    return ref.snapshots().map(
          (list) => list.documents
              .map((doc) => Global.models[T](doc.documentID, doc.data) as T)
              .toList(),
        );
  }

  Future<void> batchInsert(List<T> items) {
    WriteBatch batch = _db.batch();

    items.forEach((item) {
      batch.setData(ref.document(), Global.modelsToJson[T](item));
    });

    return batch.commit();
  }*/
}

class UserData<T> {
  final Firestore _db = Firestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final String collection;

  UserData({this.collection});
/*
  Stream<T> get documentStream {
    return Observable(_auth.onAuthStateChanged).switchMap((user) {
      if (user != null) {
        Document<T> doc = Document<T>(path: '$collection/${user.uid}');
        return doc.streamData();
      } else {
        return Observable<T>.just(null);
      }
    }); //.shareReplay(maxSize: 1).doOnData((d) => print('777 $d'));// as Stream<T>;
  }

  Future<T> getDocument() async {
    FirebaseUser user = await _auth.currentUser();

    if (user != null) {
      Document doc = Document<T>(path: '$collection/${user.uid}');
      return doc.getData();
    } else {
      return null;
    }
  }
*/
  Future<void> update(Map data) async {
    FirebaseUser user = await _auth.currentUser();
    Document<T> ref = Document(path: '$collection/${user.uid}');
    return ref.update(data);
  }
}
