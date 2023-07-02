import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/constant/api_url.dart';
import 'package:flutter_ecommerce/model/login_model.dart';

class LoginService {
  String url = "$apiUrl/auth/login";

  Dio dio = Dio();

  Future<Login?> loginRequest(var username, var password) async {
    try {
      var response = await dio.post(
        url,
        data: jsonEncode({"username": username, "password": password}),
      );

      if (response.statusCode == 200) {
        debugPrint("success");
        Login login = Login(
            id: response.data["id"],
            username: response.data["username"],
            email: response.data["email"],
            firstName: response.data["firstName"],
            lastName: response.data["lastName"],
            gender: response.data["gender"],
            image: response.data["image"],
            token: response.data["token"]);
        return login;
      } else {
        debugPrint("unsuccess");
      }
    } catch (e) {
      debugPrint('Error while login with API');
    }
  }
}
