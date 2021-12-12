import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Screens/sign_in.dart';
import 'Screens/sign_up.dart';
import 'Screens/homepage.dart';
import 'Providers/reminders.dart';
import 'Providers/meds.dart';
import 'Screens/medicine_list.dart';
import 'Screens/help.dart';
import 'Screens/profile.dart';
import 'Screens/emergency_contacts.dart';
import 'Providers/contacts.dart';
import 'Screens/add_contact.dart';
import 'Screens/edit_profile.dart';

void main() {
  runApp(MyScreen());
}

class MyScreen extends StatelessWidget {
  const MyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Reminders()),
        ChangeNotifierProvider.value(value: Meds()),
        ChangeNotifierProvider.value(value: AllContacts()),
      ],
      child: MaterialApp(
        home: ChangeNotifierProvider(
          create: (_) => Reminders(),
          child: SignIn(),
        ),
        routes: {
          'signin': (context) => SignIn(),
          'signup': (context) => SignUp(),
          'homepage': (context) => Home(),
          'medicineList': (context) => MedicineList(),
          'help': (context) => Help(),
          'profile': (context) => ProfileForm(),
          'contacts': (context) => Contacts(),
          'addContact': (context) => AddEmergencyContact(),
          'editProfile': (context) => EditProfile(),
          //AddMedcinine.routeName:(context)=> AddMedcinine(),
        },
      ),
    );
  }
}
