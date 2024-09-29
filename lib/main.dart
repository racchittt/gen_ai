import 'package:flutter/material.dart';
import 'package:gen_ai/pages/type.dart';

void main() {
  runApp(const MaterialApp(
      home: Scaffold(
    body: Type(),
  )));
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text('data');
  }
}
