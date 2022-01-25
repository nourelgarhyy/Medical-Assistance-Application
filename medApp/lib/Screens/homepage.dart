import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:health_care_app/Screens/add_prescription.dart';
import 'package:health_care_app/Screens/medicine_list.dart';
import 'package:health_care_app/Screens/sign_in.dart';
import 'package:health_care_app/Widgets/add_reminder_widget.dart';
import 'package:health_care_app/Widgets/menu_bar.dart';
import 'package:health_care_app/Widgets/navigation_bar.dart';
import 'package:health_care_app/services/authentication_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import '../Models/reminder.dart';
import '../Providers/reminders_provider.dart';
import 'package:health_care_app/Widgets/add_reminder_widget.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  get nav => Navigation();
  get menuBar => MenuBar();
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

  final uid=AuthService().currentUser?.uid;
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('userMeds')
.doc(AuthService().currentUser?.uid)
.collection('meds').snapshots();


//  final Screens=[
//     Home(),
//     MedicineList(),
//     Contacts(),
    
//   ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      backgroundColor: Color(0xff053F5E),
      appBar: AppBar(
        centerTitle: true,
        title: Text('Welcome, $drawerName'),
   
        elevation: 0.0,
        backgroundColor: Color(0xff053F5E),
        
        // leading: Icon(
        //   Icons.menu,
        //   color: Colors.white,
        // ),
        // actions: [
        //   GestureDetector(
        //     child: Container(
        //       margin: EdgeInsets.only(right: 10),
        //       child: Icon(
        //         Icons.notifications_rounded,
        //         color: Colors.white,
        //       ),
        //     ),
        //   ),
          
        // ],

        
      ),

      bottomNavigationBar: nav, //Navigation Bar
      drawer: menuBar,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        
        child: Consumer<RemindersProvider>(
          builder: (context, RemindersProvider data, child) {
            var size;
            double width = MediaQuery.of(context).size.width;
            return  Container(

        decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30), topLeft: Radius.circular(30))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 20, left: 20),
              child: Text(
                "Hi!",
                style: TextStyle(
                  color: Color(0xff363636),
                  fontSize: 25,
                  fontFamily: 'Roboto',
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5, left: 20),
              child: Text(
                "Welcome Back",
                style: TextStyle(
                  color: Color(0xff363636),
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto',
                ),
              ),
            ),
           
            Container(
              width: 100,
              margin: EdgeInsets.only(top: 20, left: 20),
              child: Stack(
                fit: StackFit.loose,
                children: [
                  Container(
                    child: Text(
                      'Category',
                      style: TextStyle(
                        color: Color(0xff363636),
                        fontSize: 20,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                 
                ],
              ),
            ),
            Container(
              height: 120,
              margin: EdgeInsets.only(top: 20, left: 20),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  demoCategories("assets/tooth.png", "Medication",""),
                  demoCategories("assets/brain.png", "Appointments",""),
                  //demoCategories("assets/heart.png", "Heart", "17 Doctors"),
                  //demoCategories("assets/bone.png", "Bone", "24 Doctors"),
                ],
              ),
            ),
            Container(
              
              width: 100,
              margin: EdgeInsets.only(top: 20, left: 20),
              child: Stack(
                fit: StackFit.loose,
                children: [
                  Container(
                    child: Text(
                      'Upcoming',
                      style: TextStyle(
                        color: Color(0xff363636),
                        fontSize: 20,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child:StreamBuilder<QuerySnapshot>(
      stream: _usersStream,
      builder:(BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
      if(snapshot.hasError){
          return Text("sth went wrong ${snapshot.data}");
         }
         else if(snapshot.hasData){
          final meds=snapshot.data!;
          return Container(
              margin: EdgeInsets.only(left: 20, top: 10),
              child:
                  Container(
                    margin: EdgeInsets.only(top: 10),
            child: ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
              return ListTile(
                leading: const Icon(Icons.medication),
                title: Text("${data['name']} To be taken at ${data['time']}"),
                subtitle: Text("Start date: ${data['start_date']}  End date: ${data['start_date']} "),
                //trailing:  Icon(
                //product.isFavorite ? Icons.favorite : Icons.favorite_border,
             // ),
              );
            }).toList(),
            ),
          ));
        }
        else{
           return Center(child: CircularProgressIndicator());
         }
      } 
      ),
                
                
                 ),
            )
          ],
        ),
      
                      // child: Center(
                      //   child: Text('No Reminders Yet'),
                      // ),
                    //),
                  );
          },
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AddReminderDialog().addReminder(context);
        },
        backgroundColor: Colors.white,
        child: Icon(
          Icons.add,
          color: Colors.blue,
        ),
      ),
    );
  }


  Widget demoCategories(String img, String name, String drCount) {
        final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 10)
        );

    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width*0.25,
      margin: EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
        color: Color(0xff107163),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: Image.asset(img,height: 40),
          ),
          
          Container(
            margin: EdgeInsets.only(top: 10),
            padding: EdgeInsets.all(7),
            decoration: BoxDecoration(
              color: Color(0xffd9fffa).withOpacity(0.07),
              borderRadius: BorderRadius.circular(5),
            ),

         
            child:  
            
           SizedBox(
             height: 25,
             child: TextButton(
                 onPressed: () {
                     Navigator.pushNamed(context, 'meds');
                                  }, child: Text(
                name,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                ),
              ),
              
             
          ),
           ),
          ),
        ],
      ),
    );
  }



}
