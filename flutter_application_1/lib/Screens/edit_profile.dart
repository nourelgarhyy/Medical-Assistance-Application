import 'package:flutter/material.dart';
import 'package:health_care_app/Widgets/navigation_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditProfile extends StatelessWidget {
  get nav => Navigation();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EditProfileForm(),
      appBar: AppBar(
         backgroundColor: const Color(0xff49BFC3),
        // leading: IconButton(
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        //   icon: Icon(Icons.arrow_back_ios),
        // ),
        title: const Text("Edit Profile"),
      ),
      bottomNavigationBar: nav,
    );
  }
}

class EditProfileForm extends StatefulWidget {
  const EditProfileForm({Key? key}) : super(key: key);

  @override
  _EditProfileFormState createState() => _EditProfileFormState();
}

class _EditProfileFormState extends State<EditProfileForm> {
  final _formkey = GlobalKey<FormState>();
  String? obtainedName, obtainedNumber, obtainedEmail, obtainedPassword;
  final passwordController = TextEditingController();

  void dispose() {
    passwordController.dispose();
  }

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
    obtainedPassword = prefs.getString('password') ?? 'no password found';

   void setStateIfMounted(f) {
  if (mounted) setState(f);
}
  }

  @override
  Widget build(BuildContext context) {
    return Center(
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
            Column(children: [
              const SizedBox(
                height: 20,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              SizedBox(
                  width: 20,
                ),
                   Image.asset(
                        'assets/pp.jpg',
                        height: 60,
                        width: 60,
                      ),
              
                SizedBox(
                  width: 20,
                ),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text('Guest'),
                  Text('guest@contact'),
                ] //column children
                    )
              ] //row children
                  ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width:320,
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: obtainedName),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'please enter name';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width:320,
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: obtainedEmail),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'please enter email';
                    }
                    if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                      return "Please enter a valid email address";
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width:320,
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: obtainedNumber),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'please enter number';
                    }
                    if (!RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)').hasMatch(value)) {
                      return "Please enter a valid phone number";
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width:320,
                child: TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: obtainedPassword),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'please enter password';
                    }
                    if (!RegExp(
                            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                        .hasMatch(value)) {
                      return "Please enter a valid password";
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 320,
                child: TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: 'confirm password'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'please re-enter password';
                    }
                    if (value != passwordController.text) {
                      return 'passwords do not match';
                    }

                    return null;
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () async {
                  /* final SharedPreferences prefs= await SharedPreferences.getInstance();
               prefs.setString('name', nameController.text);
              // prefs.setInstance('name', ((nameController != null) ? nameController : ""));
*/
               Navigator.pushNamed(context,'profile');

                },
                child: const Text('submit'),
              ),
            ]),
          ]),
        ),
      ),
    );
  }
}
