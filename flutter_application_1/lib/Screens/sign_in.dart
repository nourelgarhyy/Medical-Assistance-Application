import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignIn extends StatefulWidget {
  SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _signinKey = GlobalKey<FormState>();

  final nameController = TextEditingController();

  void dispose() {
    nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(null),
        title: const Text('Sign In'),
        centerTitle: true,
        backgroundColor: const Color(0xff92C9D4),
      ),
      body: SingleChildScrollView(
        reverse: true,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Image.asset(
                  "assets/logo.png",
                  scale: 0.8,
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
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
                key: _signinKey,
                child: ListView(padding: const EdgeInsets.all(0), children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 320,
                          child: TextFormField(
                            controller: nameController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please Enter Your Username';
                              }
                              return null;
                            },
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              labelText: 'Username',
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 3, color: Colors.blueGrey),
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                        Container(
                          width: 320,
                          child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please Enter Your Password';
                              }
                              return null;
                            },
                            obscureText: true,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 3, color: Colors.blueGrey),
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "Don't Have an account?",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, 'signup');
                              },
                              child: Text(
                                'Sign Up',
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 35,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.0),
                              boxShadow: [
                                BoxShadow(
                                    color: Color(0xFF6078ea).withOpacity(.3),
                                    offset: Offset(0.0, 8.0),
                                    blurRadius: 8.0)
                              ]),
                          child: ElevatedButton(
                            onPressed: () async {
                              final SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              prefs.setString('username', nameController.text);

                              if (_signinKey.currentState!.validate()) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Welcome Back!'),
                                  ),
                                );
                                Navigator.pushNamed(context, 'homepage');
                              }
                            },
                            child: Text('SIGN IN',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Poppins-Bold",
                                    fontSize: 18,
                                    letterSpacing: 1.0)),
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.blue[500]),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(13.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ]),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
