import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/model/product_model.dart';
import 'package:flutter_ecommerce/service/product_service.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  ProductService productService = ProductService();
  List<ProductElement>? products;
  late final ProductElement product;

  @override
  void initState() {
    super.initState();

    productService.getProducts().then((value) {
      setState(() {
        if (value != null) {
          products = value;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Codelandia Shopping Center"),
      ),
      body: ListView.builder(
        itemCount: products?.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              SizedBox(
                width: 200,
                height: 100,
                child: Image.network(products![index].images[0]),
              ),
              Text(products![index].title),
              Text("${products![index].price}\$"),
            ],
          );
        },
      ),
    );
  }
}
