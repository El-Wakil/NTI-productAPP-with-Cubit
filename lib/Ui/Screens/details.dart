import 'package:flutter/material.dart';
import 'package:product_app/Core/Model/product_model.dart';

class Details extends StatelessWidget {
  const Details({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
        titleTextStyle: TextStyle(
          fontSize: 28,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(product.imageUrl, height: 500),
            Text(
              product.name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                product.description,
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ),
            Text(
              '\$${product.price.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
