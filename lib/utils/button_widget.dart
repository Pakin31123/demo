import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'color.dart';

loginButton({required String textLabel, onTapButton}) {
  return Container(
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
            color: Colors.blue.withOpacity(0.3),
            blurRadius: 12,
            spreadRadius: 2)
      ],
      borderRadius: const BorderRadius.all(
        Radius.circular(25),
      ),
    ),
    child: MaterialButton(
      height: 49,
      minWidth: Get.width / 2.057,
      onPressed: onTapButton,
      color: appColor,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusDirectional.circular(
          25,
        ),
      ),
      child: Text(
        textLabel,
        style: const TextStyle(
          color: white,
          fontSize: 19,
          fontFamily: "NunitoBold",
        ),
      ),
    ),
  );
}

loginButton1({required String textLabel, onPressed}) {
  return Container(
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.blue.withOpacity(0.3),
          blurRadius: 12,
          spreadRadius: 2
        ),
      ],
      borderRadius: const BorderRadius.all(
        Radius.circular(25),
      ),
    ),
    child: MaterialButton(
      height: 49,
      minWidth: Get.width / 5.28,
      onPressed: onPressed,
      color: Colors.blueAccent,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusDirectional.circular(
          25),
      ),
      child: Text(
      textLabel,
      style: const TextStyle(
        color: white,
        fontSize: 19,
        fontFamily: "NunitoBold",
        ),
      ),
    ),
  );
}

signupButton({required String textLabel, onPressed}) {
  return Container(
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.blue.withOpacity(0.3),
          blurRadius: 12,
          spreadRadius: 2
        ),
      ],
      borderRadius: const BorderRadius.all(
        Radius.circular(25),
      ),
    ),
    child: MaterialButton(
      height: 49,
      minWidth: Get.width / 5.28,
      onPressed: onPressed,
      color: Colors.blueAccent,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusDirectional.circular(
          25),
      ),
      child: Text(
      textLabel,
      style: const TextStyle(
        color: white,
        fontSize: 19,
        fontFamily: "NunitoBold",
        ),
      ),
    ),
  );
}

Container buildTextFieldEmail(){
  return Container(
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: Colors.yellow[50], borderRadius: BorderRadius.circular(16),
    ),
    child: const TextField(
      decoration: InputDecoration(
        prefixIcon: Icon(IconData(0xF2EB, fontFamily: "CupertinoIcons")),
        hintText: "Email"),
      style: TextStyle(fontSize: 18),
    ),
  );
}

Container buildTextFieldPassword(){
  return Container(
    padding: const EdgeInsets.all(12),
    margin: const EdgeInsets.only(top: 12),
    decoration: BoxDecoration(
      color: Colors.yellow[50], borderRadius: BorderRadius.circular(16),
    ),
    child: const TextField(
      obscureText: true,
      decoration: InputDecoration(
        prefixIcon: Icon(IconData(0xF2EB, fontFamily: "CupertinoIcons")),
        hintText: "Password"),
      style: TextStyle(fontSize: 18),
    ),
  );
}

textFromFieldDesign1({required String hint, iconWidget, iconWidget1}) {
  return TextFormField(
    cursorColor: appColor,
    decoration: InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(
        color: gray2,
        fontSize: 19,
        fontFamily: "NunitoBlack",
        fontWeight: FontWeight.w400,
      ),
      prefixIcon: iconWidget,
      suffixIcon: iconWidget1,
      /*Icon(
        Icons.email_outlined,
        color: gray,
      ),*/
      border: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: Color(0xffE7E8EB),
        ),
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: Color(0xffE7E8EB),
        ),
      ),
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: Color(0xffE7E8EB),
        ),
      ),
    ),
  );
}

resetButton({required String textLabel, onPressed}) {
  return Container(
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.blue.withOpacity(0.3),
          spreadRadius: 4,
          blurRadius: 10,
          offset: const Offset(0, 1),
        ),
      ],
      borderRadius: const BorderRadius.all(
        Radius.circular(25),
      ),
    ),
    child: MaterialButton(
      height: Get.height / 18.19,
      minWidth: Get.width / 2.046,
      onPressed: onPressed,
      color: appColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusDirectional.circular(
          25,
        ),
      ),
      child: Text(
        textLabel,
        style: const TextStyle(
          color: white,
          fontSize: 19,
          fontFamily: "NunitoSemiBold",
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
  );
}