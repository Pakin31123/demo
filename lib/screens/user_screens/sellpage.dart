import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_app/screens/user_screens/buy_sell_screen.dart';

class SellPage extends StatelessWidget {
  const SellPage ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<List<Sell>>(
        stream: readSell(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong! ${snapshot.error}');
          } else if (snapshot.hasData) {
            final sell = snapshot.data!;

            return ListView(
              children: sell.map(buildSelllist).toList(),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
  
  Widget buildSelllist(Sell sell) => ListTile(
        contentPadding: const EdgeInsets.all(8),
        leading: CircleAvatar(child: Text('${sell.price}')),
        title: Text(sell.name),
        trailing: Text('${sell.val}'),
      );

  Stream<List<Sell>> readSell() => FirebaseFirestore.instance
      .collection('Sell')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Sell.fromJson(doc.data())).toList());

}