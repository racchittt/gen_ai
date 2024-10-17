import 'package:flutter/material.dart';
import 'package:genai/pages/cbt/cbt.dart';

class Disclaimer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'CBT Test Introduction',
          style: TextStyle(color: Colors.teal[900]),
        ),
        backgroundColor: Colors.teal[100], // Teal AppBar
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
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Center(
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Colors.teal[50], // Teal background for button
                      foregroundColor: Colors.white, // White text color
                      padding:
                          EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(15), // Modern rounded corners
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
                      style: TextStyle(
                          color: Colors.teal[900],
                          fontSize: 22,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      backgroundColor: Colors.white, // White background for the page
    );
  }
}
