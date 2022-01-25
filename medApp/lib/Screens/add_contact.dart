//import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_care_app/Widgets/navigation_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

const primaryColor = Color(0xFF92C9D4);

class AddEmergencyContact extends StatelessWidget {
  get nav => Navigation();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: const Text('Add Emergency Contact'),
        backgroundColor: primaryColor,
      ),
      body: const AddContactForm(),
      bottomNavigationBar: nav,
    );
  }


}

class AddContactForm extends StatefulWidget {
  const AddContactForm({Key? key}) : super(key: key);

  @override
  AddContactFormState createState() => AddContactFormState();
}

class AddContactFormState extends State<AddContactForm> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final numberController = TextEditingController();

  void dispose() {
    nameController.dispose();
    numberController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          TextFormField(
            controller: nameController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter Full Name';
              }
              return null;
            },
            decoration: InputDecoration(
                border: OutlineInputBorder(), hintText: 'Full Name'),
          ),
          TextFormField(
            controller: numberController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter Mobile Number';
              }
              if (!RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)').hasMatch(value)) {
                return "Please enter a valid phone number";
              }

              return null;
            },
            decoration: InputDecoration(
                border: OutlineInputBorder(), hintText: 'Mobile Number'),
          ),
          ElevatedButton(
            onPressed: () async {
              /*if (_formKey.currentState!.validate()) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Saving')),
                );
              }*/

              final SharedPreferences prefs =
                  await SharedPreferences.getInstance();
              prefs.setString('contact name', nameController.text);
              prefs.setString('contact mobile number', numberController.text);

              Navigator.pushNamed(context, 'contacts');
            },
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }
}
