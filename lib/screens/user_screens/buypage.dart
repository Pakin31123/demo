import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_app/screens/user_screens/buy_sell_screen.dart';

class BuyPage extends StatefulWidget {
  const BuyPage({super.key});

  @override
  State<BuyPage> createState() => _BuyPageState();
}

class _BuyPageState extends State<BuyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<List<Buy>>(
        stream: readBuy(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong! ${snapshot.error}');
          } else if (snapshot.hasData) {
            final buy = snapshot.data!;

            return ListView(
              children: buy.map(buildBuylist).toList(),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
  
  Widget buildBuylist(Buy buy) => ListTile(
        contentPadding: const EdgeInsets.all(8),
        leading: CircleAvatar(child: Text('${buy.price}')),
        title: Text(buy.name),
        trailing: Text('${buy.val}'),
      );

  Stream<List<Buy>> readBuy() => FirebaseFirestore.instance
      .collection('Buy')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Buy.fromJson(doc.data())).toList());

}