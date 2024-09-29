import 'package:flutter/material.dart';

class EmoticonFace extends StatelessWidget {
  final String emoticonFace;

  const EmoticonFace({
    super.key,
    required this.emoticonFace,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.teal.shade100, // Background color
          borderRadius: BorderRadius.circular(12), // Rounded corners
          border: Border.all(
            // Border with width and color
            color: Colors.teal.shade600,
            width: 2,
          ),
        ),
        padding: EdgeInsets.all(16),
        child: Center(
          child: Text(
            emoticonFace,
            style: TextStyle(
              fontSize: 28,
            ),
          ),
        ));
  }
}
