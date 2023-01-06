import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



class Database {
  static final FirebaseDatabase _database = FirebaseDatabase.instance;

  DatabaseReference? getDatabaseRef(refName) {
    DatabaseReference? ref = _database.ref(refName);
    return ref; 
  }

  Future<void> create(payload,refName) async {
    final dbRef = getDatabaseRef(refName);
    final reuturnValue = await dbRef?.push().set(payload);
    return reuturnValue;
  }
}