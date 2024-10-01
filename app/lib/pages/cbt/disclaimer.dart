import 'package:flutter/material.dart';
import 'package:gen_ai/pages/cbt/cbt.dart';

class Disclaimer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CBT Test Introduction', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.teal[300], // Teal AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome to the CBT Test',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.teal.shade900, // Dark teal color for heading
              ),
            ),
            SizedBox(height: 20),
            Text(
              'This test helps to assess your emotional and mental well-being through a series of questions. '
              'Please answer honestly, as the results will be used to provide personalized support.',
              style: TextStyle(
                fontSize: 18,
                color: Colors
                    .teal.shade800, // Slightly darker teal for paragraph text
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Remember, there are no right or wrong answers. Just reflect on how you feel.',
              style: TextStyle(
                fontSize: 18,
                color: Colors.teal.shade800,
              ),
            ),
            SizedBox(height: 40),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal, // Teal background for button
                  foregroundColor: Colors.white, // White text color
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(12), // Modern rounded corners
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CBTTestPage()),
                  );
                },
                child: Text(
                  'Start Test',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white, // White background for the page
    );
  }
}
