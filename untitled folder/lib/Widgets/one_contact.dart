import 'package:flutter/material.dart';
import 'package:health_care_app/Models/contact_details.dart';

import 'package:provider/provider.dart';

class OneContact extends StatelessWidget {
  ContactDeets contact;
  OneContact(this.contact);

  @override
  Widget build(BuildContext context) {
    return Container(
      //width:MediaQuery.of(context).size.width * 0.50, height:70,

      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: BorderSide(color: Colors.blueGrey, width: 0.5),
          ),
          child: ListTile(
            title: Text(
              contact.name,
              textAlign: TextAlign.center,
            ),
            subtitle: Text(
              "${contact.number} ",
              textAlign: TextAlign.center,
            ),
            isThreeLine: true,
          )),
    );
  }
}
