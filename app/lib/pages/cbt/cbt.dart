import 'package:flutter/material.dart';

class CBTTestPage extends StatefulWidget {
  @override
  _CBTTestPageState createState() => _CBTTestPageState();
}

class _CBTTestPageState extends State<CBTTestPage> {
  final _formKey = GlobalKey<FormState>();

  // Storing user answers
  Map<String, double> _answers = {
    'question1': 0,
    'question2': 0,
    'question3': 0,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CBT Test'),
        backgroundColor: Colors.teal, // AppBar teal color
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildQuestion('How often do you feel anxious?', 'question1'),
              _buildQuestion('How often do you feel sad?', 'question2'),
              _buildQuestion('How often do you feel overwhelmed?', 'question3'),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal, // Button background color
                    foregroundColor: Colors.white, // Button text color
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Process the answers
                      _formKey.currentState!.save();
                      print(_answers); // You can handle the answers here
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Test Submitted')),
                      );
                    }
                  },
                  child: Text('Submit', style: TextStyle(fontSize: 18)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuestion(String question, String key) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          question,
          style:
              TextStyle(fontSize: 18, color: Colors.teal.shade900), // Teal text
        ),
        Slider(
          value: _answers[key]!,
          min: 0,
          max: 5,
          divisions: 5,
          activeColor: Colors.teal, // Active color for the slider
          inactiveColor: Colors.teal.shade100, // Inactive slider color
          label: _answers[key]!.round().toString(),
          onChanged: (value) {
            setState(() {
              _answers[key] = value;
            });
          },
        ),
        Divider(
          color: Colors.teal.shade100, // Divider color
        ),
      ],
    );
  }
}
