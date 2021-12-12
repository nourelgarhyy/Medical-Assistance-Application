import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_care_app/Providers/contacts.dart';
import 'package:provider/provider.dart';

class AddContactsDialog extends StatelessWidget {
  showAlertDialog(BuildContext context) {
    TextEditingController _ID = TextEditingController();
    TextEditingController _Name = TextEditingController();
    TextEditingController _Number = TextEditingController();
    // Create button
    Widget okButton = TextButton(
      child: Text("Add Contact"),
      onPressed: () {
        Provider.of<AllContacts>(context, listen: false)
            .addContactInList(_ID.text, _Name.text, _Number.text);
        Navigator.of(context).pop();
      },
    );

    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Add a new Emergency Contact "),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _ID,
            decoration: InputDecoration(hintText: "Enter National ID"),
          ),
          TextField(
            controller: _Name,
            decoration: InputDecoration(hintText: "Enter Name"),
          ),
          TextField(
            controller: _Number,
            decoration: InputDecoration(hintText: "Enter Number"),
          ),
        ],
      ),
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

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
