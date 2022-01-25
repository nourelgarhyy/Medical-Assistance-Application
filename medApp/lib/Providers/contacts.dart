import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../Models/contact_details.dart';

class AllContacts with ChangeNotifier {
  // List<ContactDeets> contactlist = [
  //   ContactDeets(id: '1', name: 'Sarah', phone: '018393724'),
  //   ContactDeets(id: '2', name: 'Eman', phone: '038438575'),
  //   ContactDeets(id: '3', name: 'Yasser', phone: '04883485'),
  // ];
  
//String User_ID=FirebaseAuth.instance.currentUser!.uid;
final Collection=FirebaseFirestore.instance.collection('contacts').doc();
//final Collection_ID=FirebaseFirestore.instance.collection('contacts').doc().id;


Future createContact(ContactDeets contact)async{
    String uid =  FirebaseAuth.instance.currentUser!.uid;
    contact.id=uid;
    final json=contact.toJson();
    await Collection.set(json);
    notifyListeners();
  }

// Future deleteContact()async{
//   FirebaseFirestore.instance.collection('contacts').doc().delete();
// }




//    Future<void> removeContact(String id)async{
//    contact.doc(cid).collection('contacts').doc(id).delete();
//  }

  // List<ContactDeets> get cList {
  //   return [...contactlist];
  // }

  //  void deleteContact(String id) {
  //   contactlist.removeWhere((contact) => contact.id == id);
  //   notifyListeners();
  // }


}
