import 'package:flutter/material.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:genai/components/lottie_widget.dart';
import 'package:flutter/animation.dart';
import 'package:genai/pages/dashboard.dart';

class MeditationScreen extends StatefulWidget {
  const MeditationScreen({super.key});

  @override
  State<MeditationScreen> createState() => _MeditationScreenState();
}

class _MeditationScreenState extends State<MeditationScreen>
    with SingleTickerProviderStateMixin {
  int _duration = 30;
  final CountDownController _controller = CountDownController();

  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  bool _isCompleted = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _fadeAnimation =
        Tween<double>(begin: 0, end: 1).animate(_animationController);

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController
        .dispose(); // Dispose of animation controller to prevent memory leaks
    super.dispose();
  }

  void _incrementDuration() {
    setState(() {
      _duration += 30;
    });
  }

  void _decrementDuration() {
    if (_duration > 30) {
      setState(() {
        _duration -= 30;
      });
    }
  }

  Future<bool> _onWillPop(BuildContext context) async {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => DashboardPage(),
      ),
    );
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onWillPop(context),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Meditate',
            style: TextStyle(color: Colors.teal),
          ),
          backgroundColor: Colors.teal[50],
          centerTitle: true,
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.teal[100]!,
                Colors.grey[200]!,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Center(
            // Center the entire page content
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FadeTransition(
                  opacity: _fadeAnimation,
                  child: const SizedBox(
                    height: 150,
                    child: LottieWidget(
                      path: 'assets/animations/43792-yoga-se-hi-hoga.json',
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  'Be Calm and Breathe Slowly',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal[700],
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 0),
                Text(
                  'Duration: ${_duration ~/ 60} min ${_duration % 60} sec',
                  style: TextStyle(fontSize: 18, color: Colors.teal[600]),
                ),
                const SizedBox(height: 0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: _incrementDuration,
                      color: Colors.teal,
                    ),
                    const SizedBox(width: 20),
                    IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: _decrementDuration,
                      color: Colors.teal,
                    ),
                  ],
                ), // Reduced space
                CircularCountDownTimer(
                  duration: _duration, // Use the user-selected duration
                  initialDuration: 0,
                  controller: _controller,
                  width: MediaQuery.of(context).size.width / 2.5,
                  height: MediaQuery.of(context).size.height / 3.0,
                  ringColor: Colors.grey[300]!,
                  fillColor: Colors.teal[200]!,
                  backgroundColor: Colors.teal[100],
                  strokeWidth: 6.0,
                  strokeCap: StrokeCap.round,
                  textStyle: const TextStyle(
                    fontSize: 33.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  textFormat: CountdownTextFormat.S,
                  isReverse: false,
                  isReverseAnimation: false,
                  isTimerTextShown: true,
                  autoStart: false,
                  onStart: () {
                    debugPrint('Countdown Started');
                    _isCompleted = false; // Reset completion flag when starting
                    _animationController
                        .forward(); // Start fade animation when countdown starts
                  },
                  onComplete: () {
                    if (_isCompleted) {
                      _isCompleted = false;

                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Meditation Complete!'),
                          content: const Text('Well done on your meditation!'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: const Text('OK'),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                ),
                const SizedBox(height: 0),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Start and Pause button column
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _button(
                            title: "Start",
                            onPressed: () {
                              _controller.restart(
                                  duration:
                                      _duration); // Start with the selected duration
                              _animationController
                                  .forward(); // Start fade animation when countdown starts
                            },
                          ),
                          const SizedBox(width: 10),
                          _button(
                            title: "Resume",
                            onPressed: () => _controller.resume(),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15), // Space between the two rows

                      // Pause and Restart button row
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _button(
                            title: "Pause",
                            onPressed: () => _controller.pause(),
                          ),
                          const SizedBox(width: 10),
                          _button(
                            title: "Restart",
                            onPressed: () => _controller.restart(
                                duration:
                                    _duration), // Restart with the selected duration
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _button({required String title, VoidCallback? onPressed}) {
    return SizedBox(
      width: 150, // Fixed width for buttons for uniformity
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(Colors.teal),
          padding: WidgetStateProperty.all(const EdgeInsets.all(15)),
          shape: WidgetStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          )),
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
