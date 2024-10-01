import 'package:flutter/material.dart';
import 'package:gen_ai/pages/dashboard.dart';
import 'package:intl/intl.dart';

class CommunityPage extends StatefulWidget {
  @override
  _CommunityPageState createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  final List<Map<String, dynamic>> _posts = [];
  final _controller = TextEditingController();

  void _addPost() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _posts.add({
          'content': _controller.text,
          'timestamp': DateTime.now(),
          'likes': 0,
        });
        _controller.clear();
      });
    }
  }

  void _likePost(int index) {
    setState(() {
      _posts[index]['likes'] += 1;
    });
  }

  void _deletePost(int index) {
    setState(() {
      _posts.removeAt(index);
    });
  }

  String _formatTimestamp(DateTime timestamp) {
    return DateFormat('dd/MM/yyyy HH:mm').format(timestamp);
  }

  Future<bool> _onWillPop(BuildContext context) async {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => DashboardPage(), // Navigate to Dashboard
      ),
    );
    return false; // Prevent the default back button behavior
  }

  @override
  Widget build(BuildContext context) {
    final themeColor = Colors.teal;

    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () => _onWillPop(context),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Community'),
          centerTitle: true,
          backgroundColor: Colors.teal[100],
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        DashboardPage()), // Navigate to Dashboard
              );
            },
          ),
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
          child: Column(
            children: <Widget>[
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
                            color: Colors.teal.shade50,
                            child: Padding(
                              padding: const EdgeInsets.all(
                                  16.0), // Add padding here
                              child: ListTile(
                                title: Text(
                                  "Anonymous User",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87,
                                      fontSize: 15.0),
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${_formatTimestamp(post['timestamp'])}',
                                      style: const TextStyle(
                                        color: Colors.black54,
                                        fontSize: 12.0,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      post['content'],
                                      style: const TextStyle(
                                        color: Colors.black87,
                                      ),
                                    ),
                                  ],
                                ),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      icon: Icon(
                                        Icons.thumb_up_off_alt_rounded,
                                        color: themeColor,
                                      ),
                                      onPressed: () => _likePost(index),
                                    ),
                                    Text(
                                      '${post['likes']}',
                                      style: TextStyle(
                                        color: themeColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    IconButton(
                                      icon: Icon(
                                        Icons.delete,
                                        color: Colors.red.shade400,
                                      ),
                                      onPressed: () => _deletePost(index),
                                    ),
                                  ],
                                ),
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
                        decoration: InputDecoration(
                          labelText: 'Enter your post',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: themeColor, width: 2),
                          ),
                          prefixIcon: Icon(Icons.edit, color: themeColor),
                          filled: true,
                          fillColor: Colors.teal.shade50,
                          labelStyle: TextStyle(color: themeColor),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: themeColor, width: 2),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: _addPost,
                      child: const Text(
                        'Post',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: themeColor,
                        padding: const EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 25.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
