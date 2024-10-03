import 'package:flutter/material.dart';
import 'package:genai/pages/dashboard.dart';
import 'package:genai/pages/post_details.dart';
import 'package:genai/services/community_service.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:intl/intl.dart';

class CommunityPage extends StatefulWidget {
  const CommunityPage({super.key});
  static String id = 'community_screen';

  @override
  _CommunityPageState createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  final TextEditingController _controller = TextEditingController();
  List<dynamic> _posts = [];
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _fetchCommunityMessages();
  }

  Future<void> _fetchCommunityMessages() async {
    try {
      final communityService = CommunityService();
      final messages = await communityService.getCommunityMessages();
      setState(() {
        _posts = messages;
        _errorMessage = null;
      });
      // print(messages);
    } catch (e) {
      setState(() {
        _errorMessage = 'Error fetching community messages: $e';
      });
    }
  }

  String _formatTimestamp(int timestamp) {
    final dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
    return DateFormat('yyyy/MM/dd HH:mm').format(dateTime);
  }

  Future<void> _addPost() async {
    final message = _controller.text;
    if (message.isNotEmpty) {
      try {
        final communityService = CommunityService();
        await communityService.createCommunityMessage(
            '2afca97e-8c6c-4f08-acee-bc9af7489726', message);
        setState(() {
          _posts.add({
            'userId': 'Anonymous User',
            'timestamp': DateTime.now().millisecondsSinceEpoch,
            'message': message,
            'comments': [],
          });
          _controller.clear();
        });
      } catch (e) {
        setState(() {
          _errorMessage = 'Error sending message: $e';
        });
      }
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
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onWillPop(context),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Community'),
          backgroundColor: Colors.teal[300],
        ),
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
            child: Column(
              children: <Widget>[
                if (_errorMessage != null)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      _errorMessage!,
                      style: const TextStyle(color: Colors.red),
                    ),
                  ),
                Expanded(
                  child: _posts.isEmpty
                      ? const Center(
                          child: Text(
                            'No posts yet. Be the first to contribute!',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.grey,
                            ),
                          ),
                        )
                      : ListView.builder(
                          itemCount: _posts.length,
                          itemBuilder: (context, index) {
                            final post = _posts[index];
                            return Card(
                              elevation: 4,
                              margin: const EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 10.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: ListTile(
                                  title: Text('Anonymous User'),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 4),
                                      Text(
                                        _formatTimestamp(post['timestamp']),
                                        style: const TextStyle(
                                          color: Colors.black87,
                                          fontSize: 12.0,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        post['message'],
                                        style: const TextStyle(
                                          color: Colors.black87,
                                          fontSize: 16.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            PostDetailsPage(post: post),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            );
                          },
                        ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: TextField(
                          controller: _controller,
                          decoration: const InputDecoration(
                            hintText: 'Write a post...',
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30.0)),
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.send),
                        onPressed: _addPost,
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
}
