import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_care_app/Widgets/menu_bar.dart';
import 'package:health_care_app/Widgets/navigation_bar.dart';

import 'package:shared_preferences/shared_preferences.dart';

// class Profile extends StatelessWidget {
//   get nav => Navigation();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ProfileForm(),
//       appBar: AppBar(
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           icon: Icon(Icons.arrow_back_ios),
//         ),
//         title: Text("Profile"),
//       ),
//       bottomNavigationBar: nav,
//     );
//   }
// }

class ProfileForm extends StatefulWidget {
  const ProfileForm({Key? key}) : super(key: key);

  @override
  _ProfileFormState createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  String? obtainedName, obtainedNumber, obtainedEmail, obtainedUsername;
  final _formkey = GlobalKey<FormState>();

  void initState() {
    // TODO: implement initState
    super.initState();
    getUserData();
  }

  Future getUserData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    obtainedName = prefs.getString('name') ?? 'no name found';
    obtainedUsername = prefs.getString('username') ?? 'no username found';
    obtainedNumber = prefs.getString('mobile number') ?? 'no number found';
    obtainedEmail = prefs.getString('email') ?? 'no email found';

    setState(() {});
  }

  get nav => Navigation();
  get menuBar => MenuBar();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff92C9D4),
          title: Text("Profile"),
          centerTitle: true,
        ),
        drawer: menuBar,
        bottomNavigationBar: nav,
        body: Center(
          child: Container(
            width: 350,
            height: 500,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0.0, 15.0),
                      blurRadius: 15.0),
                  BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0.0, -10.0),
                      blurRadius: 10.0),
                ]),
            child: Form(
              key: _formkey,
              child: ListView(children: [
                Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: 320,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // SizedBox(
                            //   width: 20,
                            // ),
                            Image.asset(
                              'assets/pp.jpg',
                              height: 60,
                              width: 60,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  //Text('$obtainedUsername'),
                                  //Text('$obtainedEmail'),
                                ] //column children
                                )
                          ] //row children
                          ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: 320,
                      child: TextFormField(
                        readOnly: true,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: obtainedName),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: 320,
                      child: TextFormField(
                        readOnly: true,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: obtainedEmail),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: 320,
                      child: TextFormField(
                        readOnly: true,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: obtainedNumber),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    FloatingActionButton(
                      heroTag: "btn1",
                      child: Icon(Icons.edit),
                      backgroundColor: Color(0xff92C9D4),
                      foregroundColor: Colors.white,
                      onPressed: () {
                        Navigator.pushNamed(context, 'editProfile');
                      },
                    ),
                  ],
                ),
              ]),
            ),
          ),
        ));
  }
}
