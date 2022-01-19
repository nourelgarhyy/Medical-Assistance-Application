import 'package:flutter/material.dart';
import 'package:health_care_app/Models/gender.dart';
import 'package:health_care_app/Providers/users_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart' as provider;

class SignUp extends StatefulWidget {
  SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _signupKey = GlobalKey<FormState>();
  gender _gender = gender.female;

  final usernameController = TextEditingController();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final numberController = TextEditingController();
  final passwordController = TextEditingController();

  void dispose() {
    usernameController.dispose();
    nameController.dispose();
    emailController.dispose();
    numberController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Sign Up'),
          backgroundColor: const Color(0xff92C9D4),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: Container(
                  width: 350,
                  height: 900,
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
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Enter Your Full Name';
                                  }
                                  return null;
                                },
                                controller: nameController,
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  labelText: 'FULL NAME',
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
                                  if (value!.isEmpty) {
                                    return 'Enter Your Mobile Number';
                                  }
                                  if (!RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)')
                                      .hasMatch(value)) {
                                    return "Please enter a valid phone number";
                                  }
                                  return null;
                                },
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  labelText: 'MOBILE NUMBER',
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
                                  if (value!.isEmpty) {
                                    return 'Enter Your Email';
                                  }
                                  if (!RegExp(r'\S+@\S+\.\S+')
                                      .hasMatch(value)) {
                                    return "Please Enter a Valid Email Address";
                                  }
                                  return null;
                                },
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  labelText: 'EMAIL',
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
                                //  controller: ,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Enter Your Username';
                                  }
                                  return null;
                                },
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  labelText: 'USERNAME',
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
                                  if (value!.isEmpty) {
                                    return 'Enter Password';
                                  }
                                  if (value.length < 8) {
                                    return 'Password length must be atleast 8 characters';
                                  }
                                  return null;
                                },
                                obscureText: true,
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  labelText: 'PASSWORD',
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
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Confirm Password';
                                  }
                                  return null;
                                },
                                obscureText: true,
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  labelText: 'CONFIRM PASSWORD',
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 3, color: Colors.blue),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            ListTile(
                              title: Text('Female'),
                              leading: Radio(
                                  value: gender.female,
                                  groupValue: _gender,
                                  onChanged: (value) {
                                    setState(() {
                                      _gender = value as gender;
                                    });
                                  }),
                            ),
                            ListTile(
                              title: Text('Male'),
                              leading: Radio(
                                  value: gender.male,
                                  groupValue: _gender,
                                  onChanged: (value) {
                                    setState(() {
                                      _gender = value as gender;
                                    });
                                  }),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            ElevatedButton(
                              onPressed: () async {
                                final SharedPreferences prefs =
                                    await SharedPreferences.getInstance();
                                prefs.setString('name', nameController.text);
                                prefs.setString(
                                    'username', usernameController.text);
                                prefs.setString('email', emailController.text);
                                prefs.setString(
                                    'mobile number', numberController.text);
                                prefs.setString(
                                    'password', passwordController.text);

                                if (_signupKey.currentState!.validate()) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Welcome Back!'),
                                  ),
                                );
                                Navigator.pushNamed(context, 'signin');
                                }

                              },
                              child: Text('SIGN UP'),
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                  ),
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
        ));
  }

  bool isConfirmed(String pass, String confirmPass) {
    if (pass == confirmPass) {
      return true;
    } else
      return false;
  }
}
