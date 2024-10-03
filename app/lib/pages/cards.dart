import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:genai/pages/dashboard.dart';

class FlashCard extends StatelessWidget {
  final List<String> messages = [
    'You are stronger than you think.',
    'Believe in yourself!',
    'You are doing amazing, don’t give up!',
    'Every day is a new beginning.',
    'You are loved and appreciated.',
    'Your potential is limitless.',
    'Keep pushing, success is near.',
    'Good things take time, be patient.',
    'You are not alone in this journey.',
  ];

  final List<String> images = [
    'assets/images/aurora.jpg',
    'assets/images/road.jpg',
    'assets/images/leaf.jpg',
    'assets/images/trail.jpg',
  ];

  FlashCard() {
    images.shuffle();
  }
  Future<bool> _onWillPop(BuildContext context) async {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => DashboardPage(), // Navigate to Dashboard
      ),
    );
    return false; // Prevent the default back button behavior
  }

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () => _onWillPop(context),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal[100],
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        DashboardPage()), // Navigate to Dashboard
              );
            },
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.teal[100]!,
                Colors.grey[200]!,
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  child: Text(
                'It\'s Okay! We got you.',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              )),
              Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  height: MediaQuery.of(context).size.height * 0.75,
                  child: CardSwiper(
                    cardsCount: messages.length,
                    numberOfCardsDisplayed: 3,
                    scale: 0.9,
                    padding: const EdgeInsets.all(12),
                    isLoop: true,
                    cardBuilder:
                        (context, index, percentThresholdX, percentThresholdY) {
                      return _buildCard(
                          messages[index], images[index % images.length]);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCard(String message, String imagePath) {
    return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Container(
          alignment: Alignment.center,
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              // border: Border.all(color: Colors.blue, width: 4),
              borderRadius: BorderRadius.circular(14),
              image: DecorationImage(
                  image: AssetImage(imagePath),
                  opacity: 0.8,
                  fit: BoxFit.cover)),
          child: Text(
            message,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ));
  }
}
