import 'package:flutter/material.dart';

import 'constants/appcolors.dart';
import 'musicplay.dart';
import 'widgets/app_text 2.dart';

class sp2 extends StatefulWidget {
  const sp2({super.key});

  @override
  State<sp2> createState() => _sp2State();
}

class _sp2State extends State<sp2> {
   void initState() {
    super.initState();
    Future.delayed(
        const Duration(seconds: 5),
        () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NowPlayingScreen()),
            )
            );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: SizedBox(
         
          child: AppText(text:"Ai is Generating your Song!",
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w600,
          ),
        ),
        ),
        
      
    );
  }
}

