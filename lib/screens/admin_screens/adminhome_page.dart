import 'package:flutter/material.dart';
import 'package:demo_app/utils/color.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class AdminHome extends StatefulWidget {
  const AdminHome({super.key});

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Admin Page',
            style: TextStyle(
                fontSize: 24,
                fontFamily: "NunitoBold",
                fontWeight: FontWeight.w500,
                color: black),
          ),
        ),
      ),
      body: StreamBuilder<List<Symbol>>(
        stream: readStock(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong! ${snapshot.error}');
          } else if (snapshot.hasData) {
            final symbol = snapshot.data!;

            return ListView(
              children: symbol.map(buildstock).toList(),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Widget buildstock(Symbol symbol) => ListTile(
        contentPadding: const EdgeInsets.all(8),
        leading: CircleAvatar(child: Image.asset('assets/image/common/setlogo.PNG')),
        title: Text(symbol.name),
        subtitle: Text(symbol.change),
        trailing: Text('${symbol.open}'),
      );

  Stream<List<Symbol>> readStock() => FirebaseFirestore.instance
      .collection('Stock')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Symbol.fromJson(doc.data())).toList());
}

class Symbol {
  String id;
  final String name;
  final int open;
  final String change;

  Symbol({
    this.id = '',
    required this.name,
    required this.open,
    required this.change,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'open': open,
        'change': change,
      };

  static Symbol fromJson(Map<String, dynamic> json) => Symbol(
        id: json['id'],
        name: json['name'],
        open: json['open'],
        change: json['change'],
      );
}
