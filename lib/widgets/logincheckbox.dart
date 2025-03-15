// ignore_for_file: camel_case_types, prefer_const_constructors, unnecessary_this

import 'package:adaola/constants/appcolors.dart';
import 'package:flutter/material.dart';

class logincheckbox extends StatefulWidget {
  const logincheckbox({super.key});

  @override
  State<logincheckbox> createState() => _logincheckboxState();
}

class _logincheckboxState extends State<logincheckbox> {
  bool? valuefirst = false;
  bool? valuesecond = false;
  bool? valuethird = false;
  bool? valuefourth = false;
  bool? valuefifth = false;
  bool? valuesixth = false;
  bool? valueseventh = false;
  @override
  Widget build(BuildContext context) {
    return Column(
       children: [
         Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Checkbox(
              checkColor: Colors.white,
              activeColor: AppColors.primaryColor,
              value: this.valuefirst,
              onChanged: (newBool) {
                setState(() {
                  this.valuefirst = newBool;
                });
              },
            ),
            Text(
              "I Have Read and Accept the Terms and Conditions",
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width / 36,
                fontFamily: "SF Pro Display",
                color: Colors.black,
                overflow: TextOverflow.ellipsis,
                fontWeight: FontWeight.normal,
              ),
              textAlign: TextAlign.start,
            ),
          ],
        ),
        
        // Row(
        //   children: [
        //     TextButton(
        //       child: Text(
        //         "Forgot Password",
        //         style: TextStyle(
        //           fontSize: MediaQuery.of(context).size.width / 26,
        //           fontFamily: "SF Pro Display",
        //           color: Colors.white,
        //           overflow: TextOverflow.ellipsis,
        //           fontWeight: FontWeight.normal,
        //         ),
        //       ),
        //       onPressed: () {},
        //     ),
        //   ],
        // )
      ],
    )
       ],
    );
  }
}
