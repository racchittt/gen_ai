import 'package:flutter/material.dart';
import 'package:gen_ai/pages/blog.dart';
import 'package:gen_ai/pages/hero_page.dart';

void main() {
  runApp(MaterialApp(
    title: 'GenAI',
    theme:
        ThemeData(scaffoldBackgroundColor: Colors.white, fontFamily: 'Poppins'),
    debugShowCheckedModeBanner: false,
    home: HeroPage(),
  ));
}
