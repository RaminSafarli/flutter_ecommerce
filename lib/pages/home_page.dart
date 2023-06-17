import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/constant/color.dart';
import 'package:flutter_ecommerce/model/product_model.dart';
import 'package:flutter_ecommerce/service/product_service.dart';
import 'package:flutter_ecommerce/widgets/product_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ProductService productService = ProductService();
  List<ProductElement>? products = [];
  List<String>? categories = [];
  @override
  void initState() {
    productService.getProducts().then((value) {
      for (var element in value!) {}
      return products = value;
    });
    for (var product in products!) {
      debugPrint("${product.category} ++");
      categories!.add(product.category);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(primaryColor),
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black.withOpacity(0),
                  Colors.black,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.1,
                  left: 10,
                  right: 10,
                  bottom: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Codelandia Shop Center",
                      style:
                          Theme.of(context).textTheme.headlineSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                color: Colors.white,
                              ),
                    ),
                    const Row(
                      children: [
                        IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: null,
                          icon: Icon(
                            Icons.account_circle,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // Expanded(
              //   child: ListView.builder(
              //     itemCount: products!.length,
              //     itemBuilder: (context, index) {
              //       final product = products![index];
              //       return ProductCard(product: product);
              //     },
              //   ),
              // )
              Expanded(
                child: ListView.builder(
                  itemCount: categories!.length,
                  itemBuilder: (context, index) {
                    return Text(categories![index]);
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
