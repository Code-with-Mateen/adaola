import 'package:flutter/material.dart';

import '1.dart';
import 'constants/appcolors.dart';
import 'login.dart';
import 'widgets/app_button.dart';
import 'widgets/app_text 2.dart';

class signnup extends StatefulWidget {
  const signnup({super.key});

  @override
  State<signnup> createState() => _signnupState();
}

class _signnupState extends State<signnup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
        children: [
         SizedBox(
         height: MediaQuery.of(context).size.height/10,
      ),
           Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width/3,
          child: Image(image: AssetImage("assets/logom3.png"),
        ),
        ),
      ),
       SizedBox(
         height: MediaQuery.of(context).size.height/10,
      ),
      Padding(padding: EdgeInsets.only(left: 0, right: 0),
      child: AppText(text: "Let’s get you in",
      fontSize: 18,
fontWeight: FontWeight.w600,
      color: Colors.black,
      textAlign: TextAlign.center,
      ),
      ),
       SizedBox(
         height: MediaQuery.of(context).size.height/20,
      ),
       Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width/1.2,
          child:InkWell(
            onTap: (){},
            child:  Image(image: AssetImage("assets/fb.png"),
          ),
        ),
        ),
      ),
       SizedBox(
         height: MediaQuery.of(context).size.height/50,
      ),
       Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width/1.2,
          child:InkWell(
            onTap: (){},
            child:  Image(image: AssetImage("assets/google.png"),
          ),
        ),
        ),
      ),
       SizedBox(
         height: MediaQuery.of(context).size.height/50,
      ),
       Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width/1.2,
          child:InkWell(
            onTap: (){},
            child:  Image(image: AssetImage("assets/apple.png"),
          ),
        ),
        ),
      ),
       SizedBox(
         height: MediaQuery.of(context).size.height/30,
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
              height: MediaQuery.of(context).size.height/30,
            ),
            Center(
              child: AppButton(
                btnText: "Get Started",
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
                  "Already have an account?",
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
                    "Login",
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 26,
                      fontFamily: "SF Pro Display",
                      color: AppColors.primaryColor,
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: ((context) => login())));
                
                
                  }
                ),
        ],
      ),
    ]),
      )
      
      );
  }
}