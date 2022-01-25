import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:health_care_app/Screens/emergency_contacts.dart';
import 'package:health_care_app/Screens/homepage.dart';
import 'package:health_care_app/Screens/medicine_list.dart';

class Navigation extends StatefulWidget {
  Navigation({Key? key}) : super(key: key);

  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  final Screens=[
    Home(),
    MedicineList(),
    Contacts(),
    
  ];
  
  @override
  Widget build(BuildContext context) {
    return
     CurvedNavigationBar(
      
          key: _bottomNavigationKey,
          index: 0,
          height: 60.0,
        

          items: <Widget>[
             IconButton(
              onPressed: () {
              Navigator.pushNamed(
                context,
                'homepage',
              );
            },
              icon: Icon(Icons.home, size: 30, color: Color(0xff053F5E)),
              
              ),

               IconButton(
              onPressed: () {
              Navigator.pushNamed(
                context,
                'medicineList',
              );
            },
              icon: Icon(Icons.medication, size: 30, color: Color(0xff053F5E)),
              
              ),
               IconButton(
              onPressed: () {
              Navigator.pushNamed(
                context,
                'map',
              );
            },
              icon: Icon(Icons.map, size: 30, color: Color(0xff053F5E)),
              
              ),
               IconButton(
              onPressed: () {
              Navigator.pushNamed(
                context,
                'contacts',
              );
            },
              icon: Icon(Icons.contact_phone_sharp, size: 30, color: Color(0xff053F5E)),
              
              ),

            //  Icon(Icons.home, size: 30),
            //  Icon(Icons.medication, size: 30),
            //  Icon(Icons.contact_phone_sharp, size: 30),
            
           
            // Icon(Icons.list, size: 30),
            // Icon(Icons.compare_arrows, size: 30),
            // Icon(Icons.call_split, size: 30),
            // Icon(Icons.perm_identity, size: 30),
          ],
          color: Colors.white,
          buttonBackgroundColor: Colors.white,
          backgroundColor: Color(0xff053F5E),
          // animationCurve: Curves.easeInOut,
          // animationDuration: Duration(milliseconds: 300),
          // onTap: (index) {
          //   setState(() {
          //     _page = index;
          //     print(_page);
          //   });
          // },
          //letIndexChange: (index) => true,
        );
        //return Screens[_page];
  }

}

