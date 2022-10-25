
import 'package:firebase_auth/firebase_auth.dart' show FirebaseAuth, FirebaseAuthException, User, UserCredential;

class Authentication {
  static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  
  // --- sign in, up and out
  Future<String?> signIn(String email, String password) async {
    UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    User? user = userCredential.user;
    return user?.uid;
  }

  Future<String?> signInAnonymously() async {
     return Future.delayed(
      const Duration(seconds: 5),
      () async {
        try {
          UserCredential userCredential = await _firebaseAuth.signInAnonymously();
          print("Signed in with temporary account.");
          User? user = userCredential.user;
          print(user?.uid);
          return user?.uid;
        } on FirebaseAuthException catch (e) {
          switch (e.code) {
            case "operation-not-allowed":
              print("Anonymous auth hasn't been enabled for this project.");
              break;
            default:
              print("Unknown error.");
          }
        }
        return null;
      },
    );
    
  }

  Future<String?> signUp(String email, String password) async {
    UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
     User? user = userCredential.user;
    return user?.uid;
  }

  Future<void> signOut() async {
   // _snapshotService.setWasteLessLifeUserObject({});
    return _firebaseAuth.signOut();
  }

}