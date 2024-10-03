import 'package:flutter/material.dart';
import 'package:genai/pages/breathe.dart'; //
import 'package:genai/pages/cbt/disclaimer.dart'; //
import 'package:genai/pages/chat_screen.dart'; //
import 'package:genai/pages/community.dart'; //
import 'package:genai/pages/dashboard.dart'; //
import 'package:genai/pages/login.dart'; //
import 'package:genai/pages/journal.dart'; //
import 'package:genai/pages/meditation.dart'; //
import 'package:genai/pages/mood.dart'; //
import 'package:genai/pages/music_player.dart'; //
import 'package:genai/pages/type.dart'; //
import 'package:genai/widgets/basic_button.dart';
import 'package:genai/pages/cards.dart'; //

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
              BasicButton('Music', onMusic),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BasicButton('Login', onLogin),
              BasicButton('Card', onCard),
              BasicButton('CBT', onCBT),
            ],
          ),
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

  void onMusic() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => MusicPlayerPage()));
  }

  void onLogin() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
  }

  void onCard() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => FlashCard()));
  }

  void onCBT() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Disclaimer()));
  }
}
