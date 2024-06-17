import 'package:flutter/material.dart';

final messagerKey = GlobalKey<ScaffoldMessengerState>();
class Utils {
  static showSnackBar(String? text){
    if (text == null) return;

    final snackBar = SnackBar(content: Text(text),
    backgroundColor: Colors.blue);
 
    messagerKey.currentState!
    ..removeCurrentSnackBar()
    ..showSnackBar(snackBar);
  }
}