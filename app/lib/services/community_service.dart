import 'dart:convert';
import 'package:http/http.dart' as http;

class CommunityService {
  Future<void> createCommunityMessage(String userId, String message) async {
    try {
      final url =
          Uri.parse('https://gen-ai-g6tt.onrender.com/api/v1/community/create');
      final headers = {'Content-Type': 'application/json'};
      final body = jsonEncode({
        'userId': userId,
        'message': message,
      });
      final response = await http.post(url, headers: headers, body: body);
      if (response.statusCode == 200) {
        print('Message created');
      } else {
        print('Failed to create message');
      }
    } catch (e) {
      print("Error creating messages: $e");
    }
  }

  Future<void> addComment(String userId, String comment) async {
    try {
      final url = Uri.parse(
          'https://gen-ai-g6tt.onrender.com/api/v1/community/addComment/$userId');
      final headers = {'Content-Type': 'application/json'};
      final body = jsonEncode({
        'userId': userId,
        'comment': comment,
      });
      final response = await http.post(url, headers: headers, body: body);
      if (response.statusCode == 200) {
        print('comment sent');
      } else {
        print('Failed to send comment');
      }
    } catch (e) {
      print("Error sending comment: $e");
    }
  }

  Future<List<dynamic>> getCommunityMessages() async {
    try {
      final url =
          Uri.parse('https://gen-ai-g6tt.onrender.com/api/v1/community/get');
      final headers = {'Content-Type': 'application/json'};
      final response = await http.get(url, headers: headers);
      final messages = jsonDecode(response.body);
      if (response.statusCode == 200) {
        print('Got messages');
        return messages;
      } else {
        print('Failed to get message');
        return [];
      }
    } catch (e) {
      print("Error getting messages: $e");
      return [];
    }
  }

  Future<List<dynamic>> getCommunityMessagesById(String userId) async {
    try {
      final url = Uri.parse(
          'https://gen-ai-g6tt.onrender.com/api/v1/community/get/$userId');
      final headers = {'Content-Type': 'application/json'};
      final response = await http.get(url, headers: headers);
      final messages = jsonDecode(response.body);
      if (response.statusCode == 200) {
        print('got messages');
        return messages;
      } else {
        print('Failed to get message');
        return [];
      }
    } catch (e) {
      print("Error getting messages: $e");
      return [];
    }
  }
}
