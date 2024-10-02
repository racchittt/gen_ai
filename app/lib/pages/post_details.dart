import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PostDetailsPage extends StatelessWidget {
  final Map<String, dynamic> post;

  PostDetailsPage({required this.post});

  @override
  Widget build(BuildContext context) {
    final List<Comment> comments = [
      Comment(commenter: 'Anonymous', content: 'This is a comment.'),
      Comment(commenter: 'Anonymous', content: 'This is another comment.'),
      Comment(commenter: 'Anonymous', content: 'This is another comment.'),
      Comment(commenter: 'Anonymous', content: 'This is another comment.'),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Details'),
        backgroundColor: Colors.teal[100],
      ),
      body: Padding(
        padding: const EdgeInsets.all(0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.teal[100],
                border: Border(
                  bottom: BorderSide(
                    color: Colors.black,
                    width: 2.0,
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 20.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "Anonymous User",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                          fontSize: 20.0,
                        ),
                      ),
                      Text(
                        '${_formatTimestamp(post['timestamp'])}',
                        style: const TextStyle(
                          color: Colors.black54,
                          fontSize: 14.0,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        post['content'],
                        style: const TextStyle(
                          color: Colors.black87,
                          fontSize: 16.0,
                        ),
                      ),
                    ]),
              ),
            ),
            Text(
              'Comments',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.teal[900],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: comments.length,
                itemBuilder: (context, index) {
                  return CommentWidget(comment: comments[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatTimestamp(DateTime timestamp) {
    return DateFormat('dd/MM/yyyy HH:mm').format(timestamp);
  }
}

class Comment {
  final String commenter;
  final String content;

  Comment({required this.commenter, required this.content});
}

class CommentWidget extends StatelessWidget {
  final Comment comment;

  CommentWidget({required this.comment});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.teal[50],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            comment.commenter,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black87,
              fontSize: 14.0,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            comment.content,
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 12.0,
            ),
          ),
        ],
      ),
    );
  }
}
