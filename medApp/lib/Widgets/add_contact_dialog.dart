import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_care_app/Models/contact_details.dart';
import 'package:health_care_app/Providers/contacts.dart';
import 'package:health_care_app/services/fire_store_services.dart';
import 'package:provider/provider.dart' as provider;

class AddContactsDialog {
  
    final _addContactKey = GlobalKey<FormState>();
    TextEditingController _ID = TextEditingController();
    TextEditingController _Name = TextEditingController();
    TextEditingController _Number = TextEditingController();

    void dispose() {
    _ID.dispose();
    _Name.dispose();
    _Number.dispose();
  }

  showAlertDialog(BuildContext context) {
    
    // Create button
    Widget okButton = TextButton(
      child: Text("Add Contact"),
      onPressed: () async{
          if (_addContactKey.currentState!.validate()) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Saving')),
                );
              
        final contact =ContactDeets(
          name: _Name.text,
          phone: _Number.text, );

        final contactsData =provider.Provider.of<AllContacts>(context,listen:false);
        contactsData.createContact(contact);
        Navigator.of(context).pop();
          }
      },
    );

    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Add a new Emergency Contact "),
      content: Form(
        key:_addContactKey,
        child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            controller: _Name,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'This field cant be empty';
              }
              return null;
            },
            decoration: InputDecoration(hintText: "Enter Name"),
            
          ),
          TextFormField(
            controller: _Number,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'This field cant be empty';
              }
              if (!RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)').hasMatch(value)) {
                return "Please enter a valid phone number";
              }

              return null;
            },
            decoration: InputDecoration(hintText: "Enter Number"),
          ),
        ],
      )),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
