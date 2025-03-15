import 'package:flutter/material.dart';

import 'usernev.dart';
import 'widgets/app_button.dart';
import 'widgets/app_field.dart';

class changepass extends StatefulWidget {
  const changepass({super.key});

  @override
  State<changepass> createState() => _changepassState();
}

class _changepassState extends State<changepass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        },
         icon: Icon(Icons.arrow_back_ios_new_outlined),
         color: Colors.black,
         ),
         title: Text("Change Password"),
         centerTitle: true,
        
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
          children: [
              SizedBox(
            height: MediaQuery.of(context).size.height/20,
          ),
         
         
         SizedBox(
          width: MediaQuery.of(context).size.width/1.1,
          child:  AppField(
          
            hintText: "Old Password",
            
          ),
         ),
          SizedBox(
            height: MediaQuery.of(context).size.height/50,
          ),
         SizedBox(
          width: MediaQuery.of(context).size.width/1.1,
          child:  AppField(
          
            hintText: "New Password",
            
          ),
         ),
          SizedBox(
            height: MediaQuery.of(context).size.height/50,
          ),
         SizedBox(
          width: MediaQuery.of(context).size.width/1.1,
          child:  AppField(
          
            hintText: "Confirm Password",
            
          ),
         ),
           SizedBox(
            height: MediaQuery.of(context).size.height/10,
          ),
           AppButton(btnText: "Save", ontap: (){

              Navigator.push(context, MaterialPageRoute(builder: ((context) => usernev())));
            }),
          ],
        ),
        )
        ),
    
    );
  }
}