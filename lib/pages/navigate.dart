import 'package:flutter/material.dart';
import 'package:gen_ai/pages/breathe.dart';
import 'package:gen_ai/pages/dashboard.dart';
import 'package:gen_ai/pages/mood.dart';
import 'package:gen_ai/pages/type.dart';

class Navigate extends StatefulWidget {
  const Navigate({super.key});

  @override
  State<Navigate> createState() => _NavigateState();
}

class _NavigateState extends State<Navigate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Navigate Page'), // Title of the AppBar
        centerTitle: true, // Center the title
        backgroundColor: Colors.blue, // Background color of the AppBar
        elevation: 4.0, // Shadow effect of the AppBar
      ),
      body: Container(
        child: Column(
          children: [
            ElevatedButton(onPressed: onMood, child: Text('Mood')),
            ElevatedButton(onPressed: onDash, child: Text('Dashboard')),
            ElevatedButton(onPressed: onBreathe, child: Text('Breathe')),
            ElevatedButton(onPressed: onType, child: Text('Type')),
          ],
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
}
