import 'dart:convert';

import 'package:http/http.dart'
as http;

class AuthService {

  static const String loginUrl =
      "http://10.0.2.2/flutter_api/login.php";

  static Future<Map<String,dynamic>>
  login({

    required String email,

    required String password,

  }) async {

    final response =
    await http.post(

      Uri.parse(loginUrl),

      headers: {
        "Content-Type":
        "application/json"
      },

      body: jsonEncode({

        "email": email,

        "password": password,

      }),
    );

    return jsonDecode(
      response.body,
    );
  }
}