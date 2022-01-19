import 'package:flutter/material.dart';

class Navigation extends StatefulWidget {
  Navigation({Key? key}) : super(key: key);

  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Color(0xff92C9D4),
      items: [
        BottomNavigationBarItem(
          icon: IconButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                'homepage',
              );
            },
            icon: Icon(Icons.home, size: 30, color: Colors.white),
          ),
          title: Text(
            'Home',
            style: TextStyle(color: Colors.white),
          ),
        ),
        BottomNavigationBarItem(
          icon: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, 'medicineList');
            },
            icon: Icon(
              Icons.medication,
              size: 30,
              color: Colors.white,
            ),
          ),
          title: Text(
            'Medication',
            style: TextStyle(color: Colors.white),
          ),
        ),
        BottomNavigationBarItem(
          icon: IconButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                'contacts',
              );
            },
            icon:
                Icon(Icons.contact_phone_sharp, size: 30, color: Colors.white),
          ),
          title: Text(
            'Contacts',
            style: TextStyle(color: Colors.white),
          ),
        ),
        /*BottomNavigationBarItem(
          icon: Icon(Icons.settings, size: 40, color: Colors.white),
          title: Text(
            'Settings',
            style: TextStyle(color: Colors.white),
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.help, size: 40, color: Colors.white),
          title: Text(
            'Help',
            style: TextStyle(color: Colors.white),
          ),
        ),*/
      ],
    );
  }
}
