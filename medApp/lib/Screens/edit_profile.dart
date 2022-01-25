import 'package:flutter/material.dart';
import 'package:health_care_app/Widgets/navigation_bar.dart';
import 'package:health_care_app/Widgets/profile_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditProfile extends StatelessWidget {
  get nav => Navigation();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: editProfile(),
      appBar: AppBar(
         backgroundColor: const Color(0xff49BFC3),
  
        title: const Text("Edit Profile"),
      ),
      bottomNavigationBar: nav,
      
    );
  }
}
class editProfile extends StatefulWidget {
  const editProfile({Key? key}) : super(key: key);

  @override
  _editProfileState createState() => _editProfileState();
}

class _editProfileState extends State<editProfile> {
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

