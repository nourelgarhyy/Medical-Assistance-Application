import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MenuBar extends StatefulWidget {
  MenuBar({Key? key}) : super(key: key);

  @override
  _MenuBarState createState() => _MenuBarState();
}

class _MenuBarState extends State<MenuBar> {
  String? drawerName;

  void initState() {
    super.initState();
    getUserData();
  }

  Future getUserData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    drawerName = prefs.getString('username') ?? 'no name found';
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xff92C9D4),
            ),
            child: Text(
              '$drawerName',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30,
                //fontFamily: 'Poppins-Bold',
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text(
              'PROFILE',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            onTap: () {
              Navigator.pushNamed(
                context,
                'profile',
              );
            },
          ),
          // ListTile(
          //   leading: Icon(Icons.settings),
          //   title: Text(
          //     'SETTINGS',
          //     style: TextStyle(
          //       fontSize: 15,
          //     ),
          //   ),
          //   onTap: () {},
          // ),
          ListTile(
            leading: Icon(Icons.help),
            title: Text(
              'Q&A',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            onTap: () {
              Navigator.pushNamed(
                context,
                'help',
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text(
              'LOG OUT',
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            onTap: () async {
              // SharedPreferences preferences = await SharedPreferences.getInstance();
              // await preferences.clear();
              Navigator.pushNamed(context, 'signin');
            },
          ),
        ],
      ),
    );
  }
}
