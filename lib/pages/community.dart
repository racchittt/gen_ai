import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Community Page'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: _posts.isEmpty
                ? Center(
                    child: Text(
                      'No posts yet. Be the first to contribute!',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  )
                : ListView.builder(
                    itemCount: _posts.length,
                    itemBuilder: (context, index) {
                      final post = _posts[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 16.0),
                        color: const Color(0xFFC5C5C5),
                        child: ListTile(
                          title: Text(post['content']),
                          subtitle: Text(
                              'Posted on ${_formatTimestamp(post['timestamp'])}'),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: Icon(Icons.thumb_up_off_alt_rounded),
                                onPressed: () => _likePost(index),
                              ),
                              Text('${post['likes']}'),
                              IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: () => _deletePost(index),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      labelText: 'Enter your post',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.edit),
                    ),
                  ),
                ),
                SizedBox(width: 8.0),
                ElevatedButton(
                  onPressed: _addPost,
                  child: Text('Post'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
