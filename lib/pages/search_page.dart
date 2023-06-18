import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/model/product_model.dart';
import 'package:flutter_ecommerce/service/product_service.dart';
import 'package:flutter_ecommerce/widgets/product_card.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  ProductService productService = ProductService();
  List<ProductElement> searchResults = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Product Search',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  productService
                      .searchProducts(value)
                      .then((value) => searchResults = value);
                });
              },
              decoration: const InputDecoration(
                hintText: 'Search products...',
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: searchResults.length,
              itemBuilder: (context, index) {
                final product = searchResults[index];
                return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/product_detail_page',
                          arguments: {
                            'title': product.title,
                            'product': product,
                          });
                    },
                    child: ProductCard(product: product));
              },
            ),
          ),
        ],
      ),
    );
  }
}
