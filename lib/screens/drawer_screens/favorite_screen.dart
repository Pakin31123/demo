import 'package:demo_app/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FavotirePage extends StatelessWidget {
  const FavotirePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Favorites',
            style: TextStyle(
                fontSize: 24,
                fontFamily: "NunitoBold",
                fontWeight: FontWeight.w500,
                color: black),
          ),
        ),
      ),
      body: StreamBuilder<List<Symbol>>(
        stream: readFavorite(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong! ${snapshot.error}');
          } else if (snapshot.hasData) {
            final symbol = snapshot.data!;

            return ListView(
              children: symbol.map(buildpin).toList(),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

Widget buildpin(Symbol symbol) => ListTile(
        contentPadding: const EdgeInsets.all(8),
        leading: CircleAvatar(child: Image.asset('assets/image/common/setlogo.PNG')),
        title: Text(symbol.name),
        subtitle: Text(symbol.change),
        trailing: Text('${symbol.open}'),
      );

  Stream<List<Symbol>> readFavorite() => FirebaseFirestore.instance
      .collection('Favorite')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Symbol.fromJson(doc.data())).toList());

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

