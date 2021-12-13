import 'package:flutter/material.dart';
import 'package:health_care_app/Widgets/navigation_bar.dart';
import 'package:health_care_app/Widgets/profile_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditProfile extends StatelessWidget {
  get nav => Navigation();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProfileWidget(),
      appBar: AppBar(
         backgroundColor: const Color(0xff49BFC3),
  
        title: const Text("Edit Profile"),
      ),
      bottomNavigationBar: nav,
      
    );
  }
}

