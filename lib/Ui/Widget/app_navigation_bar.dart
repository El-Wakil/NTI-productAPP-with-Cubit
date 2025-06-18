import 'package:flutter/material.dart';
import 'package:product_app/Ui/Screens/cart.dart';
import 'package:product_app/Ui/Screens/home_screen.dart';
import 'package:product_app/Ui/Screens/Auth/Screen/user_log.dart';





void main() => runApp(const AppNavigationBar());

class AppNavigationBar extends StatelessWidget {
  const AppNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomNavigationBarExample(),
    );
  }
}

class BottomNavigationBarExample extends StatefulWidget {
  const BottomNavigationBarExample({super.key});

  @override
  State<BottomNavigationBarExample> createState() =>
      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState
    extends State<BottomNavigationBarExample> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
    const Cart(),
    const UserLogScreen(),

  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Center(child: _widgetOptions.elementAt(_selectedIndex)),
      ),
      bottomNavigationBar: Theme(
        data: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home, size: 28,), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart, size: 28,), label: 'Cart'),
            BottomNavigationBarItem(
              icon: Icon(Icons.person,size: 28,),
              label: 'Sign in/up',
            ),

          ],
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          enableFeedback: false,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
