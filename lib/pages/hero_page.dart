import 'package:flutter/material.dart';
import 'package:gen_ai/components/lottie_widget.dart';
import 'package:gen_ai/components/motivation_widget.dart';
import 'package:gen_ai/pages/navigate.dart';

class HeroPage extends StatefulWidget {
  const HeroPage({super.key});

  @override
  State<HeroPage> createState() => _HeroPageState();
}

class _HeroPageState extends State<HeroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          LottieWidget(
            path: 'assets/animations/43792-yoga-se-hi-hoga.json',
          ),
          MotivationWidget(),
          Navigate()
        ],
      ),
    );
  }
}
