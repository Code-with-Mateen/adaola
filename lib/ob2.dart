import 'package:adaola/sign%20up.dart';
import 'package:flutter/material.dart';

import 'constants/appcolors.dart';
import 'widgets/app_button.dart';
import 'widgets/app_text 2.dart';

class ob2 extends StatefulWidget {
  const ob2({super.key});

  @override
  State<ob2> createState() => _ob2State();
}

class _ob2State extends State<ob2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          child: Image(image:AssetImage("assets/ob2.png") ),
        ),
        
      ],
    ),
    ),
    bottomSheet: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child:  SizedBox(
      height: MediaQuery.of(context).size.height/2.1,
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
      child: AppText(text: "From trending hits to hidden gems, dive into our vast library of songs, and albums.",
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
  child: Image(image: AssetImage("assets/indi2.png")),
),
SizedBox(
         height: MediaQuery.of(context).size.height/20,
      ),
       Center(
              child: AppButton(
                btnText: "Get Started",
                ontap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => signnup())));
                },
              ),
            ),
    ],
  ),
    ),
    ),
    )
    );
  }
}