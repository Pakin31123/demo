import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:demo_app/utils/color.dart';

notificationText({required String svgUrl, required String notificationText,required String textTime}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 15),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleAvatar(
          backgroundColor: appColor,
          maxRadius: 24,
          child: SvgPicture.asset(svgUrl),
        ),
        SizedBox(
          width: 214,
          child: Text(
            notificationText,
            maxLines: 2,
            style: const TextStyle(
              fontSize: 14,
              color: black,
              fontFamily: "NunitoBlack",
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Text(
          textTime,
          style: const TextStyle(
            fontSize: 14,
            color: grayABABAB,
            fontFamily: "NunitoBlack",
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    ),
  );
}
