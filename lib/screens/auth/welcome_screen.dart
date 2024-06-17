import 'package:demo_app/screens/auth/sigup_screen.dart';
import 'package:demo_app/screens/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:demo_app/utils/button_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:demo_app/utils/color.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pageBackGroundC,
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(top: Get.height / 13.87),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/image/common/appLogo.svg'),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Welcome to",
                style: TextStyle(
                  color: black,
                  fontWeight: FontWeight.w600,
                  fontSize: 28,
                  fontFamily: "NunitoSemiBold",
                ),
              ),
              const Text(
                "Stock Simulator App",
                style: TextStyle(
                  color: black,
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                  fontFamily: "NunitoBold",
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: Get.height / 4.81),
                child: loginButton1(
                    textLabel: "Login",
                    onPressed: () {
                      //Navigator.of(context).push(MaterialPageRoute(
                      //builder: (context) => LoginScreen()
                      //),
                      //);
                      Get.to(LoginScreen());
                    },
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: Get.height / 20.81),
                child: const InkWell(
                  child: Text(
                    '------------------OR------------------',
                    style: TextStyle(
                      fontSize: 18,
                      color: black,
                      fontFamily: "NunitoRugular",
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: Get.height / 16.91),
                    child: signupButton(
                        textLabel: "SignUp",
                        onPressed: () {
                          //Navigator.of(context).push(MaterialPageRoute(
                          //builder: (context) => SignUpScreen(),
                          //),
                          //);
                          Get.to(SignUpScreen());
                        },
                      ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
