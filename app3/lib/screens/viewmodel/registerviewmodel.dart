import 'dart:convert';

import 'package:http/http.dart' as http;
import '../../model/registermodel.dart';

class AuthViewModel {
  final String baseUrl;

  AuthViewModel(this.baseUrl);

  // Register a new user
  Future<Map<String, dynamic>> registerUser(UserModel user) async {
    final url = Uri.parse('https://lms-j25h.onrender.com/api/auth/register');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode(user.toJson()),
    );

    if (response.statusCode == 201) {
      // Success: Parse response
      return {'success': true, 'message': json.decode(response.body)['message']};
    } else if (response.statusCode == 400) {
      // Bad Request: Handle validation errors
      return {'success': false, 'message': json.decode(response.body)['message']};
    } else if (response.statusCode == 500) {
      // Server Error
      return {'success': false, 'message': 'Server error. Please try again later.'};
    } else {
      // Unknown Error
      return {'success': false, 'message': 'An unknown error occurred.'};
    }
  }
}
