import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Type extends StatefulWidget {
  const Type({super.key});

  @override
  _TypeState createState() => _TypeState();
}

class _TypeState extends State<Type> {
  final List<bool> _isSelected = List<bool>.generate(8, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 64, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Building your space...',
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Add challenges that you would like help with',
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(color: Colors.black, fontSize: 16),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                itemCount: _items.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 1.5,
                ),
                itemBuilder: (context, index) {
                  final item = _items[index];
                  return InkWell(
                    onTap: () {
                      setState(() {
                        _isSelected[index] = !_isSelected[index];
                      });
                    },
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: item['gradientColors'],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 16,
                            horizontal: 24,
                          ),
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                item['icon'],
                                color: Colors.white,
                                size: 40,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                item['label'],
                                style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (_isSelected[index])
                          Positioned(
                            top: 8,
                            right: 8,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.check,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            Container(
              alignment: Alignment.center,
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[300],
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    'Submit',
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

final List<Map<String, dynamic>> _items = [
  {
    'label': 'Anxiety',
    'icon': Icons.sentiment_dissatisfied,
    'gradientColors': [Colors.orange[300]!, Colors.orange[400]!],
  },
  {
    'label': 'Motivation',
    'icon': Icons.bolt,
    'gradientColors': [Colors.teal[300]!, Colors.teal[400]!],
  },
  {
    'label': 'Confidence',
    'icon': Icons.thumb_up,
    'gradientColors': [Colors.pink[300]!, Colors.pink[400]!],
  },
  {
    'label': 'Sleep',
    'icon': Icons.nights_stay,
    'gradientColors': [Colors.blue[300]!, Colors.blue[400]!],
  },
  {
    'label': 'Depression',
    'icon': Icons.sentiment_very_dissatisfied,
    'gradientColors': [Colors.purple[300]!, Colors.purple[400]!],
  },
  {
    'label': 'Work Stress',
    'icon': Icons.work,
    'gradientColors': [Colors.green[300]!, Colors.green[400]!],
  },
  {
    'label': 'Relationships',
    'icon': Icons.favorite,
    'gradientColors': [Colors.amber[300]!, Colors.amber[400]!], // Changed color
  },
  {
    'label': 'Exam Stress',
    'icon': Icons.school,
    'gradientColors': [Colors.red[300]!, Colors.red[400]!],
  },
];
