import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:health_care_app/Models/reminder.dart';

class FireStoreServices {
  String uid = FirebaseAuth.instance.currentUser!.uid;
  CollectionReference reminders =
      FirebaseFirestore.instance.collection('Users');

  Future<Object?> addRem(Reminder rem) async {
    try {
      DocumentReference documentReference =
          reminders.doc(uid).collection('Reminders').doc(rem.id);
      FirebaseFirestore.instance.runTransaction((transaction) async {
        DocumentSnapshot snapshot = await transaction.get(documentReference);
        if (!snapshot.exists) {
          documentReference.set({'Name': rem.name});
          documentReference.set({'Dose': rem.dose});
          documentReference.set({'Time': rem.time});
          documentReference.set({'Description': rem.description});
        }
        String newName = snapshot['Name'] + rem.name;
        String newDose = snapshot['Dose'] + rem.dose;
        String newTime = snapshot['Time'] + rem.time;
        String newDescription = snapshot['Description'] + rem.description;

        transaction.update(documentReference, {'Name': newName});
        transaction.update(documentReference, {'Dose': newDose});
        transaction.update(documentReference, {'Time': newTime});
        transaction.update(documentReference, {'Description': newDescription});
      });
    } catch (e) {
      return e;
    }
  }

  Future<void> removeReminder(String id) async {
    reminders.doc(uid).collection('Reminders').doc(id).delete();
  }
}
