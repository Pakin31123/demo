import 'package:demo_app/screens/auth/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:demo_app/utils/color.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => MyHomeScreen(),
              ),
            );
          },
          icon: const Icon(
            CupertinoIcons.back,
            color: black,
          ),
        ),
        title: const Center(
          child: Text(
            'Profile',
            style: TextStyle(
              fontSize: 24,
              fontFamily: "NunitoBlack",
              fontWeight: FontWeight.w600,
              color: black,
            ),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Text(
                  'First Name : ',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: "NunitoBlack",
                    fontWeight: FontWeight.w500,
                    color: black,
                  ),
                ),
                Text(
                  'Pakin',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: "NunitoBlack",
                    fontWeight: FontWeight.w500,
                    color: black,
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),
            Row(
              children: [
                Text(
                  'Last Name : ',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: "NunitoBlack",
                    fontWeight: FontWeight.w500,
                    color: black,
                  ),
                ),
                Text(
                  'Eungsakul',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: "NunitoBlack",
                    fontWeight: FontWeight.w500,
                    color: black,
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),
            Row(
              children: [
                Text(
                  'Email : ',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: "NunitoBlack",
                    fontWeight: FontWeight.w500,
                    color: black,
                  ),
                ),
                Text(
                  'Pakin31123@gmail.com',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: "NunitoBlack",
                    fontWeight: FontWeight.w500,
                    color: black,
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),
            Row(
              children: [
                Text(
                  'Telephone : ',
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: "NunitoBlack",
                    fontWeight: FontWeight.w500,
                    color: black,
                  ),
                ),
                Text(
                  '0993382009',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: "NunitoBlack",
                    fontWeight: FontWeight.w500,
                    color: black,
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),
            Row(
              children: [
                Text(
                  'Age : ',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: "NunitoBlack",
                    fontWeight: FontWeight.w500,
                    color: black,
                  ),
                ),
                Text(
                  '24',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: "NunitoBlack",
                    fontWeight: FontWeight.w500,
                    color: black,
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),
            Row(
              children: [
                Text(
                  'Gender : ',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: "NunitoBlack",
                    fontWeight: FontWeight.w500,
                    color: black,
                  ),
                ),
                Text(
                  'Male',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: "NunitoBlack",
                    fontWeight: FontWeight.w500,
                    color: black,
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),
            Row(
              children: [
                Text(
                  'Country : ',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    fontFamily: "NunitoBlack",
                    color: black,
                  ),
                ),
                Text(
                  'Bangkok',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: "NunitoBlack",
                    fontWeight: FontWeight.w500,
                    color: black,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
  }
}
