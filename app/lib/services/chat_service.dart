import 'dart:convert';
import 'package:http/http.dart' as http;

class ChatService {
  Future<void> sendMessages(String userId, String message) async {
    try {
      final url = Uri.parse('http://10.0.2.2:4000/api/v1/chat/add');
      final headers = {'Content-Type': 'application/json'};
      final body = jsonEncode({
        'userId': userId,
        'message': message,
      });
      final response = await http.post(url, headers: headers, body: body);
      if (response.statusCode == 200) {
        print('Message sent');
      } else {
        print('Failed to send message');
      }
    } catch (e) {
      print("Error sending messages: $e");
    }
  }

  Future<List<dynamic>> getMessages(String userId, String date) async {
    try {
      final url =
          Uri.parse('http://10.0.2.2:4000/api/v1/chat/get/$userId/$date');
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final messages = jsonDecode(response.body);
        return messages;
      } else {
        print('Failed to get messages');
        return [];
      }
    } catch (e) {
      print("Error getting messages: $e");
      return [];
    }
  }
}
