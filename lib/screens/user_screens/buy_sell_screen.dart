import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BuyandSellScreen extends StatefulWidget {
  const BuyandSellScreen({super.key});

  @override
  State<BuyandSellScreen> createState() => _BuyandSellScreenState();
}

class _BuyandSellScreenState extends State<BuyandSellScreen> {
  final controllerName = TextEditingController();
  final controllerPrice = TextEditingController();
  final controllerValue = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Buy/Sell',
            style: TextStyle(
              fontSize: 24,
              fontFamily: "NunitoBold",
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: <Widget>[
          TextField(
            controller: controllerName,
            decoration: const InputDecoration(hintText: 'Name'),
            keyboardType: TextInputType.name,
          ),
          const SizedBox(height: 24),
          TextField(
            controller: controllerPrice,
            decoration: const InputDecoration(hintText: 'Price'),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 24),
          TextField(
            controller: controllerValue,
            decoration: const InputDecoration(hintText: 'Value'),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 32),
          Row(
            children: [
              ElevatedButton(
                child: const Text(
                  'Buy',
                  style: TextStyle(fontFamily: "NunitoBlack", fontSize: 16),
                ),
                onPressed: () {
                  final buy = Buy(
                    name: controllerName.text,
                    price: int.parse(controllerPrice.text),
                    val: int.parse(controllerValue.text),
                  );
                  buyStock(buy);
                  Navigator.pop(context);
                },
              ),
              const SizedBox(width: 24),
              ElevatedButton(
                child: const Text(
                  'Sell',
                  style: TextStyle(fontFamily: "NunitoBlack", fontSize: 16),
                ),
                onPressed: () {
                  final sell = Sell(
                    name: controllerName.text,
                    price: int.parse(controllerPrice.text),
                    val: int.parse(controllerValue.text),
                  );
                  sellStock(sell);
                  Navigator.pop(context);
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}

Future buyStock(Buy buy) async {
  final docBuy = FirebaseFirestore.instance.collection('Buy').doc();
  buy.id = docBuy.id;

  final json = buy.toJson();
  await docBuy.set(json).whenComplete(
    () {
      debugPrint('Bought');
    },
  );
}

Future sellStock(Sell sell) async {
  final docSell = FirebaseFirestore.instance.collection('Sell').doc();
  sell.id = docSell.id;

  final docBuy = FirebaseFirestore.instance.collection('Buy').doc('9nn5XBXiFLLAoT8D7RZB');
  final json = sell.toJson();
  await docSell.set(json).whenComplete(
    () {
      docBuy.delete();
    },
  );
}

class Buy {
  String id;
  final String name;
  final int price;
  final int val;

  Buy({
    this.id = '',
    required this.name,
    required this.price,
    required this.val,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'price': price,
        'value': val,
      };

  static Buy fromJson(Map<String, dynamic> json) => Buy(
        id: json['id'],
        name: json['name'],
        price: json['price'],
        val: json['value'],
      );
}

class Sell {
  String id;
  final String name;
  final int price;
  final int val;

  Sell({
    this.id = '',
    required this.name,
    required this.price,
    required this.val,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'price': price,
        'value': val,
      };

  static Sell fromJson(Map<String, dynamic> json) => Sell(
        id: json['id'],
        name: json['name'],
        price: json['price'],
        val: json['value'],
      );
}
