import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_app/Cubit/product_cubit.dart';
import 'package:product_app/Ui/Widget/app_bar.dart';
import 'package:product_app/Ui/Widget/grid_view_builder.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // Load products when the screen initializes
    context.read<ProductCubit>().loadProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar,
      backgroundColor: Colors.white,
      body: const ProductGridView(),
    );
  }
}
