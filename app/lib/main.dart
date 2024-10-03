import 'package:flutter/material.dart';
import 'package:genai/pages/hero_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    print("Firebase initialization error: $e");
  }
  runApp(MaterialApp(
    title: 'GenAI',
    theme:
        ThemeData(scaffoldBackgroundColor: Colors.white, fontFamily: 'Poppins'),
    debugShowCheckedModeBanner: false,
    home: HeroPage(),
  ));
}
