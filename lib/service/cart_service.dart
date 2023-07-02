import 'package:dio/dio.dart';
import 'package:flutter_ecommerce/model/cart_model.dart';

import '../constant/api_url.dart';

class CartService {
  final String url = "$apiUrl/carts";

  Dio dio = Dio();

  Future<List<CartElement>?> getUserCart(var userId) async {
    try {
      final response = await dio.get("$url/user/$userId");

      if (response.statusCode == 200) {
        var cart = Cart.fromJson(response.data);
        return cart.carts;
      } else {
        return null;
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
