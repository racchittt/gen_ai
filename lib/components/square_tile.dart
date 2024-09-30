import 'package:flutter/material.dart';

class SquareTile extends StatelessWidget {
  final String imagePath;
  final String text;
  const SquareTile({super.key, required this.imagePath, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(16),
          color: Colors.grey[200],
        ),
        child: Row(
          children: [
            Image.asset(
              imagePath,
              height: 35,
            ),
            SizedBox(width: 30),
            Padding(padding: EdgeInsets.all(10),child:  Text(text,textScaler: TextScaler.linear(1.2),))
           
          ],
        ));
  }
}
