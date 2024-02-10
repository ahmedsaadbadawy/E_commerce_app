import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  static Future<String> getUserId() async {
    return FirebaseAuth.instance.currentUser!.uid;
  }

  static String getUserName(String name) {
    return FirebaseAuth.instance.currentUser!.displayName!;
  }

  static Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

}