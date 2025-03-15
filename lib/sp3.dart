
import 'package:adaola/usernev.dart';
import 'package:flutter/material.dart';

import 'constants/appcolors.dart';
import 'widgets/app_text 2.dart';

class sp3 extends StatefulWidget {
  const sp3({super.key});

  @override
  State<sp3> createState() => _sp3State();
}

class _sp3State extends State<sp3> {
   void initState() {
    super.initState();
    Future.delayed(
        const Duration(seconds: 5),
        () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => usernev()),
            )
            );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: AppColors.primaryColor,
      body: Center(
        child: SizedBox(
         
          child: AppText(text:"Your Song is uploading. ",
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w600,
          ),
        ),
        ),
        
      
    );
  }
}