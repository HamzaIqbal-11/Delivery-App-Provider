import 'package:delivery_app/Constants/app_routes.dart';
import 'package:delivery_app/Widgets/bottomNavigationBar.dart';
import 'package:delivery_app/view/onboarding/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInController extends ChangeNotifier {
  static final GoogleSignIn _googleSignIn = GoogleSignIn();
  Future<UserCredential?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) return null;
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken,
      );

      return await FirebaseAuth.instance.signInWithCredential(credential);
      // final GoogleSignInAccount? googleUser = await GoogleSignIn.instance
      //     .authenticate();
    } catch (e) {
      print('Sign In FAILED $e');
      // log('Sign In FAILED $e', error: 1000);
      throw Exception('FAILED $e');
    }
  }

  Future<void> handleGoogleWithButton(context) async {
    try {
      final UserCredential? user = await signInWithGoogle();
      if (user != null) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => BottomNavigation()));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Cant Sign In With Google")));
      }
    } catch (e) {}
  }

  Future<void> checkUserLogin(context) async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      bool isGoogleLogin = user.providerData.any(
          (userInfo) => userInfo.providerId == GoogleAuthProvider.PROVIDER_ID);

      if (isGoogleLogin) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => BottomNavigation()));
      } else {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => OnBoarding()));
      }
    }
  }
}
