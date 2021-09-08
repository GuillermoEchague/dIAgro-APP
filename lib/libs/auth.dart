import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_ui_avanzadas/pages/login/login_page.dart';
// import 'package:flutter_ui_avanzadas/utils/dialogs.dart';
import 'package:google_sign_in/google_sign_in.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class Auth {
  Auth._internal();
  static Auth get instance => Auth._internal();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  User? get user {
    return _firebaseAuth.currentUser;
  }

  Future<void> google(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication authentication =
          await googleUser!.authentication;

      final OAuthCredential credential = GoogleAuthProvider.credential(
        idToken: authentication.idToken,
        accessToken: authentication.accessToken,
      );

      final UserCredential userCredential =
          await _firebaseAuth.signInWithCredential(credential);

      final User? user = userCredential.user;

      // ignore: avoid_print
      print("username: ${user!.displayName} ");
    } catch (e) {
      // print(e);

      return null;
    }
  }
}
