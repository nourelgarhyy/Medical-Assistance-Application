import 'package:flutter/material.dart';
import 'package:health_care_app/Providers/contacts.dart';
import 'package:provider/provider.dart' as provider;
import 'one_contact.dart';


class ContactsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final contactsData =provider.Provider.of<AllContacts>(context);
    final contacts = contactsData.cList;

    return ListView.builder(

      itemCount: contacts.length,
      itemBuilder: (ctx, i) => OneContact(contacts[i]),
      
    );
  }
}
