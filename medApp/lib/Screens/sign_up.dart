import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:health_care_app/Models/gender.dart';
import 'package:health_care_app/Providers/users_provider.dart';
import 'package:health_care_app/services/auth_status.dart';
import 'package:health_care_app/services/authentication_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart' as provider;
import '../Models/user.dart' as user2;
import '../services/fire_store_services.dart';

class SignUp extends StatefulWidget {
  SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _signupKey = GlobalKey<FormState>();
  gender _gender = gender.female;

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final numberController = TextEditingController();
  final passwordController = TextEditingController();
  final dateController = TextEditingController();

  void dispose() {
    nameController.dispose();
    emailController.dispose();
    numberController.dispose();
    passwordController.dispose();
  }

  

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Color(0xff053F5E),
        appBar: AppBar(
          title: Text('Sign Up'),
          elevation: 0.0,
          backgroundColor: Color(0xff053F5E),
          centerTitle: true,
        ),
        body: Container(
          width: size.width,
          height: 700,
          decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30), topLeft: Radius.circular(30))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Center(
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
                      key: _signupKey,
                      child: ListView(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(
                                height: 50,
                              ),
                              Container(
                                width: 320,
                                child: TextFormField(
                                  controller: nameController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'This field cant be empty';
                                    }
                                    return null;
                                  },
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                    labelText: 'Name',
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 3, color: Colors.blue),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Container(
                                width: 320,
                                child: TextFormField(
                                  controller: emailController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'This field cant be empty';
                                    }
                                    return null;
                                  },
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                    labelText: 'Email',
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 3, color: Colors.blue),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Container(
                                width: 320,
                                child: TextFormField(
                                  controller: dateController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'This field cant be empty';
                                    }
                                    return null;
                                  },
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                    labelText: 'DOB: DD/MM/YY',
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 3, color: Colors.blue),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Container(
                                width: 320,
                                child: TextFormField(
                                  controller: numberController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'This field cant be empty';
                                    }
                                    return null;
                                  },
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                    labelText: 'Phone Number',
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 3, color: Colors.blue),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Container(
                                width: 320,
                                child: TextFormField(
                                  controller: passwordController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'This field cant be empty';
                                    }
                                    return null;
                                  },
                                  obscureText: true,
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                    labelText: 'Password',
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 3, color: Colors.blue),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),

                              // SizedBox(
                              //   height: 10,
                              // ),
                              SizedBox(
                                height: 20,
                              ),
                              MaterialButton(
                                minWidth: 300,
                                height: 60,
                                onPressed: _signup,
                                color: Color(0xff107163),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40)),
                                child: Text(
                                  "Sign Up",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  bool isConfirmed(String pass, String confirmPass) {
    if (pass == confirmPass) {
      return true;
    } else
      return false;
  }

  _signup() async {
    {
      if (_signupKey.currentState!.validate()) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('loading')),
        );
      }
      final status = await FirebaseAuthHelper().createAccount(
        email: emailController.text.trim(),
        pass: passwordController.text.trim(),
      );

      if (status == AuthResultStatus.successful) {
         String uid =  FirebaseAuth.instance.currentUser!.uid;
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('username', emailController.text);
        Navigator.pushNamed(context, 'homepage');
        final user = user2.User(
          name: nameController.text,
          mail: emailController.text,
          phone: numberController.text,
          DOB: dateController.text,
          password: passwordController.text,
        );

 final docUser = FirebaseFirestore.instance.collection('users').doc(uid);
  user.id = docUser.id;
  final json = user.toJson();
  await docUser.set(json);
      
        Navigator.pushNamed(context, 'homepage');
      } else {
        print("signup status: $status");
        final errorMsg = AuthExceptionHandler.generateExceptionMessage(status);
        _showAlertDialog(errorMsg);
      }
    }
  } //_singup

  _showAlertDialog(errorMsg) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              'Signup Failed',
              style: TextStyle(color: Colors.black),
            ),
            content: Text(errorMsg),
          );
        });
  } //show alert

}
