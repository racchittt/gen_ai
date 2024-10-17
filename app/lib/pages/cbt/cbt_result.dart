import 'package:flutter/material.dart';

class CBTResultPage extends StatelessWidget {
  final int phqTotal;
  final int gadTotal;
  final List<int> phobiaScores;
  final int workSocialTotal;

  CBTResultPage({
    required this.phqTotal,
    required this.gadTotal,
    required this.phobiaScores,
    required this.workSocialTotal,
  });

  String _getPHQSeverity() {
    if (phqTotal >= 20) return "Severe";
    if (phqTotal >= 15) return "Moderately Severe";
    if (phqTotal >= 10) return "Moderate";
    if (phqTotal >= 5) return "Mild";
    return "None";
  }

  String _getGADSeverity() {
    if (gadTotal >= 16) return "Severe Anxiety";
    if (gadTotal >= 11) return "Moderate Anxiety";
    if (gadTotal >= 5) return "Mild Anxiety";
    return "None";
  }

  String _getPhobiaAssessment() {
    return phobiaScores.any((score) => score >= 4)
        ? "Further assessment recommended for possible phobia"
        : "No significant phobia symptoms detected";
  }

  String _getWorkSocialSeverity() {
    if (workSocialTotal >= 20) return "Severe Impairment";
    if (workSocialTotal >= 10) return "Moderate Impairment";
    return "Low Impairment";
  }

  void _showInfoDialog(BuildContext context, String title, String content) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          actions: [
            TextButton(
              child: Text(
                'Close',
                style: TextStyle(color: Colors.teal[300]),
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CBT Results'),
        backgroundColor: Colors.teal[300],
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Test Results",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () => _showInfoDialog(
                context,
                "PHQ-9",
                "The Patient Health Questionnaire (PHQ) is a self-administered version of the PRIME-MD diagnostic instrument for common mental disorders. The PHQ-9 is the depression module, which scores each of the 9 DSM-IV criteria as “0” (not at all) to “3” (nearly every day).",
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("PHQ-9 Total: $phqTotal",
                      style: TextStyle(fontSize: 18)),
                  Text("Severity: ${_getPHQSeverity()}",
                      style: TextStyle(fontSize: 18)),
                ],
              ),
            ),
            Divider(),
            GestureDetector(
              onTap: () => _showInfoDialog(
                context,
                "GAD-7",
                "The Generalized Anxiety Disorder-7 (GAD-7) is a brief self-report scale to measure anxiety levels. The GAD-7 assesses symptoms of generalized anxiety disorder and scores them from “0” (not at all) to “3” (nearly every day).",
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("GAD-7 Total: $gadTotal",
                      style: TextStyle(fontSize: 18)),
                  Text("Severity: ${_getGADSeverity()}",
                      style: TextStyle(fontSize: 18)),
                ],
              ),
            ),
            Divider(),
            GestureDetector(
              onTap: () => _showInfoDialog(
                context,
                "Phobia Assessment",
                "This section assesses common phobias by rating symptoms on a scale from “0” (not at all) to “4” (extreme fear). Scores help identify potential phobic tendencies.",
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Phobia Assessment", style: TextStyle(fontSize: 18)),
                  Text("${_getPhobiaAssessment()}",
                      style: TextStyle(fontSize: 18)),
                ],
              ),
            ),
            Divider(),
            GestureDetector(
              onTap: () => _showInfoDialog(
                context,
                "Work and Social Adjustment",
                "The Work and Social Adjustment Scale (WSAS) measures how mental health problems affect a person’s ability to work and function socially. Higher scores indicate greater impairment in work and social functioning.",
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Work and Social Adjustment Total: $workSocialTotal",
                      style: TextStyle(fontSize: 18)),
                  Text("Severity: ${_getWorkSocialSeverity()}",
                      style: TextStyle(fontSize: 18)),
                ],
              ),
            ),
            Divider(),
            SizedBox(height: 20),
            Text(
              "Important Note: These results are for informational purposes only and are not a diagnostic tool. Please consult a healthcare professional for a proper diagnosis.",
              style: TextStyle(fontSize: 14, color: Colors.red[800]),
            ),
          ],
        ),
      ),
    );
  }
}
