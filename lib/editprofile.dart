import 'package:flutter/material.dart';

import 'usernev.dart';
import 'widgets/app_button.dart';
import 'widgets/app_field.dart';

class editprofile extends StatefulWidget {
  const editprofile({super.key});

  @override
  State<editprofile> createState() => _editprofileState();
}

class _editprofileState extends State<editprofile> {
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
         title: Text("Edit Profile"),
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
          
            hintText: "First Name",
            
          ),
         ),
          SizedBox(
            height: MediaQuery.of(context).size.height/50,
          ),
         SizedBox(
          width: MediaQuery.of(context).size.width/1.1,
          child:  AppField(
          
            hintText: "Last Name",
            
          ),
         ),
          SizedBox(
            height: MediaQuery.of(context).size.height/50,
          ),
         SizedBox(
          width: MediaQuery.of(context).size.width/1.1,
          child:  AppField(
          
            hintText: "Email",
            
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