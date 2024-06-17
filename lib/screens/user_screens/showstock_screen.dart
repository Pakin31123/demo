import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_app/screens/admin_screens/adminhome_page.dart';

class ShowstockScreen extends StatefulWidget {
  const ShowstockScreen({super.key});

  @override
  State<ShowstockScreen> createState() => _ShowstockScreenState();
}

class _ShowstockScreenState extends State<ShowstockScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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