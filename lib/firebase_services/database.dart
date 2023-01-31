import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



class Database {
  static final FirebaseDatabase _database = FirebaseDatabase.instance;

  DatabaseReference? getDatabaseRef(refName) {
    DatabaseReference? ref = _database.ref(refName);
    return ref; 
  }

  Future<String> create(payload,refName) async {
    final dbRef = getDatabaseRef(refName);
    await dbRef?.child(payload['id']).set(payload);
    return payload['id'];
  }

  Future<void> listen(refName, update) async {
    final dbRef = getDatabaseRef(refName);
    dbRef?.onValue.listen((DatabaseEvent event) {
      final data = event.snapshot.value;
       Map<String, dynamic> _data = Map<String, dynamic>.from(data as Map);
       update(_data);
    });
  }
}