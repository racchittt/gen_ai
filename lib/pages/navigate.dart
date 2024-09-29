import 'package:flutter/material.dart';
import 'package:gen_ai/pages/breathe.dart';
import 'package:gen_ai/pages/dashboard.dart';
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
    return Scaffold(
        appBar: AppBar(
          title: Text('Navigate Page'), // Title of the AppBar
          centerTitle: true, // Center the title
          backgroundColor: Colors.blue, // Background color of the AppBar
          elevation: 4.0, // Shadow effect of the AppBar
        ),
        body: Container(
          padding: EdgeInsets.all(16.0), // Padding around the container
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BasicButton('Mood', onMood),
              BasicButton('Dashboard', onDash),
              BasicButton('Breathe', onBreathe),
              BasicButton('Type', onType),
            ],
          ),
        ));
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
