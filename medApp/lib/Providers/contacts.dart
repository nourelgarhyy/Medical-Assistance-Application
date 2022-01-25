import 'package:flutter/material.dart';
import '../Models/contact_details.dart';

class AllContacts with ChangeNotifier {
  List<ContactDeets> contactlist = [
    ContactDeets(id: '1', name: 'Sarah', phone: '018393724'),
    ContactDeets(id: '2', name: 'Eman', phone: '038438575'),
    ContactDeets(id: '3', name: 'Yasser', phone: '04883485'),
  ];

  addContactInList(String id, String name, String number) {
    final newContact = ContactDeets(
      id: id,
      name: name,
      phone: number,
    );
    contactlist.add(newContact);
    notifyListeners();
  }

  List<ContactDeets> get cList {
    return [...contactlist];
  }

   void deleteContact(String id) {
    contactlist.removeWhere((contact) => contact.id == id);
    notifyListeners();
  }

}
