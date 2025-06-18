import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_app/Cubit/product_cubit.dart';
import 'package:product_app/Ui/Screens/home_screen.dart';
import 'package:product_app/Ui/Widget/app_navigation_bar.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubit()..loadProducts(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          bottomNavigationBar: AppNavigationBar(),
          body: HomeScreen(),
        ),
      ),
    );
  }
}
