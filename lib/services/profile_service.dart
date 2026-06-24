import 'dart:convert';

import 'package:http/http.dart'
as http;

import '../models/user_model.dart';

class ProfileService {

  static Future<User>
  getProfile(
      int userId
      ) async {

    final response =
    await http.get(

      Uri.parse(
          "http://10.0.2.2/flutter_api/profile.php?id=$userId"
      ),
    );

    final json =
    jsonDecode(
      response.body,
    );

    if(
    json["status"]
        ==
        "success"
    ){

      return User.fromJson(
        json["data"],
      );
    }

    throw Exception(
        "User not found"
    );
  }
}