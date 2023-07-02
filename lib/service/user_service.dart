import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/constant/api_url.dart';
import 'package:flutter_ecommerce/model/user_model.dart';

class UserService {
  final String url = "$apiUrl/users";

  Dio dio = Dio();

  Future<UserElement?> getSingleUser(var id) async {
    String getUserUrl = "$url/$id";

    try {
      final response = await dio.get("$url/$id");

      if (response.statusCode == 200) {
        var user = UserElement.fromJson(response.data);
        return user;
      } else {
        return UserElement();
      }
    } catch (e) {
      debugPrint("Error while trying to get single");
    }
  }
}
