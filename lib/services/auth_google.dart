import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';


class AuthUser {
  Future loginGoogle() async {
    final accountGoogle = await GoogleSignIn().signIn();

    final googleAuth = await accountGoogle?.authentication;

final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken, 
    idToken: googleAuth?.idToken); // Cambié accessToken a idToken para idToken


    final UserCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);

    return UserCredential.user;
  }
}
