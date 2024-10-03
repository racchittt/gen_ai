import 'package:flutter/material.dart';
import 'package:genai/pages/dashboard.dart';
import 'package:genai/services/chat_service.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});
  static String id = 'chat_screen';

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final ChatService _chatService = ChatService();
  List<dynamic> _messages = [];
  @override
  void initState() {
    super.initState();
    _fetchMessages();
  }

  Future<void> _fetchMessages() async {
    try {
      final messages = await _chatService.getMessages(
          '901bf4b9-caa5-4376-a0ec-d0d450cfe1e5', '2024-10-02');
      setState(() {
        _messages = messages;
      });
      print(messages);
    } catch (e) {
      print('Error fetching messages: $e');
    }
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  final String _userId = '901bf4b9-caa5-4376-a0ec-d0d450cfe1e5';

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
          title: const Text('Chat'),
          backgroundColor: Colors.teal[300],
          actions: [
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {
                // Placeholder for more options
              },
            ),
          ],
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
                Expanded(
                  child: ListView.builder(
                    reverse: true,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 20.0,
                    ),
                    itemCount: _messages.length,
                    itemBuilder: (context, index) {
                      final message = _messages[index];
                      return MessageBubble(
                        sender: message['sender'] ?? 'Unknown',
                        text: message['message'] ?? '',
                        isMe: message['sender'] != 'bot',
                      );
                    },
                  ),
                ),
                Container(
                  decoration: BoxDecoration(),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: TextField(
                            controller: _messageController,
                            style: const TextStyle(
                                color: Color.fromARGB(255, 165, 160, 160)),
                            decoration: kMessageTextFieldDecoration,
                          ),
                        ),
                        SizedBox(width: 8),
                        ElevatedButton(
                          onPressed: () async {
                            final message = _messageController.text;
                            if (message.isNotEmpty) {
                              setState(() {
                                _messages.insert(0, {
                                  'sender': 'User',
                                  'userId': _userId,
                                  'message': message,
                                  'timestamp':
                                      DateTime.now().millisecondsSinceEpoch,
                                });
                              });
                              await _chatService.sendMessages(_userId, message);
                              _messageController.clear();

                              // Simulate AI response (replace with actual AI integration)
                              Future.delayed(Duration(seconds: 1), () {
                                setState(() {
                                  _messages.insert(0, {
                                    'sender': 'AI',
                                    'userId': 'ai-user-id',
                                    'message':
                                        'This is a simulated AI response.',
                                    'timestamp':
                                        DateTime.now().millisecondsSinceEpoch,
                                  });
                                });
                              });
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.teal[300],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: 20.0,
                              vertical: 10.0,
                            ),
                          ),
                          child: const Text(
                            'Send',
                            style: kSendButtonTextStyle,
                          ),
                        ),
                      ],
                    ),
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

class MessageStream extends StatelessWidget {
  const MessageStream({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy message data
    final messages = [
      {'text': 'Hello!', 'sender': 'Om'},
      {'text': 'How are you?', 'sender': 'AI'},
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
  const MessageBubble({
    super.key,
    required this.sender,
    required this.text,
    required this.isMe,
  });

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
                    bottomRight: Radius.circular(30.0),
                  )
                : const BorderRadius.only(
                    topRight: Radius.circular(30.0),
                    bottomLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0),
                  ),
            elevation: 5.0,
            shadowColor: Colors.black45,
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

const kMessageTextFieldDecoration = InputDecoration(
  hintText: 'Type your message here...',
  hintStyle: TextStyle(color: Colors.black54),
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(30.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.teal, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(30.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.teal, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(30.0)),
  ),
);

const kSendButtonTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 18.0,
  fontWeight: FontWeight.w500,
);
