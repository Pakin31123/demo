import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:datetime_picker_formfield_new/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';
import 'package:demo_app/utils/color.dart';
import 'package:get/get.dart';

class RequestPage extends StatefulWidget {
  const RequestPage({super.key});

  @override
  State<RequestPage> createState() => _RequestPageState();
}

class _RequestPageState extends State<RequestPage> {
  final controllerName = TextEditingController();
  final controllerValue = TextEditingController();
  final controllerDate = TextEditingController();

  Future createRequest(Request request) async {
    final docRequset = FirebaseFirestore.instance.collection('Request').doc();
    request.id = docRequset.id;

    final json = request.toJson();
    await docRequset.set(json);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
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
      body: ListView(
        padding: EdgeInsets.all(16),
        children: <Widget>[
          TextField(
            controller: controllerName,
            decoration: const InputDecoration(
              labelText: ('Name'),
            ),
          ),
          const SizedBox(height: 24),
          TextField(
            controller: controllerValue,
            decoration: InputDecoration(
              labelText: ('Value'),
            ),
          ),
          const SizedBox(height: 24),
          DateTimeField(
            controller: controllerDate,
            decoration: const InputDecoration(labelText: 'Date'),
            format: DateFormat('yyyy-MM-dd'),
            onShowPicker: (context, currentValue) => showDatePicker(
              context: context,
              initialDate: currentValue ?? DateTime.now(),
              firstDate: DateTime(2000),
              lastDate: DateTime(2025),
            ),
          ),
          const SizedBox(height: 32),
          ElevatedButton(
            child: Text('Save'),
            onPressed: () {
              final request = Request(
                  name: controllerName.text,
                  value: int.parse(controllerValue.text),
                  date: DateTime.parse(controllerDate.text));
              createRequest(request);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
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
}
