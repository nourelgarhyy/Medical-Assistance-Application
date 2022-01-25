import 'package:flutter/material.dart';
import 'package:health_care_app/Providers/users_provider.dart';
import 'package:health_care_app/Screens/add_prescription.dart';
import 'package:health_care_app/Widgets/one_user.dart';
import 'package:health_care_app/Widgets/profile_view.dart';
import 'package:health_care_app/Widgets/menu_bar.dart';
import 'package:health_care_app/Widgets/navigation_bar.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String obtainedName = "";
  String obtainedNumber = " ";
  String obtainedEmail = ' ';
  String username = " ";
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
  get menuBar => MenuBar();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(0xff053F5E),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
                color: Color(0xff053F5E),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30))),
            child: Container(
              margin: EdgeInsets.only(left: 30, bottom: 30),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: Image.asset(
                      "assets/pp.jpg",
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 30),
                          child: Text(
                            obtainedName,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Text(
                            'Patient',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Card(
              margin: EdgeInsets.only(left: 20),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: TextEditingController()..text = obtainedEmail,
                    readOnly: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                      borderSide: BorderSide(width: 3, color: Colors.blueGrey),
                      borderRadius: BorderRadius.circular(15),
                    )),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: TextEditingController()..text = username,
                    readOnly: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                      borderSide: BorderSide(width: 3, color: Colors.blueGrey),
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
                      borderSide: BorderSide(width: 3, color: Colors.blueGrey),
                      borderRadius: BorderRadius.circular(15),
                    )),
                  ),
                ],
              )),
        ]),
      ),
      bottomNavigationBar: nav, //Navigation Bar
      drawer: menuBar,
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Colors.white,
      //   foregroundColor: Colors.black,
      //   child: Icon(Icons.edit),
      //   onPressed: () {
      //     Navigator.pushNamed(context, 'editProfile');
      //   },
      // ),
    );
  }
}
