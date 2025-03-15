import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class AppText extends StatelessWidget {
  final String text;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final double? fontSize, lineHeight;
  final FontWeight? fontWeight;
  final Color? color;
  const AppText({
    Key? key,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.overflow,
    required this.text,
    this.textAlign,
    this.lineHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        fontSize: fontSize,
        height: lineHeight,
        fontWeight: fontWeight,
        color: color,
      ),
      textAlign: textAlign,
      overflow: overflow,
    );
  }
}
