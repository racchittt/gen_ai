import 'package:flutter/material.dart';

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
            CrossAxisAlignment.stretch, // Stretch the buttons horizontally

        children: [
          ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              padding:
                  EdgeInsets.symmetric(vertical: 16), // Increase button height
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12), // Rounded corners
              ),
            ),
            child: Text(text, style: TextStyle(fontSize: 18)),
          ),
          SizedBox(
            height: 16,
          )
        ]);
  }
}
