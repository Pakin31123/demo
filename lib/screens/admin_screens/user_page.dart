import 'package:flutter/material.dart';
import 'package:demo_app/utils/color.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_svg/svg.dart';

class UserDataPage extends StatelessWidget {
  const UserDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'User Information',
            style: TextStyle(
                fontSize: 24,
                fontFamily: "NunitoBold",
                fontWeight: FontWeight.w500,
                color: black),
          ),
        ),
      ),
      body: StreamBuilder<List<UserData>>(
        stream: readUserData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong! ${snapshot.error}');
          } else if (snapshot.hasData) {
            final userdata = snapshot.data!;

            return ListView(
              children: userdata.map(buildcard).toList(),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Stream<List<UserData>> readUserData() => FirebaseFirestore.instance
      .collection('Profile')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => UserData.fromJson(doc.data())).toList());

  Widget buildcard(UserData userdata) => ListTile(
      leading: CircleAvatar(
        child: SvgPicture.asset('assets/image/common/user.svg'),
      ),
      title: Text(userdata.name),
      subtitle: Text(userdata.lastname),
      trailing: Column(
        children: [
          Text(userdata.email), 
          Text(userdata.phone),
        ],
      ),
    );
}

class UserData {
  String id;
  final String name;
  final String lastname;
  final String phone;
  final String email;

  UserData({
    this.id = '',
    required this.name,
    required this.lastname,
    required this.phone,
    required this.email,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'lastname': lastname,
        'phone': phone,
        'email': email,
      };

  static UserData fromJson(Map<String, dynamic> json) => UserData(
        id: json['id'],
        name: json['name'],
        lastname: json['lastname'],
        phone: json['phone'],
        email: json['email'],
      );
}
