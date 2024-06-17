import 'package:flutter/material.dart';
import 'package:demo_app/utils/color.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RequestFormUserPage extends StatelessWidget {
  const RequestFormUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Request',
            style: TextStyle(
                fontSize: 24,
                fontFamily: "NunitoBold",
                fontWeight: FontWeight.w500,
                color: black),
          ),
        ),
      ),
      body: StreamBuilder<List<Request>>(
        stream: readRequest(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong! ${snapshot.error}');
          } else if (snapshot.hasData) {
            final request = snapshot.data!;

            return ListView(
              children: request.map(buildlistview).toList(),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Stream<List<Request>> readRequest() => FirebaseFirestore.instance
      .collection('Request')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Request.fromJson(doc.data())).toList());

  Widget buildlistview(Request request) => ListTile(
        leading: CircleAvatar(child: Text(request.name)),
        title: Text('${request.value}'),
        trailing: Text(request.date.toIso8601String()),
      );
}

class Request {
  String id;
  final String name;
  final int value;
  final DateTime date;

  Request({
    this.id = '',
    required this.name,
    required this.value,
    required this.date,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'value': value,
        'date': date,
      };

  static Request fromJson(Map<String, dynamic> json) => Request(
        id: json['id'],
        name: json['name'],
        value: json['value'],
        date: (json['date'] as Timestamp).toDate(),
      );
}
