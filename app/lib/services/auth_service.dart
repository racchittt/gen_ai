import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:genai/pages/login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final storage = new FlutterSecureStorage();

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

  Future<String?> getToken() async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      try {
        String? token = await user.getIdToken();
        return token;
      } catch (e) {
        print("Error getting token: $e");
        return null;
      }
    } else {
      print("User not logged in");
      return null;
    }
  }

  Future<void> loginWithFirebase() async {
    String? token = await getToken();
    var response = await http.post(
      Uri.parse('https://gen-ai-g6tt.onrender.com/api/v1/users/firebaseUser'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'token': token,
      }),
    );
    if (response.statusCode == 200) {
      await storage.write(key: 'jwt', value: token);
      print('Login Successful');
    } else {
      print('Login failed');
    }
  }

  Future<String?> readToken() async {
    String? storedToken = await storage.read(key: 'jwt');

    if (storedToken != null) {
      print('Stored JWT Token: $storedToken');
      return storedToken;
    } else {
      print('No JWT Token found');
      return null;
    }
  }

  Future<void> logout(BuildContext context) async {
    try {
      await _auth.signOut();
      await _googleSignIn.signOut();
    } catch (e) {
      print("Error signing out: $e");
    }

    await storage.deleteAll();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }
}
