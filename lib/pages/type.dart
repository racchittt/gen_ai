import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Type extends StatelessWidget {
  const Type({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(8, 64, 8, 16),
            margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
            child: Text(
              'Building your space...',
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
            child: Text(
              'Add challenges that you would like help with',
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(color: Colors.black, fontSize: 16),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            child: Column(
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        print("Anxiety button pressed");
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.orange[300],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        width: 180,
                        height: 80,
                        padding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 24),
                        child: const Text('Anxiety'),
                      ),
                    ),
                    const SizedBox(width: 16),
                    InkWell(
                      onTap: () {
                        print("Motivation button pressed");
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.teal[300],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        width: 180,
                        height: 80,
                        padding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 24),
                        child: const Text('Motivation'),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        print("Confidence button pressed");
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.pink[300],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        width: 180,
                        height: 80,
                        padding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 24),
                        child: const Text('Confidence'),
                      ),
                    ),
                    const SizedBox(width: 16),
                    InkWell(
                      onTap: () {
                        print("Sleep button pressed");
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.blue[300],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        width: 180,
                        height: 80,
                        padding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 24),
                        child: const Text('Sleep'),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        print("Depression button pressed");
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.purple[300],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        width: 180,
                        height: 80,
                        padding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 24),
                        child: const Text('Depression'),
                      ),
                    ),
                    const SizedBox(width: 16),
                    InkWell(
                      onTap: () {
                        print("Work Stress button pressed");
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.lightGreenAccent[400],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        width: 180,
                        height: 80,
                        padding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 24),
                        child: const Text('Work Stress'),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        print("Relationships button pressed");
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.yellow[300],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        width: 180,
                        height: 80,
                        padding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 24),
                        child: const Text('Relationships'),
                      ),
                    ),
                    const SizedBox(width: 16),
                    InkWell(
                      onTap: () {
                        print("Exam Stress button pressed");
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.red[300],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        width: 180,
                        height: 80,
                        padding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 24),
                        child: const Text('Exam Stress'),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
