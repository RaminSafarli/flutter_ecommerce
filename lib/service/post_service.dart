import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/model/post_model.dart';

import '../constant/api_url.dart';

class PostService {
  final String url = "$apiUrl/posts";

  Dio dio = Dio();

  Future<List<PostElement>?> getPosts() async {
    try {
      final response = await dio.get<String>(url);

      if (response.statusCode == 200) {
        var postResult = postFromJson(response.data!);
        return postResult.posts;
      } else {
        debugPrint("Else dusdu");
      }
    } catch (e) {
      debugPrint("Error while trying to get posts");
    }
    // return null;
  }

  Future<List<PostElement>?> searchPosts(String query) async {
    String searchUrl = "$url/search?q=$query";
    try {
      final response = await dio.get<String>(searchUrl);

      if (response.statusCode == 200) {
        var postResult = postFromJson(response.data!);
        return postResult.posts;
      } else {
        debugPrint("Else dusdu");
      }
    } catch (e) {
      debugPrint("Error while trying to get posts");
    }
    // return [
    //   PostElement(
    //     title: '',
    //     body: '',
    //     id: 0,
    //     reactions: 0,
    //     tags: [],
    //     userId: 0,
    //   )
    // ];
  }
}
