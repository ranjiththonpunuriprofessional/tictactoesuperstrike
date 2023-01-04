import 'package:firebase_database/firebase_database.dart';

class Database {
  DatabaseReference tableGridsRef = FirebaseDatabase.instance.ref("tableGrids");
  DatabaseReference playersRef = FirebaseDatabase.instance.ref("playersRef");

  
}