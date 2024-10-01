import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<UserCredential?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? gUser = await _googleSignIn.signIn();

      if (gUser != null) {
        final GoogleSignInAuthentication gAuth = await gUser.authentication;
        final OAuthCredential credential = GoogleAuthProvider.credential(
          accessToken: gAuth.accessToken,
          idToken: gAuth.idToken,
        );
        return await _auth.signInWithCredential(credential);
      }
    } catch (e) {
      print("Error signing in with Google: $e");
    }
    return null;
  }
}
