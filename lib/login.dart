// ignore_for_file: prefer_const_constructors, camel_case_types

import 'package:adaola/1.dart';
import 'package:adaola/sign%20up.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants/appcolors.dart';
import 'widgets/app_button.dart';
import 'widgets/app_field.dart';
import 'widgets/app_text 2.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          // leading: IconButton(
          //     onPressed: () {},
          //     icon: Icon(
          //       Icons.arrow_back_ios_new_outlined,
          //       color: Colors.black,
          //     )),
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text("Sign in",
              style: GoogleFonts.poppins(
                textStyle: Theme.of(context).textTheme.displayMedium,
                fontSize: 18,
                color: Colors.black,
              ))),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 30, left: 20),
              child: Text(
                "Hi There! 👋",
                style: GoogleFonts.poppins(
                  textStyle: Theme.of(context).textTheme.displayMedium,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 100,
            ),
            Padding(
              padding: EdgeInsets.only(top: 0, left: 20, right: 20),
              child: Text(
                "Welcome back, Sign in to your account",
                style: GoogleFonts.poppins(
                  textStyle: Theme.of(context).textTheme.displaySmall,
                  fontSize: 16,
                  color: Colors.black,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 30,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: AppField(
                hintText: "Email",
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: AppField(
                hintText: "Password",
                suffixIcon: Icon(Icons.visibility_off_outlined),
              ),
            ),
           SizedBox(
              height: MediaQuery.of(context).size.height / 100,
            ),
          
           SizedBox(
              height: 50,
            ),
            Center(
              child: AppButton(
                btnText: "Log In",
                ontap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => first())));
                },
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 70,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don’t have an account?",
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width / 26,
                    fontFamily: "SF Pro Display",
                    color: Colors.black,
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                TextButton(
                  child: Text(
                    "Signup",
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 26,
                      fontFamily: "SF Pro Display",
                      color: AppColors.seccolor,
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: ((context) => signnup())));
                  },
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 70,
            ),
            Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Divider(
                  color: Colors.black,
                  thickness: 1,
                  endIndent: 10, // Thoda gap text ke pehle
                ),
              ),
              AppText(text: "OR"),
              Expanded(
                child: Divider(
                  color: Colors.black,
                  thickness: 1,
                  indent: 10, // Thoda gap text ke baad
                ),
              ),
            ],
          ),
        ),
         SizedBox(
              height: MediaQuery.of(context).size.height / 20,
            ),
        Row(
          mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width/8,
              child:InkWell(
                onTap: (){},
                child:  Image.asset("assets/f1.png"),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width/8,
              child: InkWell(
                onTap: (){},
                child:  Image.asset("assets/g1.png"),
              ),
            ),
             SizedBox(
              width: MediaQuery.of(context).size.width/9,
              child:InkWell(
                onTap: (){},
                child:  Image.asset("assets/a11.png"),
              ),
            ),
          ],
        ),
          ],
        ),
      ),
    );
  }
}
