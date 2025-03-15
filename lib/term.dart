// ignore_for_file: prefer_const_constructors

import 'package:adaola/widgets/logincheckbox.dart';
import 'package:flutter/material.dart';

import 'final download.dart';
import 'widgets/app_button.dart';
import 'widgets/app_text 2.dart';

class term extends StatefulWidget {
  const term({super.key});

  @override
  State<term> createState() => _termState();
}

class _termState extends State<term> {
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
         title: Text("Terms and Condition"),
         centerTitle: true,
        
      ),
      body: SingleChildScrollView(
        child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height/20,
          ),
        Padding(padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
        child:   Center(
            child: AppText(text: "Lorem ipsum dolor sit amet consectetur. Ullamcorper sed feugiat sit non potenti. Sollicitudin bibendum elementum erat commodo ac in. Velit nec massa arcu faucibus. Libero euismod amet commodo quis. Sed auctor in fringilla faucibus. Lectus orci nisi magnis elit tellus vitae bibendum enim. Urna ipsum nisl venenatis rhoncus lacinia vel tempor. Aliquet nibh amet tortor orci lacus. Dolor tortor nisl urna penatibus massa ultricies non adipiscing sit. " ,
            textAlign: TextAlign.justify,
            ),
          ),
        ),
          SizedBox(
            height: MediaQuery.of(context).size.height/20,
          ),
        logincheckbox(),
         SizedBox(
              height: MediaQuery.of(context).size.height/20,
            ),
            Center(
              child: AppButton(
                btnText: "Go to Download",
                ontap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => finaldownload())));
                },
              ),
            ),

        ],
      ),
      )
    );
  }
}