import 'package:flutter/material.dart';
import 'package:gen_ai/pages/breathe.dart';
import 'package:gen_ai/pages/chat_screen.dart';
import 'package:gen_ai/pages/community.dart';
import 'package:gen_ai/pages/dashboard.dart';
import 'package:gen_ai/pages/hero_page.dart';
import 'package:gen_ai/pages/journal.dart';
import 'package:gen_ai/pages/meditation.dart';
import 'package:gen_ai/pages/mood.dart';
import 'package:gen_ai/pages/type.dart';
import 'package:gen_ai/widgets/basic_button.dart';

class Navigate extends StatefulWidget {
  const Navigate({super.key});

  @override
  State<Navigate> createState() => _NavigateState();
}

class _NavigateState extends State<Navigate> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0), // Padding around the container
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BasicButton('Mood', onMood),
              BasicButton('Dashboard', onDash),
              BasicButton('Breathe', onBreathe),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BasicButton('Type', onType),
              BasicButton('Journal', onJournal),
              BasicButton('Community', onCommunity),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BasicButton('Meditation', onMeditation),
              BasicButton('Chat', onChat),
              BasicButton('Hero', onHero),
            ],
          )
        ],
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

  void onChat() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ChatScreen()));
  }

  void onHero() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HeroPage()));
  }
}
