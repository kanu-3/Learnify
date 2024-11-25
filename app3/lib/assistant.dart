import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ChatResponse {
  final String response;

  ChatResponse({required this.response});

  factory ChatResponse.fromJson(Map<String, dynamic> json) {
    return ChatResponse(response: json['response'] ?? 'No response');
  }
}

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _queryController = TextEditingController();
  String _response = '';

  Future<void> sendChatRequest(String query) async {
    const url = 'https://lms-hk98.onrender.com/chat';

    final userProfile = {
      "goal": "Data Science",
      "completed_courses": ["Python for Beginners", "Intro to SQL"]
    };

    final body = json.encode({
      "user_profile": userProfile,
      "query": query,
    });

    final headers = {
      'Content-Type': 'application/json',
    };

    try {
      
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: body,
      );

      print('Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');

      if (response.statusCode == 200) {
        final chatResponse = ChatResponse.fromJson(json.decode(response.body));
        setState(() {
          _response = chatResponse.response;
        });
      } else {
        print('Error: Failed to load response, Status code: ${response.statusCode}');
        setState(() {
          _response = 'Error: Failed to load response';
        });
      }
    } catch (e) {
      print('Error sending chat request: $e');
      setState(() {
        _response = 'Error sending chat request';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text("Assistant",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Ask a question...', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  TextField(
                    controller: _queryController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter your query',
                    ),
                    maxLines: 3,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      final query = _queryController.text;
                      if (query.isNotEmpty) {
                        sendChatRequest(query);
                      } else {
                        setState(() {
                          _response = 'Please enter a valid query.';
                        });
                      }
                    },
                    child: Text('Send'),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Response:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    _response.isEmpty ? 'No response yet' : _response,
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
