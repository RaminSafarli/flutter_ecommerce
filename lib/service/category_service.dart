import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/constant/api_url.dart';
import 'package:flutter_ecommerce/model/category_model.dart';

class CategoryService {
  final String url = "$apiUrl/products/categories";

  Dio dio = Dio();

  Future<List<String>?> getCategories() async {
    try {
      final response = await dio.get<String>(url);

      if (response.statusCode == 200) {
        var categories = categoryFromJson(response.data!);
        return categories;
      } else {
        debugPrint("Else dusdu");
      }
    } catch (e) {
      throw Exception(e);
    }
    return null;
  }
}
