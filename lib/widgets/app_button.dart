// ignore_for_file: use_super_parameters

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../constants/appcolors.dart';
import 'app_text.dart';

class AppButton extends StatelessWidget {
  final String btnText;
  final void Function() ontap;
  final bool isLoading;
  final double? width;

  const AppButton({
    Key? key,
    required this.btnText,
    this.isLoading = false,
    required this.ontap,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        width: MediaQuery.of(context).size.width / 1.1,
        height: MediaQuery.of(context).size.height / 14,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.primaryColor,
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 1),
              blurRadius: 3,
              color: Colors.grey,
            ),
          ],
        ),
        child: Center(
          child: isLoading
              ? const SpinKitThreeBounce(
                  size: 20,
                  color: Colors.white,
                )
              : AppText(
                  text: btnText,
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
        ),
      ),
    );
  }
}

// class RoundButton extends StatelessWidget {
//   double? width;
//   String text;
//   double? fontSize;
//   Color? textColor, buttonColor;
//   void Function()? onTap;
//   RoundButton({
//     Key? key,
//     this.width,
//     required this.text,
//     this.onTap,
//     this.fontSize,
//     this.textColor,
//     this.buttonColor,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onTap,
//       child: Container(
//         width: width,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(5),
//           border: Border.all(
//             color: AppColors.primaryColor,
//           ),
//           color: buttonColor ?? AppColors.primaryColor,
//         ),
//         child: Padding(
//           padding: const EdgeInsets.only(
//             left: 15,
//             right: 15,
//             top: 3,
//             bottom: 5,
//           ),
//           child: AppText(
//             text: text,
//             fontWeight: FontWeight.w700,
//             fontSize: fontSize ?? 12,
//             textcolor: textColor ?? Colors.white,
//           ),
//         ),
//       ),
//     );
//   }
// }
