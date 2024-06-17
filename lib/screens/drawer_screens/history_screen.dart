import 'package:demo_app/utils/color.dart';
import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'History',
            style: TextStyle(
                fontSize: 24,
                fontFamily: "NunitoBold",
                fontWeight: FontWeight.w500,
                color: black),
          ),
        ),
      ),
    );
  }
}
