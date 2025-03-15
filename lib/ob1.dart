import 'package:adaola/constants/appcolors.dart';
import 'package:adaola/widgets/app_text%202.dart';
import 'package:flutter/material.dart';

import 'widgets/app_button.dart';
import 'ob2.dart';

class ob1 extends StatefulWidget {
  const ob1({super.key});

  @override
  State<ob1> createState() => _ob1State();
}

class _ob1State extends State<ob1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
    body:  Scaffold(
        backgroundColor: AppColors.primaryColor,
    body: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(

      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height/20,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width/1.01,
          child: Image(image:AssetImage("assets/ob1.png") ),
        ),
        
      ],
    ),
    ),
    bottomSheet: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child:  SizedBox(
      height: MediaQuery.of(context).size.height/2.1,
       width: MediaQuery.of(context).size.width/1,
    child: Container(
     
      
      
      decoration: BoxDecoration(
    color: Colors.white, // Background color
    borderRadius: BorderRadius.circular(30), 
    
  ),
  child: Column(
    children: [
      SizedBox(
         height: MediaQuery.of(context).size.height/20,
      ),
      Padding(padding: EdgeInsets.only(left: 15, right: 15),
      child: AppText(text: "From the latest to the greatest hits, play your favorite tracks on Adaola now!",
      fontSize: 18,
fontWeight: FontWeight.w600,
      color: Colors.black,
      textAlign: TextAlign.center,
      ),

      ),
 SizedBox(
         height: MediaQuery.of(context).size.height/20,
      ),
SizedBox(
  width: MediaQuery.of(context).size.width/4,
  child: Image(image: AssetImage("assets/indi1.png")),
),
SizedBox(
         height: MediaQuery.of(context).size.height/20,
      ),
       Center(
              child: AppButton(
                btnText: "Continue",
                ontap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => ob2())));
                },
              ),
            ),
    ],
  ),
    ),
    ),
    )
    ));
  }
}