import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  static String getUserId() {
    return FirebaseAuth.instance.currentUser!.uid;
  }

  static String getUserName() {
    return FirebaseAuth.instance.currentUser!.displayName!;
  }

  static Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

}