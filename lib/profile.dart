// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import 'changepass.dart';
import 'editprofile.dart';
import 'login.dart';
import 'widgets/app_text 2.dart';

// import 'package:toggle_switch/toggle_switch.dart';


class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
         backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
        children: [
        SizedBox(
          height: MediaQuery.of(context).size.height/20, 
        ),
        Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.height/7,
          child: Image.asset("assets/pic.png"),
          ),
        ),
        Center(
          child: AppText(text: "Louis Rosenfeld",
          fontSize: 18, 
          fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(
          height: 10,
        ),
         Center(
          child: AppText(text: "louis@gmail.com",
        
          ),
        ),
        Padding(padding: EdgeInsets.only(left: 20, top: 20),
        child: Row(
          children: [
             AppText(text: "Account",
          fontSize: 16, 
          fontWeight: FontWeight.w600,
          ),
          ],
        ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height/50,
        ),
 Center(
  child:  SizedBox(
    width: MediaQuery.of(context).size.width/1.1, 
    child: InkWell(
      onTap: (){
         Navigator.push(context, MaterialPageRoute(builder: ((context) => editprofile())));
      },
      child: Image.asset("assets/edit.png"),
    ),
  ),
 ),
   SizedBox(
          height: MediaQuery.of(context).size.height/50,
        ),
 Center(
  child:  SizedBox(
    width: MediaQuery.of(context).size.width/1.1, 
    child: InkWell(
      onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: ((context) => changepass())));
      },
      child: Image.asset("assets/changepass.png"),
    ),
  ),
 ),
  SizedBox(
          height: MediaQuery.of(context).size.height/50,
        ),
 
 Center(
  child:  SizedBox(
    width: MediaQuery.of(context).size.width/1.1, 
    child: InkWell(
      onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: ((context) => login())));
      },
      child: Image.asset("assets/logout.png"),
    ),
  ),
 ),
 SizedBox(
  height: MediaQuery.of(context).size.height/10,
 ),
        ],
      ),
      )
    );
  }
}