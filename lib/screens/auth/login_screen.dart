import 'package:demo_app/screens/auth/sigup_screen.dart';
import 'package:demo_app/screens/user_screens/forget_screen.dart';
import 'package:flutter/material.dart';
import 'package:demo_app/utils/color.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:demo_app/utils/button_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:demo_app/screens/auth/home_screen.dart';
import 'package:demo_app/screens/admin_screens/navigator.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  bool _isObscure3 = true;
  bool visible = false;
  final _formkey = GlobalKey<FormState>();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              color: appColor,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.70,
              child: Center(
                child: Container(
                  margin: const EdgeInsets.all(12),
                  child: Form(
                    key: _formkey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 38,
                            color: white,
                            fontFamily: "NunitoBold",
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          controller: _controllerEmail,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: gray,
                            hintText: 'Email',
                            enabled: true,
                            contentPadding: const EdgeInsets.only(
                                left: 14.0, bottom: 8.0, top: 8.0),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Email cannot be empty";
                            }
                            if (!RegExp(
                                    "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                .hasMatch(value)) {
                              return ("Please enter a valid email");
                            } else {
                              return null;
                            }
                          },
                          onSaved: (value) {
                            _controllerEmail.text = value!;
                          },
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: _controllerPassword,
                          obscureText: _isObscure3,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                                icon: Icon(_isObscure3
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                onPressed: () {
                                  setState(() {
                                    _isObscure3 = !_isObscure3;
                                  });
                                }),
                            filled: true,
                            fillColor: gray,
                            hintText: 'Password',
                            enabled: true,
                            contentPadding: const EdgeInsets.only(
                                left: 14.0, bottom: 8.0, top: 15.0),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          validator: (value) {
                            RegExp regex = RegExp(r'^.{6,}$');
                            if (value!.isEmpty) {
                              return "Password cannot be empty";
                            }
                            if (!regex.hasMatch(value)) {
                              return ("please enter valid password min. 6 character");
                            } else {
                              return null;
                            }
                          },
                          onSaved: (value) {
                            _controllerPassword.text = value!;
                          },
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        MaterialButton(
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0))),
                          elevation: 5.0,
                          height: 40,
                          onPressed: () {
                            setState(() {
                              visible = true;
                            });
                            signIn(_controllerEmail.text,
                                _controllerPassword.text);
                          },
                          color: Colors.white,
                          child: const Text(
                            "Login",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Don't have an account?",
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: "Nunito",
                            color: black,
                          ),
                        ),
                        MaterialButton(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20.0),
                            ),
                          ),
                          elevation: 5.0,
                          height: 40,
                          onPressed: () {
                            //Navigator.pushReplacement(
                            //context,
                            //MaterialPageRoute(
                            //builder: (context) => const SignUpScreen(),
                            //),
                            //);
                            Get.to(SignUpScreen());
                          },
                          color: blue,
                          child: const Text(
                            "SignUp",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontFamily: "Nunito"),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Remember me",
                                  style: TextStyle(
                                    color: black.withOpacity(0.6),
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "NunitoRegular",
                                  ),
                                ),
                              ],
                            ),
                            InkWell(
                              onTap: () {
                                Get.to(
                                  ForgotPassword(),
                                );
                              },
                              child: Text(
                                "Forgot Password?",
                                style: TextStyle(
                                  color: black.withOpacity(0.6),
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "NunitoRegular",
                                ),
                              ),
                            ),
                          ],
                        ),
                        Visibility(
                          maintainSize: true,
                          maintainAnimation: true,
                          maintainState: true,
                          visible: visible,
                          child: const CircularProgressIndicator(
                            color: Colors.white,
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
      ),
    );
  }

  void route() {
    User? user = FirebaseAuth.instance.currentUser;
    var kk = FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        if (documentSnapshot.get('role') == "Admin") {
          //Navigator.pushReplacement(
            //context,
            //MaterialPageRoute(
              //builder: (context) => const MyHomeWidget(),
            //),
          //);
          Get.to(MyHomeWidget());
        } else {
          //Navigator.pushReplacement(
            //context,
            //MaterialPageRoute(
              //builder: (context) => const MyHomeScreen(),
            //),
          //);
          Get.to(MyHomeScreen());
        }
      } else {
        debugPrint('Document does not exist on the database');
      }
    });
  }

  void signIn(String email, String password) async {
    if (_formkey.currentState!.validate()) {
      try {
        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        route();
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          debugPrint('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          debugPrint('Wrong password provided for that user.');
        }
      }
    }
  }
}
