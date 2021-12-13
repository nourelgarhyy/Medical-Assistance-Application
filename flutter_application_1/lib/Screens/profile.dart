import 'package:flutter/material.dart';
import 'package:health_care_app/Providers/users_provider.dart';
import 'package:health_care_app/Screens/add_prescription.dart';
import 'package:health_care_app/Widgets/one_user.dart';
import 'package:health_care_app/Widgets/profile_view.dart';
import 'package:health_care_app/Widgets/menu_bar.dart';
import 'package:health_care_app/Widgets/navigation_bar.dart';
import 'package:provider/provider.dart';

class ProfileForm extends StatelessWidget {
  const ProfileForm({Key? key}) : super(key: key);
 // static const routeName = '/medicineList';

  get menuBar => MenuBar();
  get nav => Navigation();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        backgroundColor: Color(0xff92C9D4),
        centerTitle: true,
      ),
      bottomNavigationBar: nav, //Navigation Bar
      drawer: menuBar,
      body: ProfileWidget(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.edit),
        onPressed: () {
        
          Navigator.pushNamed(context, 'editProfile');
    
        },
      ),
    );
  }
}