import 'package:flutter/material.dart';
import 'package:gen_ai/pages/type.dart';
import 'package:gen_ai/pages/dashboard.dart';
import 'package:gen_ai/pages/breathe.dart';
import 'package:gen_ai/pages/mood.dart';

void main() {
  runApp(MaterialApp(
      home: MoodScreen()));
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text('data');
  }
}
