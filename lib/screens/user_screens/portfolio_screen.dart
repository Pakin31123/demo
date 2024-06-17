import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({super.key});

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  final _formKey = GlobalKey<FormState>();
  final controllerName = TextEditingController();
  final controllerLastname = TextEditingController();
  final controllerEmail = TextEditingController();
  final controllerPhone = TextEditingController();
  final controllerAge = TextEditingController();
  final controllerGender = TextEditingController();
  final controllerCountry = TextEditingController();

  Future createBioprofile(Profile profile) async {
    final docProfile = FirebaseFirestore.instance.collection('Profile').doc();
    profile.id = docProfile.id;

    final json = profile.toJson();
    await docProfile.set(json);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Scrollbar(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: AutofillGroup(
              child: Column(
                children: [
                  ...[
                    TextField(
                      controller: controllerName,
                      autofocus: true,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        labelText: 'First Name',
                      ),
                      autofillHints: const [AutofillHints.givenName],
                    ),
                    TextField(
                      controller: controllerLastname,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        labelText: 'Last Name',
                      ),
                      autofillHints: const [AutofillHints.familyName],
                    ),
                    TextField(
                      controller: controllerEmail,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        labelText: 'Email',
                      ),
                      autofillHints: [AutofillHints.email],
                    ),
                    TextField(
                      controller: controllerPhone,
                      keyboardType: TextInputType.phone,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        labelText: 'Telephone',
                      ),
                      autofillHints: [AutofillHints.telephoneNumber],
                    ),
                    TextField(
                      controller: controllerAge,
                      keyboardType: TextInputType.streetAddress,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        labelText: 'Age',
                      ),
                      autofillHints: [AutofillHints.streetAddressLine1],
                    ),
                    TextField(
                      controller: controllerGender,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        labelText: 'Gender',
                      ),
                      autofillHints: [AutofillHints.postalCode],
                    ),
                    TextField(
                      controller: controllerCountry,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        labelText: 'Country',
                      ),
                      autofillHints: [AutofillHints.countryName],
                    ),
                  ].expand(
                    (widget) => [
                      widget,
                      const SizedBox(
                        height: 24,
                      ),
                    ],
                  ),
                  ElevatedButton(
                    child: Text('Save'),
                    onPressed: () {
                      final profile = Profile(
                        name: controllerName.text,
                        lastname: controllerLastname.text,
                        email: controllerEmail.text,
                        phone: controllerPhone.text,
                        age: int.parse(controllerAge.text),
                        gender: controllerGender.text,
                        country: controllerCountry.text,
                      );
                      Navigator.pop(context);
                      createBioprofile(profile);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Profile {
  String id;
  final String name;
  final String lastname;
  final String email;
  final String phone;
  final int age;
  final String gender;
  final String country;

  Profile({
    this.id = '',
    required this.name,
    required this.lastname,
    required this.email,
    required this.phone,
    required this.age,
    required this.gender,
    required this.country,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'lastname': lastname,
        'email': email,
        'phone': phone,
        'age': age,
        'gender': gender,
        'country': country,
      };
}
