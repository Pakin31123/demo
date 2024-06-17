import 'package:flutter/material.dart';
import 'package:demo_app/screens/admin_screens/manage_page.dart';
import 'package:demo_app/utils/color.dart';
import 'package:demo_app/screens/admin_screens/user_page.dart';
import 'package:demo_app/screens/admin_screens/request_page.dart';
import 'package:demo_app/screens/admin_screens/adminhome_page.dart';
import 'package:get/get.dart';

class MyHomeWidget extends StatefulWidget {
  const MyHomeWidget({super.key});

  @override
  State<MyHomeWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyHomeWidget> {
  int _currentIndex = 0;

  final _tabs = [
    const AdminHome(),
    const RequestFormUserPage(),
    const UserDataPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabs[_currentIndex],
      floatingActionButton: FloatingActionButton(
        tooltip: 'Manage',
        onPressed: () {
          //Navigator.of(context).push(MaterialPageRoute(
            //builder: (context) => const ManagePage(),
          //),
        //);
        Get.to(const ManagePage());
      },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home), label: 'Home', backgroundColor: blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.add), label: 'Request', backgroundColor: blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: 'User', backgroundColor: blue),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
