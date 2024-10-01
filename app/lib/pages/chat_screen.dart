import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});
  static String id = 'chat_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Wrap with Scaffold
      appBar: AppBar(
        title: const Text('Chat'),
        backgroundColor: Colors.teal[100],
      ),
      backgroundColor: Colors.teal[50],
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const MessageStream(),
              Container(
                decoration: kMessageContainerDecoration,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        style: const TextStyle(color: Colors.black),
                        decoration: kMessageTextFieldDecoration,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // Placeholder for send functionality
                      },
                      child: const Text(
                        'Send',
                        style: kSendButtonTextStyle,
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
}

class MessageStream extends StatelessWidget {
  const MessageStream({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy message data
    final messages = [
      {'text': 'Hello!', 'sender': 'Om'},
      {'text': 'How are you?', 'sender': 'Nishant'},
      {'text': 'I am fine, thank you!', 'sender': 'Om'},
    ];

    List<MessageBubble> messageWidgets = [];
    for (var message in messages) {
      final messageText = message['text'];
      final messageSender = message['sender'];
      // Hardcoding currentUser for demonstration
      final currentUser = 'Om';
      final messageBubble = MessageBubble(
        sender: messageSender ?? "Om",
        text: messageText ?? "Hiii",
        isMe: currentUser == messageSender,
      );
      messageWidgets.add(messageBubble);
    }

    return Expanded(
      child: ListView(
        reverse: true,
        padding: const EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 20.0,
        ),
        children: messageWidgets,
      ),
    );
  }
}

class MessageBubble extends StatelessWidget {
  const MessageBubble(
      {super.key,
      required this.sender,
      required this.text,
      required this.isMe});
  final String sender, text;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            sender,
            style: const TextStyle(
              fontSize: 12.0,
              color: Colors.black54,
            ),
          ),
          Material(
            borderRadius: isMe
                ? const BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    bottomLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0))
                : const BorderRadius.only(
                    topRight: Radius.circular(30.0),
                    bottomLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0)),
            elevation: 5.0,
            color: isMe ? Colors.teal[200] : Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 20.0,
              ),
              child: Text(
                text,
                style: TextStyle(
                  color: isMe ? Colors.black : Colors.black54,
                  fontSize: 15.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Define the decoration constants
const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Color.fromRGBO(0, 78, 70, 1), width: 1.0),
  ),
);

const kMessageTextFieldDecoration = InputDecoration(
  hintText: 'Type your message here...',
  hintStyle: TextStyle(color: Colors.black54),
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
);

const kSendButtonTextStyle = TextStyle(
  color: Colors.black,
  fontSize: 18.0,
  fontWeight: FontWeight.w500,
);
