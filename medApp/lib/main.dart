import 'package:flutter/material.dart';
import 'package:health_care_app/Providers/users_provider.dart';
import 'package:health_care_app/Screens/add_medicine_reminder.dart';
import 'package:provider/provider.dart';
import 'Screens/error_screen.dart';
import 'Screens/loading_screen.dart';
import 'Screens/sign_in.dart';
import 'Screens/sign_up.dart';
import 'Screens/homepage.dart';
import 'Providers/meds.dart';
import 'Screens/medicine_list.dart';
import 'Screens/help.dart';
import 'Screens/profile.dart';
import 'Screens/emergency_contacts.dart';
import 'Providers/contacts.dart';
import 'Screens/add_contact.dart';
import 'Screens/edit_profile.dart';
import 'Providers/reminders_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'Screens/maps.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyScreen());
}

class MyScreen extends StatelessWidget {
  //const MyScreen({Key? key}) : super(key: key);

  final _fbApp= Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyBYGlYYs2oj0d3c7vXUkhwa8vgV-V9r_KI",
      appId: "1:1089665190517:android:de9333eab7f7f4c722863c",
      messagingSenderId: "1089665190517",
      projectId: "health-reminder-apps",
    ),
  );
  

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        //ChangeNotifierProvider.value(value: Reminders()),
        ChangeNotifierProvider.value(value: Meds()),
        ChangeNotifierProvider.value(value: AllContacts()),
        ChangeNotifierProvider.value(value: UsersProvider()),
        ChangeNotifierProvider(create: (context) => RemindersProvider()),
        // Provider<AuthenticationService>(
        //   create:(_) => AuthenticationService(FirebaseAuth.instance)
        // ),
        // StreamProvider(
        //   create: (context) =>context.read<AuthenticationService>().authStateChanges, 
        //   initialData: null,
        // )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
        primaryColor: Color(0xff053F5E),
        
      ),

        home: FutureBuilder(
      future: _fbApp,
       builder: (context, snapshot){
        if(snapshot.hasError){
          return ErrorScreen();
        }else if (snapshot.hasData){return AuthenticationWrapper();}
        else{
          return LoadingScreen();
        }
    },),
        routes: {
          'signin': (context) => SignIn(),
          'signup': (context) => SignUp(),
          'homepage': (context) => Home(),
          'medicineList': (context) => AddMedicine(),
          'help': (context) => Help(),
          'profile': (context) => Profile(),
          'contacts': (context) => Contacts(),
          'addContact': (context) => AddEmergencyContact(),
          'editProfile': (context) => EditProfile(),
          'map':(context)=>Map(),
          'meds': (context) => MedicineList(),
          
          
        },
      ),
    );
  }
}
// class AuthenticationWrapper extends StatelessWidget{
//   @override
//   Widget build(BuildContext context){
//     final firebaseUser= context.watch<User?>();
//     if(firebaseUser!=null){
//       return Home();
//     }
//     return SignIn();
//   }
// }
class AuthenticationWrapper extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    User? user= FirebaseAuth.instance.currentUser;
    if(user!=null){
      return Home();
    }
    return SignIn();
  }
}