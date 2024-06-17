import 'package:demo_app/screens/auth/welcome_screen.dart';
import 'package:demo_app/utils/button_widget.dart';
import 'package:demo_app/utils/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:email_validator/email_validator.dart';
import 'package:demo_app/utils/utils.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final formKey = GlobalKey<FormState>(); 
  final emailController = TextEditingController();

  @override 
  void dispose(){
    emailController.dispose();

    super.dispose();
  }

  Future sendPasswordResetEmail() async{
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => Center(
      child: CircularProgressIndicator()),
    );

  try {
    await FirebaseAuth.instance
    .sendPasswordResetEmail(email: emailController.text.trim());

  Utils.showSnackBar('Password Reset Email Sent');
  // ignore: use_build_context_synchronously
  Navigator.of(context).popUntil((route) => route.isFirst);
  }on FirebaseAuthException catch (e){
    print(e);

    Utils.showSnackBar(e.message);
    Navigator.of(context).pop();
  } 
}

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: pageBackGroundC,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Forget Password",
          style: TextStyle(
            fontFamily: "NunitoBold",
            color: black,
            fontSize: 25,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            CupertinoIcons.back,
            color: black1,
          ),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => WelcomeScreen()));
          },
        ),
      ),
      body: Stack(
        children: [
          Container(
            color: pageBackGroundC,
            child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: Get.height / 44.57),
                    child: SvgPicture.asset('assets/image/common/forgetPinBenner.svg',
                      height: Get.height / 3.87,
                    ),
                  ),
                  SizedBox(
                    height: Get.height / 44.57,
                  ),
                  const Text(
                    "Enter your registrated email address to receive",
                    style: TextStyle(
                      fontSize: 12,
                      color: black,
                      fontFamily: "NunitoRegular",
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Text(
                    "password reset instruction",
                    style: TextStyle(
                      fontSize: 16,
                      color: black,
                      fontFamily: "NunitoRegular",
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: Get.height / 2.5),
            child: Container(
              height: Get.height / 1.7,
              width: Get.width,
              decoration: const BoxDecoration(
                color: white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: Get.width / 15.23,
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: Get.height / 18.96,
                      ),
                      TextFormField(
                        controller: emailController,
                        cursorColor: white,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          labelText: 'Email'),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (email) => 
                              email != null && !EmailValidator.validate(email)
                              ? 'Enter a valid email': null,
                      ),
                      SizedBox(
                        height: Get.height / 15.94,
                      ),
                      resetButton(
                        onPressed: sendPasswordResetEmail,
                        textLabel: "Reset Password",
                        ),
                        SizedBox(
                          height: Get.height / 74.28,
                        ),
                        Text(
                          "Terms of use & Privacy policy",
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: "NinutoSemiBold",
                            color: black.withOpacity(0.6),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}