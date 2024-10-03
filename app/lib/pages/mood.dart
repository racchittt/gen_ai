import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:genai/pages/dashboard.dart';

class MoodScreen extends StatefulWidget {
  @override
  _MoodScreenState createState() => _MoodScreenState();
}

class _MoodScreenState extends State<MoodScreen> {
  double _currentValue = 3.0;
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
        backgroundColor: const Color.fromRGBO(248, 244, 243, 1),
        appBar: AppBar(
          title: Text('Assessment'),
          elevation: 0,
          backgroundColor: Colors.grey[200],
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "How are you feeling today?",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      SizedBox(height: 20),
                      _buildLabelWithIcon(
                          "Excellent", "assets/svgs/excellent.svg", 5),
                      SizedBox(height: 20),
                      _buildLabelWithIcon("Good", "assets/svgs/good.svg", 4),
                      SizedBox(height: 20),
                      _buildLabelWithIcon("Fair", "assets/svgs/fair.svg", 3),
                      SizedBox(height: 20),
                      _buildLabelWithIcon("Poor", "assets/svgs/poor.svg", 2),
                      SizedBox(height: 20),
                      _buildLabelWithIcon("Worst", "assets/svgs/worst.svg", 1),
                    ],
                  ),
                  RotatedBox(
                    quarterTurns: 3,
                    child: Container(
                      width: 550, // Set the desired width for the slider
                      child: SliderTheme(
                        data: SliderThemeData(
                            activeTrackColor: Colors.orange,
                            inactiveTrackColor: Colors.grey[300],
                            trackHeight: 30.0,
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 25.0),
                            thumbColor: const Color.fromRGBO(254, 129, 75, 1.0),
                            overlayColor: const Color.fromRGBO(253, 99, 27, 1),
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 30.0),
                            valueIndicatorColor: Colors.orangeAccent,
                            trackShape: RoundedRectSliderTrackShape(),
                            activeTickMarkColor: Colors.orangeAccent,
                            inactiveTickMarkColor: Colors.grey[300],
                            tickMarkShape: RoundSliderTickMarkShape()),
                        child: Slider(
                          value: _currentValue,
                          min: 1,
                          max: 5,
                          divisions: 4,
                          onChanged: (double value) {
                            setState(() {
                              _currentValue = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLabelWithIcon(String label, String svgPath, int position) {
    Color filterColor =
        _currentValue == position ? Colors.black : Colors.grey[300]!;
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentValue = position.toDouble();
        });
      },
      child: Column(
        children: [
          Row(
            children: [
              ColorFiltered(
                colorFilter: ColorFilter.mode(
                  filterColor.withOpacity(_currentValue == position
                      ? 0.0
                      : 0.5), // Set the opacity for the filter
                  BlendMode.srcATop, // Blend mode to apply
                ),
                child: SvgPicture.asset(
                  svgPath,
                  width: 75,
                  height: 75,
                ),
              ),
              SizedBox(width: 10),
            ],
          ),
          SizedBox(height: 15),
        ],
      ),
    );
  }
}
