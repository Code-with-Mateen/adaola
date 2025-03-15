import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppInputField extends StatelessWidget {
  final String hintText;
  final String? upperText;
  final bool obscureText;
  final TextEditingController? controller;
  final TextInputType? keyboardtype;
  final Widget? suffixIcon, prefixIcon;
  final void Function()? onTap, onpress;
  final EdgeInsetsGeometry contentPadding;
  final bool? enabled, readOnly;
  final double? width, height;
  final int? maxLines;
  final TextInputAction textInputAction;
  final int? maxLength;
  const AppInputField({
    Key? key,
    required this.hintText,
    this.controller,
    this.keyboardtype,
    this.obscureText = false,
    this.suffixIcon,
    this.contentPadding = const EdgeInsets.only(top: 15, left: 15),
    this.onTap,
    this.onpress,
    this.readOnly,
    this.enabled,
    this.width,
    this.prefixIcon,
    this.height,
    this.upperText,
    this.maxLines = 1,
    this.textInputAction = TextInputAction.next,
    this.maxLength,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 11,
          ),
          Container(
            width: width,
            height: height ?? 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: TextFormField(
              maxLength: maxLength,
              readOnly: readOnly ?? false,
              maxLines: maxLines,
              textInputAction: textInputAction,
              enabled: enabled,
              autofocus: false,
              obscureText: obscureText,
              keyboardType: keyboardtype,
              controller: controller,
              onTap: onpress,
              decoration: InputDecoration(
                prefixIcon: prefixIcon,
                prefixIconColor: const Color(0xff8E8D91),
                suffixIcon: suffixIcon,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                    color: const Color(0xff000000).withOpacity(0.15),
                    width: 2,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                    color: const Color(0xff000000).withOpacity(0.15),
                    width: 2.0,
                  ),
                ),
                hintText: hintText,
                contentPadding: contentPadding,
                hintStyle: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xff000000),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
