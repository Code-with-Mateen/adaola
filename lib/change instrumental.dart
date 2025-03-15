import 'package:adaola/constants/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class instrumental extends StatefulWidget {
  const instrumental({super.key});

  @override
  State<instrumental> createState() => _instrumentalState();
}

class _instrumentalState extends State<instrumental> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new_outlined, color: Colors.black),
        ),
        centerTitle: true,
        title: Text(
          "Create Song",
          style: GoogleFonts.poppins(
            textStyle: Theme.of(context).textTheme.displayMedium,
            fontSize: 18,
            color: Colors.black,
          ),
        ),
        actions: [
          TextButton(onPressed: (){
            Navigator.pop(context);
          }, 
          child: Icon(Icons.save,
          color: AppColors.primaryColor,
          ),
          ),
        ],
      
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
             SizedBox(
        height: MediaQuery.of(context).size.height/30,
      ),
  Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      SizedBox(
        width: MediaQuery.of(context).size.width/2.5,
        child: InkWell(
          onTap: (){},
          child: Image.asset("assets/ad1.png"),
        ),
      ),
      SizedBox(
        width: MediaQuery.of(context).size.width/2.5,
        child: InkWell(
          onTap: (){},
          child: Image.asset("assets/ad2.png"),
        ),
      ),
    ],
  ),
   SizedBox(
        height: MediaQuery.of(context).size.height/50,
      ),
  Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      SizedBox(
        width: MediaQuery.of(context).size.width/2.5,
        child: InkWell(
          onTap: (){},
          child: Image.asset("assets/ad3.png"),
        ),
      ),
     
      SizedBox(
        width: MediaQuery.of(context).size.width/2.5,
        child: InkWell(
          onTap: (){},
          child: Image.asset("assets/ad4.png"),
        ),
      ),
    ],
  ),
  SizedBox(
      height: MediaQuery.of(context).size.height/30,
  ),
//   HighlightButton(
//   text: "Add Vocal ",
//   onTap: () {
//     print("Button Clicked!");
//   },
// ),
SizedBox(
      height: MediaQuery.of(context).size.height/30,
  ),
   
            
          ],
        ),
      ),
    );
  }
}