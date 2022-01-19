import 'package:flutter/material.dart';
import 'package:health_care_app/Providers/reminders_provider.dart';
import 'package:health_care_app/services/fire_store_services.dart';
import 'package:provider/provider.dart';
import '../Models/reminder.dart';
import '../services/fire_store_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';

class CardList extends StatelessWidget {
  final Reminder reminders;
  int ID;
  CardList(this.reminders, this.ID);

  String? get id => null;

  // get id => FireStoreServices(this.id);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: ListTile(
          leading: Icon(Icons.check),
          title: Text(reminders.name),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(reminders.dose),
              Text(reminders.time),
              Text(reminders.description),
            ],
          ),
          isThreeLine: true,
          trailing: IconButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Reminder Deleted'),
                  ),
                );
                // Reminder r = Reminder(id!,
                //     name: reminders.name,
                //     dose: reminders.dose,
                //     time: reminders.time,
                //     description: reminders.description);

                Provider.of<RemindersProvider>(context, listen: false)
                    .removeReminders(ID);
                FireStoreServices().removeReminder(reminders.id);
              },
              icon: Icon(Icons.delete)),
        ),
      ),
    );
  }
}

class AddReminderDialog {
  Random id = new Random();
  int randomNumber = id.nextInt(100);

  addReminder(BuildContext context) {
    final _name = TextEditingController();
    final _dose = TextEditingController();
    final _time = TextEditingController();
    final _description = TextEditingController();

    Widget okButton = TextButton(
      child: Text('Add Reminder'),
      onPressed: () async {
        Reminder rem = Reminder(
          id,
          name: _name.text,
          dose: _dose.text,
          time: _time.text,
          description: _description.text,
        );

        // context.read<RemindersProvider>().addReminders(
        //     id!, _name.text, _dose.text, _time.text, _description.text);

        await FireStoreServices().addRem(rem);
        Navigator.of(context).pop();
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text('ADD A REMINDER'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _name,
              decoration: InputDecoration(labelText: "Name"),
            ),
            TextField(
              controller: _dose,
              decoration: InputDecoration(labelText: "Dose"),
            ),
            TextField(
              controller: _time,
              decoration: InputDecoration(labelText: "Time"),
            ),
            TextField(
              controller: _description,
              decoration: InputDecoration(labelText: "Description"),
            ),
          ],
        ),
      ),
      actions: [
        okButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
