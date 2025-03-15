// ignore_for_file: unnecessary_this, camel_case_types, use_key_in_widget_constructors, library_private_types_in_public_api, prefer_const_constructors

import 'package:flutter/material.dart';

class checkbox extends StatefulWidget {
  @override
  _checkboxState createState() => _checkboxState();
}

class _checkboxState extends State<checkbox> {
  bool? valuefirst = false;
  bool? valuesecond = false;
  bool? valuethird = false;
  bool? valuefourth = false;
  bool? valuefifth = false;
  bool? valuesixth = false;
  bool? valueseventh = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          checkColor: Colors.white,
          activeColor: Color(0xffFF385C),
          value: this.valuefirst,
          onChanged: (newBool) {
            setState(() {
              this.valuefirst = newBool;
            });
          },
        ),
        Text(
          "Do you agree with our ",
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.width / 26,
            fontFamily: "SF Pro Display",
            color: Colors.black,
            overflow: TextOverflow.ellipsis,
            fontWeight: FontWeight.normal,
          ),
          textAlign: TextAlign.start,
        ),
        Text(
          "Terms and Condition",
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.width / 26,
            fontFamily: "SF Pro Display",
            color: Colors.black,
            overflow: TextOverflow.ellipsis,
            decoration: TextDecoration.underline,
            fontWeight: FontWeight.normal,
          ),
          textAlign: TextAlign.start,
        ),
      ],
    );
  }
}
