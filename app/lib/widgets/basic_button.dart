import 'package:flutter/material.dart';
import 'package:genai/themes/colors.dart';

class BasicButton extends StatelessWidget {
  const BasicButton(this.text, this.onPressed, {super.key});

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment:
          MainAxisAlignment.center, // Center the buttons vertically
      crossAxisAlignment:
          CrossAxisAlignment.center, // Stretch the buttons horizontally
      children: [
        SizedBox(
          width: 100,
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white, // Text color
              backgroundColor: Mint, // Mint green for button background
              padding:
                  EdgeInsets.symmetric(vertical: 16), // Increase button height
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12), // Rounded corners
              ),
              elevation: 5, // Add shadow for depth
              shadowColor: Mint, // Slightly darker mint shadow color
              textStyle: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold, // Bold text
              ),
              minimumSize: Size(100, 50), // Minimum size of the button
              tapTargetSize: MaterialTapTargetSize.padded, // Padded tap target
              animationDuration: Duration(
                  milliseconds: 200), // Animation duration for press effect
            ),
            child: Text(text),
          ),
        ),
        SizedBox(height: 16),
      ],
    );
  }
}
