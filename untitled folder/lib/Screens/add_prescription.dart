import 'package:flutter/material.dart';
import 'package:health_care_app/Providers/meds.dart';
import 'package:provider/provider.dart';

showAlertDialog(BuildContext context) {
  TextEditingController _ID = TextEditingController();
  TextEditingController _Name = TextEditingController();
    TextEditingController _Time = TextEditingController();
  TextEditingController _Dose = TextEditingController();
  // Create button
  Widget okButton = TextButton(
    child: const Text("ADD NOTE"),
    onPressed: () {
      Provider.of<Meds>(context, listen: false).addMedInList(_ID.text, _Name.text,_Dose.text, _Time.text);
      Navigator.of(context).pop();
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    title: const Text("ADD A NEW MEDICATION "),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          controller: _ID,
          decoration: const InputDecoration(hintText: "Enter ID"),
        ),
        TextField(
          controller: _Name,
          decoration: const InputDecoration(hintText: "Enter Name"),
        ),
         TextField(
          controller: _Time,
          decoration: const InputDecoration(hintText: "Enter Dose"),
        ),
         TextField(
          controller: _Dose,
          decoration: const InputDecoration(hintText: "Enter Time"),
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
