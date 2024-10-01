import 'package:flutter/material.dart';
import 'package:gen_ai/components/lottie_widget.dart';
import 'dart:async';

class BreathingScreen extends StatefulWidget {
  const BreathingScreen({super.key});

  @override
  State<BreathingScreen> createState() => _BreathingScreenState();
}

class _BreathingScreenState extends State<BreathingScreen> {
  bool isStarted = false;
  Timer? _timer;
  double _sliderValue = 0.0;
  final double _maxSliderValue = 1500.0;

  void _startTimer() {
    if (isStarted) return;

    setState(() {
      isStarted = true;
    });

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_sliderValue < _maxSliderValue) {
          _sliderValue += 1.0;
        } else {
          _timer?.cancel();
          isStarted = false;
        }
      });
    });
  }

  void _stopTimer() {
    _timer?.cancel();
    setState(() {
      isStarted = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[50], // light green background color
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
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Sound Selection
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 116, 116, 116)
                            .withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.volume_up, color: Colors.white),
                          SizedBox(width: 10),
                          Text(
                            'Sound: Chirping Birds',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                // Breathing Animation Text
                Center(
                  child: Column(
                    children: [
                      isStarted
                          ? Center(
                              child: LottieWidget(
                                  path: 'assets/animations/breathing.json'))
                          : CircleAvatar(
                              radius: 120,
                              backgroundColor:
                                  const Color.fromRGBO(86, 178, 202, 1),
                              child: Text(
                                'Start',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                    ],
                  ),
                ),

                // Timer Slider and Control Buttons

                Column(
                  children: [
                    Text(
                      "05:21",
                      style: TextStyle(
                          color: const Color.fromRGBO(0, 90, 109, 1),
                          fontSize: 18),
                    ),
                    Slider(
                      value: _sliderValue,
                      max: _maxSliderValue,
                      activeColor: Color.fromRGBO(0, 90, 109, 1),
                      inactiveColor: Colors.white,
                      onChanged: (double value) {},
                    ),
                    Text(
                      "25:00",
                      style: TextStyle(
                          color: Color.fromRGBO(0, 90, 109, 1), fontSize: 18),
                    ),

                    SizedBox(height: 20),

                    // Play/Pause, Repeat and Backward buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          icon: Icon(Icons.replay_10,
                              color: Color.fromRGBO(0, 90, 109, 1)),
                          iconSize: 40,
                          onPressed: () {},
                        ),
                        isStarted
                            ? Center(
                                child: ElevatedButton(
                                  onPressed: isStarted ? _stopTimer : null,
                                  child: Text('Stop',
                                      style: TextStyle(
                                          color:
                                              Color.fromRGBO(0, 90, 109, 1))),
                                ),
                              )
                            : Center(
                                child: ElevatedButton(
                                    onPressed: isStarted ? null : _startTimer,
                                    child: Text('Start',
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(0, 90, 109, 1),
                                            fontSize: 20))),
                              ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
