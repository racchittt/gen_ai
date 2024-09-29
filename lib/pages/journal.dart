import 'package:flutter/material.dart';
import 'package:gen_ai/components/lottie_widget.dart';

class Journal extends StatefulWidget {
  const Journal({super.key});

  @override
  State<Journal> createState() => _JournalState();
}

class _JournalState extends State<Journal> {
  TextEditingController field1 = TextEditingController();
  TextEditingController field2 = TextEditingController();
  TextEditingController field3 = TextEditingController();
  FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    field1.text = ""; // Initial value of text field
    field2.text = "";
    field3.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gratitude"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Write three points on gratitude!',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: field1,
                  decoration: const InputDecoration(
                    labelText: "I am grateful for",
                    icon: Icon(Icons.monitor_heart_sharp),
                  ),
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: field2,
                  decoration: const InputDecoration(
                    labelText: "I am grateful for",
                    icon: Icon(Icons.monitor_heart_sharp),
                  ),
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: field3,
                  decoration: const InputDecoration(
                    labelText: "I am grateful for",
                    icon: Icon(Icons.monitor_heart_rounded),
                  ),
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        // Share functionality here
                      },
                      icon: const Icon(
                        Icons.share,
                        size: 24.0,
                      ),
                      label: const Text('Share'),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const LottieWidget(path: 'assets/animations/writing.json'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
