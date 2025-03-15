import 'package:flutter/material.dart';

import 'widgets/app_text 2.dart';

class privacy extends StatefulWidget {
  const privacy({super.key});

  @override
  State<privacy> createState() => _privacyState();
}

class _privacyState extends State<privacy> {
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
         title: Text("Privacy Policy"),
         centerTitle: true,
        
      ),
         body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height/50,
          ),
        Padding(padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
        child:   Center(
            child: AppText(text: "Lorem ipsum dolor sit amet consectetur. Ullamcorper sed feugiat sit non potenti. Sollicitudin bibendum elementum erat commodo ac in. Velit nec massa arcu faucibus. Libero euismod amet commodo quis. Sed auctor in fringilla faucibus. Lectus orci nisi magnis elit tellus vitae bibendum enim. Urna ipsum nisl venenatis rhoncus lacinia vel tempor. Aliquet nibh amet tortor orci lacus. Dolor tortor nisl urna penatibus massa ultricies non adipiscing sit. " ,
            textAlign: TextAlign.justify,
            ),
          ),
        ),

        ],
      ),
    );
  }
}