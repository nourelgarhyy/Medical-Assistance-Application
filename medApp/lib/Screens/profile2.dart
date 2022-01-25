import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:health_care_app/Providers/users_provider.dart';
import 'package:health_care_app/Screens/add_prescription.dart';
import 'package:health_care_app/Widgets/one_user.dart';
import 'package:health_care_app/Widgets/profile_view.dart';
import 'package:health_care_app/Widgets/menu_bar.dart';
import 'package:health_care_app/Widgets/navigation_bar.dart';
import 'package:health_care_app/services/authentication_helper.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileForm extends StatelessWidget {
   ProfileForm({Key? key}) : super(key: key);
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
      body: Profile(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.edit),
        onPressed: () {
        
          Navigator.pushNamed(context, 'editProfile');
    
        },
      ),
    );
  }
}
class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String obtainedName="";
  String obtainedNumber=" ";
  String obtainedEmail=' ';
  String username=" ";
  final _formkey = GlobalKey<FormState>();

  void initState() {
    // TODO: implement initState
    super.initState();
    getUserData();
  }

  Future getUserData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    obtainedName = prefs.getString('name') ?? 'no name found';
    obtainedNumber = prefs.getString('mobile number') ?? 'no number found';
    obtainedEmail = prefs.getString('email') ?? 'no email found';
    username = prefs.getString('username') ?? 'no name found';

    setState(() {});
  }

  get nav => Navigation();

  
  @override
  Widget build(BuildContext context) {
    
    return Container(
      
     
      child: Form(
                
                child: ListView(padding: const EdgeInsets.all(0), children: [
                  
     Column(
       
        mainAxisAlignment: MainAxisAlignment.center,

          children:[ 
            const SizedBox(
                height: 20,
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                 Image.asset('assets/pp.jpg',height: 70,width: 70,),
                 const SizedBox(
                width: 20,
                  ),
                  Text(username),
                ],
              ),
            
            const SizedBox(
                height: 20,
              ),
          TextField(
            controller: TextEditingController()..text = obtainedName,
            readOnly: true,
            decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                                    width: 3, color: Colors.blueGrey),
                                borderRadius: BorderRadius.circular(15),
                      )),
          ),
          const SizedBox(
                height: 20,
              ),
          TextField(
            controller: TextEditingController()..text = obtainedEmail,
             readOnly: true,
            decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                                    width: 3, color: Colors.blueGrey),
                                borderRadius: BorderRadius.circular(15),
                      )),
          ),
          const SizedBox(
                height: 20,
              ),
          TextField(
            controller: TextEditingController()..text = obtainedNumber,
             readOnly: true,
            decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                                    width: 3, color: Colors.blueGrey),
                        borderRadius: BorderRadius.circular(15),
                      )),
          ),
        
          ]),
                ]),
      )
    );
  }
}
