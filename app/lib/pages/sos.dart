import 'package:flutter/material.dart';
import 'package:genai/components/custom_sos_container.dart';
import 'package:genai/pages/dashboard.dart';

class SosScreen extends StatelessWidget {
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
            'SOS',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.teal[50],
          elevation: 0,
        ),
        body: Container(
          decoration: BoxDecoration(
            color: Colors.teal[50],
          ),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 16),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 20,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: ElevatedButton(
                      onPressed: () {
                        () {};
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.white,
                        padding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 0),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(4.0, 4.0, 4.0, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.call, color: Colors.teal, size: 25),
                            SizedBox(
                                width:
                                    8), // Add some space between the icon and the text
                            Text(
                              'Call your buddy',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w600,
                                color: Colors.teal[900],
                              ),
                            ),
                          ],
                        ),
                      )),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: Colors.white,
                        thickness: 2,
                        indent: 50,
                        endIndent: 8,
                      ),
                    ),
                    const Text(
                      'or',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.white,
                        thickness: 2,
                        indent: 8,
                        endIndent: 50,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    border: Border.all(
                      color: Colors.white,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Center(
                        child: Text(
                          'Emergency Contacts',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            color: Colors.teal[900],
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        margin: const EdgeInsets.fromLTRB(25, 5, 25, 5),
                        child: CustomButton(
                          onPressed: () {},
                          text: 'Helpline',
                          icon: Icons.phone,
                          color: Colors.blue, // Pass the color argument
                        ),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        margin: const EdgeInsets.fromLTRB(25, 5, 25, 0),
                        child: CustomButton(
                          onPressed: () {},
                          text: 'Helpline',
                          icon: Icons.help,
                          color: Colors.green, // Pass the color argument
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 25),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    border: Border.all(
                      color: Colors.white,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Center(
                        child: Text(
                          'Update Buddy',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            color: Colors.teal[900],
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'You can update your buddy to keep them informed about your whereabouts.',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.teal[800],
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      CustomButton(
                        onPressed: () {},
                        text: 'Update Buddy',
                        icon: Icons.info,
                        color: Colors.orange, // Pass the color argument
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 25),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
