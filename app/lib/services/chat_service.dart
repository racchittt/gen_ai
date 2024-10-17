import 'dart:convert';
import 'package:http/http.dart' as http;

class ChatService {
  Future<String> sendMessages(String userId, String message) async {
    try {
      final url = Uri.parse('https://gen-ai-g6tt.onrender.com/api/v1/chat/add');
      final headers = {'Content-Type': 'application/json'};
      final body = jsonEncode({
        'userId': userId,
        'message': message,
      });
      final response = await http.post(url, headers: headers, body: body);
      if (response.statusCode == 200) {
        print('Message sent');
        final responseBody = jsonDecode(response.body);
        return responseBody['botResponse'];
      } else {
        print('Failed to send message');
        return "";
      }
    } catch (e) {
      print("Error sending messages: $e");
      return "";
    }
  }

  Future<List<dynamic>> getMessages(String userId, String date) async {
    try {
      final url = Uri.parse(
          'https://gen-ai-g6tt.onrender.com/api/v1/chat/get/$userId/$date');
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
