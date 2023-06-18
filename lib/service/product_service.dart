import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/constant/api_url.dart';
import 'package:flutter_ecommerce/model/product_model.dart';

class ProductService {
  final String url = "$apiUrl/products";

  Dio dio = Dio();

  Future<List<ProductElement>?> getProducts() async {
    try {
      final response = await dio.get<String>(url);

      if (response.statusCode == 200) {
        var products = productFromJson(response.data!);
        return products.products;
      } else {
        debugPrint("Else dusdu");
      }
    } catch (e) {
      throw Exception(e);
    }
    return null;
  }

  Future<ProductElement?> getSingleProduct(var id) async {
    try {
      final response = await dio.get("$url/$id");

      if (response.statusCode == 200) {
        var product = ProductElement.fromJson(response.data);
        return product;
      } else {
        return ProductElement(
            id: 0,
            title: "",
            description: "",
            price: 0,
            discountPercentage: 0.0,
            rating: 0.0,
            stock: 0,
            brand: "",
            category: "",
            thumbnail: "",
            images: []);
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<ProductElement>?> getProductsOfCategory(String category) async {
    String categoryUrl = "$apiUrl/products/category/$category";
    try {
      final response = await dio.get<String>(categoryUrl);
      if (response.statusCode == 200) {
        var products = productFromJson(response.data!);
        return products.products;
      }
    } catch (e) {
      throw Exception();
    }
  }

  Future<List<ProductElement>> searchProducts(String query) async {
    String searchUrl = "$url/search?q=$query";
    try {
      final response = await dio.get<String>(searchUrl);

      if (response.statusCode == 200) {
        var products = productFromJson(response.data!);
        return products.products;
      } else {
        debugPrint("Else dusdu");
      }
    } catch (e) {
      throw Exception(e);
    }
    return [
      ProductElement(
          brand: '',
          category: '',
          description: '',
          discountPercentage: 0,
          id: 0,
          images: [],
          price: 0,
          rating: 0,
          stock: 0,
          thumbnail: '',
          title: '')
    ];
  }

  // Future addProduct(
  //     var id,
  //     var title,
  //     var description,
  //     var price,
  //     var discountPercentage,
  //     var rating,
  //     var stock,
  //     var brand,
  //     var category,
  //     var thumbnail,
  //     var images) async {
  //   try {
  //     Product product = Product(
  //         id: id,
  //         title: title,
  //         description: description,
  //         price: price,
  //         discountPercentage: discountPercentage,
  //         rating: rating,
  //         stock: stock,
  //         brand: brand,
  //         category: category,
  //         thumbnail: thumbnail,
  //         images: images);
  //     final request = await dio.post("$url/add", data: product.toJson());
  //     if (request.statusCode == 201) {
  //       debugPrint("Post added!");
  //     }
  //   } catch (e) {
  //     debugPrint("Something went wrong while sending post!");
  //     throw Exception(e);
  //   }
  // }
}
