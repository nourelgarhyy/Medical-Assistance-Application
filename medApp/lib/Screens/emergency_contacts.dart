import 'package:flutter/material.dart';
import 'package:health_care_app/Widgets/add_contact_dialog.dart';
import 'package:health_care_app/Widgets/contacts_view.dart';
import 'package:health_care_app/Widgets/menu_bar.dart';
import 'package:health_care_app/Widgets/navigation_bar.dart';

import 'package:shared_preferences/shared_preferences.dart';
//import 'package:flutter_application_1/model/extract_argments_screen.dart';
import 'package:provider/provider.dart';

const primaryColor = Color(0xFF92C9D4);

class Contacts extends StatelessWidget {
  get nav => Navigation();
  get menuBar => MenuBar();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor:Colors.black,
      body: ContactsWidget(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AddContactsDialog().showAlertDialog(context);
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                'addContact',
              );
            },
            icon: Icon(Icons.add),
          ),
        ],
        backgroundColor: Color(0xff053F5E),
        // leading: IconButton(
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        //   icon: Icon(Icons.arrow_back_ios),
        // ),
        title: Text('Emergency Contacts'),
      ),
      bottomNavigationBar: nav,
      drawer: menuBar,
    );
  }
}
