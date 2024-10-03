import 'package:flutter/material.dart';
import 'package:genai/pages/breathe.dart';
import 'package:genai/pages/chat_screen.dart';
import 'package:genai/pages/community.dart';
import 'package:genai/pages/dashboard.dart';
import 'package:genai/pages/hero_page.dart';
import 'package:genai/pages/journal.dart';
import 'package:genai/pages/meditation.dart';
import 'package:genai/pages/mood.dart';
import 'package:genai/pages/type.dart';

class BentoGridWidget extends StatelessWidget {
  const BentoGridWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.count(
        crossAxisCount: 3, // 3 items per row (3x3 grid)
        childAspectRatio: 0.9, // Slightly taller cards
        mainAxisSpacing: 16.0, // Space between rows
        crossAxisSpacing: 16.0, // Space between columns
        children: [
          _buildModernCard(
              context, 'Mood', Colors.lightGreen, () => onMood(context)),
          _buildModernCard(
              context, 'Dashboard', Colors.blueAccent, () => onDash(context)),
          _buildModernCard(context, 'Breathe', Colors.orangeAccent,
              () => onBreathe(context)),
          _buildModernCard(
              context, 'Type', Colors.purpleAccent, () => onType(context)),
          _buildModernCard(
              context, 'Journal', Colors.tealAccent, () => onJournal(context)),
          _buildModernCard(context, 'Community', Colors.amberAccent,
              () => onCommunity(context)),
          _buildModernCard(context, 'Meditation', Colors.cyanAccent,
              () => onMeditation(context)),
          _buildModernCard(
              context, 'Chat', Colors.deepPurpleAccent, () => onChat(context)),
          _buildModernCard(
              context, 'Hero', Colors.lightBlueAccent, () => onHero(context)),
        ],
      ),
    );
  }

  Widget _buildModernCard(
      BuildContext context, String title, Color color, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 6, // Slight shadow for a modern look
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16), // Rounded corners
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              // Gradient for modern style
              colors: [color.withOpacity(0.7), color],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 8,
                spreadRadius: 2,
                offset: Offset(0, 4), // Soft shadow effect
              ),
            ],
          ),
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons
                      .apps, // Placeholder for icons (you can customize per card)
                  size: 40,
                  color: Colors.white,
                ),
                const SizedBox(height: 12),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onMood(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => MoodScreen()));
  }

  void onBreathe(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => BreathingScreen()));
  }

  void onDash(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => DashboardPage()));
  }

  void onType(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Type()));
  }

  void onJournal(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Journal()));
  }

  void onCommunity(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => CommunityPage()));
  }

  void onMeditation(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => MeditationScreen()));
  }

  void onChat(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ChatScreen()));
  }

  void onHero(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HeroPage()));
  }
}
