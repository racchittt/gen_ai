import 'package:flutter/material.dart';
import '../util/emoticon_face.dart';

class EmoticonFacesComponent extends StatelessWidget {
  const EmoticonFacesComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Title and Icon row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'How do you feel?',
              style: TextStyle(
                color: Colors.teal[600],
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            Icon(
              Icons.more_horiz,
              color: Colors.white,
            )
          ],
        ),
        const SizedBox(
          height: 25,
        ),

        // Faces Row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // bad
            Column(
              children: const [
                EmoticonFace(
                  emoticonFace: '😫',
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  'Bad',
                  style: TextStyle(
                    color: Colors.teal,
                  ),
                )
              ],
            ),
            // fine
            Column(
              children: [
                const EmoticonFace(
                  emoticonFace: '😀',
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  'Fine',
                  style: TextStyle(
                    color: Colors.teal[600],
                  ),
                )
              ],
            ),
            // well
            Column(
              children: [
                const EmoticonFace(
                  emoticonFace: '😆',
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  'Well',
                  style: TextStyle(
                    color: Colors.teal[600],
                  ),
                )
              ],
            ),
            // excellent
            Column(
              children: [
                const EmoticonFace(
                  emoticonFace: '😊',
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  'Excellent',
                  style: TextStyle(
                    color: Colors.teal[600],
                  ),
                )
              ],
            ),
          ],
        ),
      ],
    );
  }
}
