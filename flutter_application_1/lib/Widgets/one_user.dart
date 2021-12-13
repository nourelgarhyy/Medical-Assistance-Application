import 'package:flutter/material.dart';
import 'package:health_care_app/Models/user.dart';

import 'package:provider/provider.dart';

class OneUser extends StatelessWidget {
  User user;
  OneUser(this.user);
  @override
  Widget build(BuildContext context) {
    
    return Container(
       width: 350,
              height: 500,
     
      child: Form(
                
                child: ListView(padding: const EdgeInsets.all(0), children: [
                  
     Column(
       
        mainAxisAlignment: MainAxisAlignment.center,

          children:[ 
            const SizedBox(
                height: 20,
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                 Image.asset('assets/pp.jpg',height: 70,width: 70,),
                 const SizedBox(
                width: 20,
                  ),
                  Text(user.username),
                ],
              ),
            
            const SizedBox(
                height: 20,
              ),
          TextField(
            controller: TextEditingController()..text = user.name,
            readOnly: true,
            decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                                    width: 3, color: Colors.blueGrey),
                                borderRadius: BorderRadius.circular(15),
                      )),
          ),
          const SizedBox(
                height: 20,
              ),
          TextField(
            controller: TextEditingController()..text = user.mail,
             readOnly: true,
            decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                                    width: 3, color: Colors.blueGrey),
                                borderRadius: BorderRadius.circular(15),
                      )),
          ),
          const SizedBox(
                height: 20,
              ),
          TextField(
            controller: TextEditingController()..text = user.phone,
             readOnly: true,
            decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                                    width: 3, color: Colors.blueGrey),
                        borderRadius: BorderRadius.circular(15),
                      )),
          ),
        
          ]),
                ]),
      )
    );
  }
}
