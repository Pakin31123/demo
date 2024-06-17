import 'package:demo_app/screens/auth/login_screen.dart';
import 'package:demo_app/screens/auth/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:demo_app/utils/color.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if(kIsWeb) {
  await Firebase.initializeApp(options: const FirebaseOptions(
  apiKey:"AIzaSyClLWdpMmzkEBL0Gs0l1qKW6IPD8UTTKQU",
  authDomain: "database-50d38.firebaseapp.com",
  projectId: "database-50d38",
  storageBucket: "database-50d38.appspot.com",
  messagingSenderId: "548139073045",
  appId: "1:548139073045:web:d88da9090998605e12581c")
  );
  }else{
    Firebase.initializeApp();
  }
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: const WelcomeScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: white,
        ),
      ),
    );
  }
}

