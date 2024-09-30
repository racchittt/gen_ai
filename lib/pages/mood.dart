import 'package:flutter/material.dart';
import 'package:gen_ai/components/lottie_widget.dart';

class MoodScreen extends StatelessWidget {
  const MoodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mood'),
      ),
      body: const MoodSelector(),
    );
  }
}

class MoodSelector extends StatefulWidget {
  const MoodSelector({super.key});

  @override
  _MoodSelectorState createState() => _MoodSelectorState();
}

class _MoodSelectorState extends State<MoodSelector> {
  String _selectedMood = "";

  void _selectMood(String mood) {
    setState(() {
      _selectedMood = mood;
      print(_selectedMood);
    });
  }

  Widget _buildMoodButton(String mood, String label, IconData icon) {
    return ElevatedButton.icon(
      onPressed: () => _selectMood(mood),
      style: ElevatedButton.styleFrom(
        backgroundColor: _selectedMood == mood ? Colors.blue : null,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      ),
      icon: Icon(icon),
      label: Text(
        label,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          LottieWidget(path: 'assets/animations/mood.json'),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildMoodButton("Happy", "Happy 😊", Icons.sentiment_satisfied),
              _buildMoodButton("Sad", "Sad 😢", Icons.sentiment_dissatisfied),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildMoodButton(
                  "Angry", "Angry 😠", Icons.sentiment_very_dissatisfied),
              _buildMoodButton(
                  "Excited", "Excited 🤩", Icons.sentiment_very_satisfied),
            ],
          ),
        ],
      ),
    );
  }
}
