import 'package:flutter/material.dart';
import 'package:genai/components/bento_grid_widget.dart'; // Adjust the import path accordingly

class BentoGridPage extends StatelessWidget {
  const BentoGridPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bento Grid'),
        backgroundColor: Colors.teal, // Customize your app bar color
      ),
      body: const BentoGridWidget(), // Using the BentoGridWidget
    );
  }
}
