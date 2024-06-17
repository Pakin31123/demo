import 'package:demo_app/screens/auth/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:demo_app/utils/color.dart';
import 'package:demo_app/utils/data.dart';
import 'package:demo_app/utils/utils_text.dart';
import 'package:get/get.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pageBackGroundC,
      appBar: AppBar(
        elevation: 5,
        leading: IconButton(
          onPressed: (){
            //Navigator.of(context).push(MaterialPageRoute(
              //builder: (context) => MyHomeScreen()));
            Get.to(const MyHomeScreen());
          }, 
          icon: const Icon(
            CupertinoIcons.back,
            color: black,
          ),
        ),
        title: const Center(
          child: Text(
            "Notification",
            style: TextStyle(
              fontSize: 24,
              color: black222222,
              fontFamily: "NunitoBold",
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 25),
        child: ListView.builder(
          itemCount: notificationList.length,
          shrinkWrap: true,
          itemBuilder: (context, index) => notificationText(
            svgUrl: notificationList[index]["img"],
            notificationText: notificationList[index]["title"],
            textTime: notificationList[index]["time"],
          ),
        ),
      ),
    );
  }
}