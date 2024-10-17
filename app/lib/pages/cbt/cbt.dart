import 'package:flutter/material.dart';
import 'package:genai/pages/cbt/cbt_result.dart';

class CBTTestPage extends StatefulWidget {
  @override
  _CBTTestPageState createState() => _CBTTestPageState();
}

class _CBTTestPageState extends State<CBTTestPage> {
  final _formKey = GlobalKey<FormState>();

  // Storing user answers
  Map<String, int> _phqAnswers = {};
  Map<String, int> _gadAnswers = {};
  Map<String, int> _phobiaAnswers = {};
  Map<String, int> _workSocialAnswers = {};

  final List<String> phqQuestions = [
    "1. Little interest or pleasure in doing things?",
    "2. Feeling down, depressed, or hopeless?",
    "3. Trouble falling or staying asleep, or sleeping too much?",
    "4. Feeling tired or having little energy?",
    "5. Poor appetite or overeating?",
    "6. Feeling bad about yourself or that you are a failure?",
    "7. Trouble concentrating on things?",
    "8. Moving or speaking slowly? Or restless?",
    "9. Thoughts of being better off dead or hurting yourself?"
  ];

  final List<String> gadQuestions = [
    "10. Feeling nervous, anxious or on edge?",
    "11. Not being able to stop or control worrying?",
    "12. Worrying too much about different things?",
    "13. Trouble relaxing?",
    "14. Being so restless that it is hard to sit still?",
    "15. Becoming easily annoyed or irritable?",
    "16. Feeling afraid as if something awful might happen?"
  ];

  final List<String> phobiaQuestions = [
    "17. Social situations due to fear of being embarrassed?",
    "18. Certain situations because of fear of having a panic attack?",
    "19. Certain situations because of a fear of particular objects?"
  ];

  final List<String> workSocialQuestions = [
    "20. WORK/STUDY - Ability to perform tasks at work or study?",
    "21. HOME MANAGEMENT - Self-care and managing household?",
    "22. SOCIAL LEISURE ACTIVITIES - Participation in social events?",
    "23. PRIVATE LEISURE ACTIVITIES - Enjoyment of activities done alone?",
    "24. FAMILY AND RELATIONSHIPS - Forming and maintaining relationships?"
  ];

  @override
  void initState() {
    super.initState();

    _phqAnswers =
        Map.fromIterable(phqQuestions, key: (q) => q, value: (_) => 0);
    _gadAnswers =
        Map.fromIterable(gadQuestions, key: (q) => q, value: (_) => 0);
    _phobiaAnswers =
        Map.fromIterable(phobiaQuestions, key: (q) => q, value: (_) => 0);
    _workSocialAnswers =
        Map.fromIterable(workSocialQuestions, key: (q) => q, value: (_) => 0);
  }

  Widget _buildQuestion(
      String question, Map<String, int> answerMap, String type, int maxScale) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          question,
          style: TextStyle(fontSize: 18),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
          child: SliderTheme(
            data: SliderThemeData(
              activeTrackColor: Colors.orange,
              inactiveTrackColor: Colors.grey[300],
              trackHeight: 15.0,
              thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
              thumbColor: Colors.teal[900],
              overlayColor: Colors.white,
              overlayShape: RoundSliderOverlayShape(overlayRadius: 5.0),
              valueIndicatorColor: Colors.white,
              trackShape: RoundedRectSliderTrackShape(),
              activeTickMarkColor: Colors.white,
              inactiveTickMarkColor: Colors.grey[300],
              tickMarkShape: RoundSliderTickMarkShape(),
            ),
            child: Slider(
              value: answerMap[question]!.toDouble(),
              min: 0,
              max: maxScale.toDouble(),
              divisions: maxScale,
              label: answerMap[question]!.toString(),
              activeColor: Colors.teal,
              onChanged: (value) {
                setState(() {
                  answerMap[question] = value.toInt();
                });
              },
            ),
          ),
        ),
        Divider(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CBT Test'),
        backgroundColor: Colors.teal[100],
        foregroundColor: Colors.teal[900],
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: <Widget>[
                ...phqQuestions
                    .map((q) => _buildQuestion(q, _phqAnswers, 'PHQ', 3))
                    .toList(),
                ...gadQuestions
                    .map((q) => _buildQuestion(q, _gadAnswers, 'GAD', 3))
                    .toList(),
                ...phobiaQuestions
                    .map((q) => _buildQuestion(q, _phobiaAnswers, 'Phobia', 8))
                    .toList(),
                ...workSocialQuestions
                    .map((q) =>
                        _buildQuestion(q, _workSocialAnswers, 'WorkSocial', 8))
                    .toList(),
                SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal[200],
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();

                      // Calculate total scores
                      int phqTotal = _phqAnswers.values.reduce((a, b) => a + b);
                      int gadTotal = _gadAnswers.values.reduce((a, b) => a + b);
                      List<int> phobiaScores = _phobiaAnswers.values.toList();
                      int workSocialTotal =
                          _workSocialAnswers.values.reduce((a, b) => a + b);

                      // Navigate to the results page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CBTResultPage(
                            phqTotal: phqTotal,
                            gadTotal: gadTotal,
                            phobiaScores: phobiaScores,
                            workSocialTotal: workSocialTotal,
                          ),
                        ),
                      );
                    }
                  },
                  child: Text('Submit',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
