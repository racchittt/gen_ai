import 'package:flutter/material.dart';
import 'package:genai/pages/breathe.dart';
import 'package:genai/pages/community.dart';
import 'package:genai/pages/dashboard.dart';
import 'package:genai/pages/journal.dart';
import 'package:genai/pages/meditation.dart';
import 'package:genai/pages/mood.dart';
import 'package:genai/pages/type.dart';

class StackedCardsPage extends StatefulWidget {
  @override
  _StackedCardsPageState createState() => _StackedCardsPageState();
}

class _StackedCardsPageState extends State<StackedCardsPage> {
  final PageController _pageController = PageController(viewportFraction: 0.8);

  List<Map<String, dynamic>> cardData = [];

  @override
  void initState() {
    super.initState();
    cardData = [
      {'text': 'Mood', 'function': () => onMood()},
      {'text': 'Dashboard', 'function': () => onDash()},
      {'text': 'Breathe', 'function': () => onBreathe()},
      {'text': 'Type', 'function': () => onType()},
      {'text': 'Journal', 'function': () => onJournal()},
      {'text': 'Community', 'function': () => onCommunity()},
      {'text': 'Meditation', 'function': () => onMeditation()},
    ];
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500, // Define a height for the PageView
      child: PageView.builder(
        controller: _pageController,
        itemCount: cardData.length, // Number of cards
        itemBuilder: (context, index) {
          return _buildStackedCard(index);
        },
      ),
    );
  }

  Widget _buildStackedCard(int index) {
    return GestureDetector(
      onTap: cardData[index]['function'],
      child: AnimatedBuilder(
        animation: _pageController,
        builder: (context, child) {
          double value = 1.0;
          if (_pageController.position.haveDimensions) {
            value = _pageController.page! - index;
            value = (1 - (value.abs() * 0.3)).clamp(0.0, 1.0); // Scale effect
          }
          return Center(
            child: SizedBox(
              height:
                  Curves.easeOut.transform(value) * 400, // Adjust card height
              width: Curves.easeOut.transform(value) * 300, // Adjust card width
              child: child,
            ),
          );
        },
        child: Card(
          elevation: 6.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          color: Colors.blueAccent,
          child: Center(
            child: Text(
              cardData[index]['text'],
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void onMood() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => MoodScreen()));
  }

  void onBreathe() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => BreathingScreen()));
  }

  void onDash() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => DashboardPage()));
  }

  void onType() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Type()));
  }

  void onJournal() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Journal()));
  }

  void onCommunity() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => CommunityPage()));
  }

  void onMeditation() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => MeditationScreen()));
  }
}
