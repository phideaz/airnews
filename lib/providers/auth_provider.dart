import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationProvider{

  static auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;

  //Using Stream to listen to Authentication State
  static Stream<auth.User> get userStream => _firebaseAuth.authStateChanges();

  //SIGN UP METHOD
  Future<bool> signUpEmailandPass({String email, String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return true;
    } on auth.FirebaseAuthException catch (e) {
      print(e);
      return false;
    }
  }

  //SIGN IN METHOD
  Future<bool> signInEmailandPass({String email, String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return true;

    } on auth.FirebaseAuthException catch (e) {
      print(e);
      return false;

    }
  }

  //SIGN OUT METHOD
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<auth.UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    // Create a new credential
    final auth.GoogleAuthCredential credential = auth.GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    return await auth.FirebaseAuth.instance.signInWithCredential(credential);
  }

}