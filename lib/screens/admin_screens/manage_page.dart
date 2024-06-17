import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_app/utils/color.dart';
import 'package:demo_app/screens/admin_screens/adminhome_page.dart';

class ManagePage extends StatefulWidget {
  const ManagePage({super.key});

  @override
  State<ManagePage> createState() => _ManagePageState();
}

class _ManagePageState extends State<ManagePage> {
  final controllerName = TextEditingController();
  final controllerOpen = TextEditingController();
  final controllerChange = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Manage Stock',
            style: TextStyle(
                fontSize: 24,
                fontFamily: "NunitoBold",
                fontWeight: FontWeight.w500,
                color: black),
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
            controller: controllerOpen,
            decoration: const InputDecoration(hintText: 'Open'),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 24),
          TextField(
            controller: controllerChange,
            decoration: const InputDecoration(hintText: 'Change'),
            keyboardType: TextInputType.text,
          ),
          const SizedBox(height: 32),
          Row(
            children: [
              ElevatedButton(
                child: const Text('Add'),
                onPressed: () {
                  final symbol = Symbol(
                    name: controllerName.text,
                    open: int.parse(controllerOpen.text),
                    change: controllerChange.text,
                  );
                  createStock(symbol);
                  Navigator.pop(context);
                },
              ),
              const SizedBox(width: 24),
              ElevatedButton(
                child: const Text('Update'),
                onPressed: () {
                  final symbol = Symbol(
                    name: controllerName.text,
                    open: int.parse(controllerOpen.text),
                    change: controllerChange.text,
                  );
                  updateStock(symbol);
                  Navigator.pop(context);
                },
              ),
              const SizedBox(width: 24),
              ElevatedButton(
                child: const Text('Delete'),
                onPressed: () {
                  final docSymbol = FirebaseFirestore.instance
                      .collection('Stock')
                      .doc('');

                  docSymbol.delete().whenComplete(
                    () {
                      debugPrint('Deleted');
                    },
                  );
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future createStock(Symbol symbol) async {
      final docSymbol = FirebaseFirestore.instance.collection('Stock').doc('01');
      final json = symbol.toJson();
    
    await docSymbol.set(json).whenComplete(
      () {
        debugPrint('Added');
      },
    );
  }

  Future updateStock(Symbol symbol) async {
    final docSymbol = FirebaseFirestore.instance
        .collection('Stock')
        .doc('01');

    final json = symbol.toJson();
    await docSymbol.update(json).whenComplete(
      () {
        debugPrint('Updated');
      },
    );
  }
}
