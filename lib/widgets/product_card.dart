import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/model/product_model.dart';

class ProductCard extends StatelessWidget {
  final ProductElement product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              product.images[0],
              height: 150,
              width: MediaQuery.of(context).size.width * 0.5,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 8),
            Text(
              product.title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                for (int i = 0; i < 5; i++)
                  Icon(
                    i < product.rating.floor() ? Icons.star : Icons.star_border,
                    color: Colors.yellow,
                  ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              '\$${product.price.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
