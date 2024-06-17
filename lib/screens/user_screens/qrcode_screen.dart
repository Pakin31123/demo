import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:demo_app/utils/color.dart';

class QrCodeScreen extends StatelessWidget {
  const QrCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(
                image: AssetImage("assets/image/common/QrcodeBenner.png"),
                width: 300,
                height: 300,
                fit: BoxFit.fitWidth,
              ),
              Padding(
                padding: EdgeInsets.only(top: Get.height / 46.36),
                child: const Align(
                  alignment: Alignment.center,
                  child: Text(
                    "LineID: @295ekyeb",
                    style: TextStyle(
                      fontSize: 24,
                      color: black2,
                      fontFamily: "NunitoSemiBold",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: Get.height / 46.36),
                child: const Text(
                  "ขอบเขตในการสอบถาม",
                  style: TextStyle(
                    fontSize: 16,
                    color: black,
                    fontFamily: "NunitoRegular",
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: Get.height / 46.36),
                child: const Text(
                  "1.คำศัพท์ที่เกี่ยวกับหุ้น",
                  style: TextStyle(
                    fontSize: 16,
                    color: black,
                    fontFamily: "NunitoRegular",
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: Get.height / 46.36),
                child: const Text(
                  "2.คำแนะนำ ขั้นตอนการลงทุน",
                  style: TextStyle(
                    fontSize: 16,
                    color: black,
                    fontFamily: "NunitoRegular",
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: Get.height / 36.36),
                child: const Text(
                  "3.สอนการดูกราฟหุ้นและทฤษฎีที่ควรรู้",
                  style: TextStyle(
                    fontSize: 16,
                    color: black,
                    fontFamily: "NunitoRegular",
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
