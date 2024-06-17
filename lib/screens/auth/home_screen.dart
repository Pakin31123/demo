import 'package:demo_app/screens/user_screens/portfolio_screen.dart';
import 'package:demo_app/screens/drawer_screens/request_screen.dart';
import 'package:demo_app/screens/user_screens/showstock_screen.dart';
import 'package:flutter/material.dart';
import 'package:demo_app/screens/auth/auth.dart';
import 'package:demo_app/screens/user_screens/display.dart';
import 'package:demo_app/utils/color.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:demo_app/screens/drawer_screens/notification_screen.dart';
import 'package:demo_app/screens/drawer_screens/favorite_screen.dart';
import 'package:demo_app/screens/drawer_screens/history_screen.dart';
import 'package:demo_app/screens/drawer_screens/trend_screen.dart';
import 'package:demo_app/screens/user_screens/buy_sell_screen.dart';
import 'package:demo_app/screens/user_screens/qrcode_screen.dart';
import 'package:demo_app/screens/user_screens/whitelist_screen.dart';
import 'package:get/get.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key});

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  int _currentIndex = 0;

  final _tabs = [
    ShowstockScreen(),
    WhitelistScreen(),
    QrCodeScreen(),
    PortfolioScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search),
            labelText: ('Search'),
          ),
        ),
      ),
      drawer: NavigationDrawer(),
      body: _tabs[_currentIndex],
      floatingActionButton: FloatingActionButton(
        tooltip: 'Buy/Sell',
        onPressed: () {
          //Navigator.of(context).push(
          //MaterialPageRoute(
          //builder: (context) => const BuyandSellScreen(),
          //),
          //);
          Get.to(const BuyandSellScreen());
        },
        child: const Icon(Icons.add_shopping_cart),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home), label: 'Home', backgroundColor: blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.bookmark_add_outlined),
              label: 'Whitelist',
              backgroundColor: blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.support_agent),
              label: 'Chatbot',
              backgroundColor: blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
              backgroundColor: blue),
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

class NavigationDrawer extends StatelessWidget {
  NavigationDrawer({super.key});

  final User? user = Auth().currentUser;

  Future<void> signOut() async {
    await Auth().signOut();
  }

  Widget _userUid() {
    return Text(user?.email ?? 'User email');
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: SingleChildScrollView(
            child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        buildHeader(context),
        buildMenuItem(context),
      ],
    )));
  }

  Widget buildHeader(BuildContext context) => Material(
        color: appColor,
        child: InkWell(
          onTap: () {
            Navigator.pop(context);

            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => MyProfile()));
          },
          child: Container(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top,
            ),
            child: Column(
              children: <Widget>[
                CircleAvatar(
                  radius: 52,
                  backgroundImage: NetworkImage(
                      'https://th.bing.com/th/id/R.c3631c652abe1185b1874da24af0b7c7?rik=XBP%2fc%2fsPy7r3HQ&riu=http%3a%2f%2fpluspng.com%2fimg-png%2fpng-user-icon-circled-user-icon-2240.png&ehk=z4ciEVsNoCZtWiFvQQ0k4C3KTQ6wt%2biSysxPKZHGrCc%3d&risl=&pid=ImgRaw&r=0'),
                ),
                SizedBox(height: 12),
                _userUid()
              ],
            ),
          ),
        ),
      );

  Widget buildMenuItem(BuildContext context) => Container(
        padding: const EdgeInsets.all(24),
        child: Wrap(
          runSpacing: 16,
          children: [
            ListTile(
                leading: const Icon(Icons.home_outlined),
                title: const Text(
                  'Home',
                  style: TextStyle(fontFamily: "NunitoBold"),
                ),
                onTap: () {
                  //Navigator.of(context).pushReplacement(
                  //MaterialPageRoute(builder: (context) => MyHomeScreen()));
                  Get.to(const MyHomeScreen());
                }),
            ListTile(
                leading: const Icon(Icons.favorite_border),
                title: const Text(
                  'Favorites',
                  style: TextStyle(fontFamily: "NunitoBold"),
                ),
                onTap: () {
                  //Navigator.of(context).push(
                  //MaterialPageRoute(builder: (context) => FavotirePage()));
                  Get.to(const FavotirePage());
                }),
            ListTile(
                leading: const Icon(Icons.insert_chart_outlined),
                title: const Text(
                  'Graph',
                  style: TextStyle(fontFamily: "NunitoBold"),
                ),
                onTap: () {
                  //Navigator.of(context).push(
                  //MaterialPageRoute(builder: (context) => MyChart()));
                  Get.to(const MyChart());
                }),
            ListTile(
                leading: const Icon(Icons.history_outlined),
                title: const Text(
                  'History',
                  style: TextStyle(fontFamily: "NunitoBold"),
                ),
                onTap: () {
                  //Navigator.of(context).push(
                  //MaterialPageRoute(builder: (context) => HistoryPage()));
                  Get.to(const HistoryPage());
                }),
            const Divider(color: black),
            ListTile(
                leading: const Icon(Icons.notifications),
                title: const Text(
                  'Notifications',
                  style: TextStyle(fontFamily: "NunitoBold"),
                ),
                onTap: () {
                  //Navigator.of(context).push(MaterialPageRoute(
                  //builder: (context) => NotificationScreen()));
                  Get.to(const NotificationScreen());
                }),
            ListTile(
                leading: const Icon(Icons.add),
                title: const Text(
                  'Request',
                  style: TextStyle(fontFamily: "NunitoBold"),
                ),
                onTap: () {
                  //Navigator.of(context).push(
                  //MaterialPageRoute(builder: (context) => RequestPage()));
                  Get.to(const RequestPage());
                }),
            ListTile(
                leading: const Icon(Icons.login),
                title: const Text(
                  'SignOut',
                  style: TextStyle(fontFamily: "NunitoBold"),
                ),
                onTap: () {
                  signOut();
                }),
          ],
        ),
      );
}
