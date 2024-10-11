import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignupService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? getCurentUser() {
    return _auth.currentUser;
  }

  Future<void> signUpUser(String e, String p) async {
    try {
      UserCredential user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: e, password: p);
      _firestore
          .collection("Users")
          .doc(user.user!.uid)
          .set({"uid": user.user!.uid, "email": e});
    } on FirebaseException catch (e) {
      throw Exception(e);
      // TODO
    }
  }
}