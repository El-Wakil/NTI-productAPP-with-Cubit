import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_app/Cubit/product_cubit.dart';
import 'package:product_app/Cubit/product_state.dart';
import 'package:product_app/Ui/Widget/custom_widget.dart';

class ProductGridView extends StatelessWidget {
  const ProductGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state is ProductLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ProductLoaded) {
          final productList = state.products;
          if (productList.isEmpty) {
            return const Center(
              child: Text(
                'No products available',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            );
          }
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 7 / 10,
            ),
            itemCount: productList.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomWidgetProduct(product: state.products[index]),),
          );
        } else if (state is ProductError) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error, size: 64, color: Colors.red),
                const SizedBox(height: 16),
                Text(
                  'Error: ${state.message}',
                  style: const TextStyle(fontSize: 16, color: Colors.red),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    context.read<ProductCubit>().loadProducts();
                  },
                  child: const Text('Retry'),
                ),
              ],
            ),
          );
        } else {
          // Handle ProductInitial and any other states
          return const Center(
            child: Text(
              'Tap to load products',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
          );
        }
      },
    );
  }
}
