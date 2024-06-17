import 'package:demo_app/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:demo_app/screens/user_screens/buypage.dart';
import 'package:demo_app/screens/user_screens/sellpage.dart';

class WhitelistScreen extends StatefulWidget {
  const WhitelistScreen({super.key});

  @override
  State<WhitelistScreen> createState() => _WhitelistScreen();
}

class _WhitelistScreen extends State<WhitelistScreen> {
  int _currentIndex = 0;

  final _tabs = [
    const BuyPage(),
    const SellPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.shifting,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart), label: 'BUY', backgroundColor: blue),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined), label: 'SELL', backgroundColor: blue),
        ],
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
