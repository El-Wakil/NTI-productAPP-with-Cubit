
import 'package:flutter/material.dart';
import 'package:product_app/Core/Model/product_model.dart';
import 'package:product_app/Ui/Screens/details.dart';

class CustomWidgetProduct extends StatelessWidget {
  const CustomWidgetProduct({super.key, required this.product});
final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return InkWell(
            onTap: () {
              // Handle tap event
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Details(product: product,)),
              );
            },
            child: Card(
              elevation: 5,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Image.network(
                        product.imageUrl,
                        height: 200,

                        fit: BoxFit.cover,
                      ),
                    ),
                    
                      const SizedBox(height: 10),
                      Text(
                        product.name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                    const SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text(
                          product.description, maxLines: 1,
                          style: const TextStyle(fontSize: 14, color: Colors.green),
                        ),
                      ),

                      const SizedBox(height: 5),
                      Text(
                        '\$${product.price}',
                        style: const TextStyle(fontSize: 14, color: Colors.green),
                      ),
                  ],
                ),
              ),
            ),
          );
  }
}