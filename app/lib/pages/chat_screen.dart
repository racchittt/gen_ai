import 'package:flutter/material.dart';
import 'package:genai/pages/dashboard.dart';
import 'package:genai/services/chat_service.dart';
import 'package:intl/intl.dart';

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
          '901bf4b9-caa5-4376-a0ec-d0d450cfe1e5', getFormattedDate());
      setState(() {
        _messages = messages;
      });
      print(messages);
    } catch (e) {
      print('Error fetching messages: $e');
    }
  }

  String getFormattedDate() {
    final DateTime now = DateTime.now()
        .subtract(Duration(hours: 10, minutes: 30)); // nam5(Oklahoma) time
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(now);
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
                    reverse: false,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 20.0,
                    ),
                    itemCount: _messages.length,
                    itemBuilder: (context, index) {
                      final message = _messages[index];
                      print('THis is messae');
                      print(message);
                      return MessageBubble(
                        sender: message['sender'] ?? 'Unknown',
                        text: message['message'] ?? '',
                        isMe: message['sender'] != 'Pepo',
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
                            style: const TextStyle(color: Colors.black),
                            decoration: kMessageTextFieldDecoration,
                          ),
                        ),
                        SizedBox(width: 8),
                        ElevatedButton(
                          onPressed: () async {
                            final message = _messageController.text;
                            _messageController.clear();
                            if (message.isNotEmpty) {
                              setState(() {
                                _messages.insert(_messages.length, {
                                  'sender': 'User',
                                  'userId': _userId,
                                  'message': message,
                                  'timestamp':
                                      DateTime.now().millisecondsSinceEpoch,
                                });
                              });
                              final response = await _chatService.sendMessages(
                                  _userId, message);
                              setState(() {
                                _messages.insert(_messages.length, {
                                  'sender': 'Pepo',
                                  'message': response,
                                  'timestamp':
                                      DateTime.now().millisecondsSinceEpoch,
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
