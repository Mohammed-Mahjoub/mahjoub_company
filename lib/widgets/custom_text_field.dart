import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({Key? key,
    required this.textEditingController,
    required this.hintText,
    required this.keyboardType,
    required this.prefixIcon,
    this.obscure = false,
    this.suffixIcon,
  })
      : super(key: key);

  final TextEditingController textEditingController;
  final String hintText;
  final TextInputType keyboardType;
  final IconData prefixIcon;
  final bool obscure;
  final IconButton? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscure,
      controller: textEditingController,
      keyboardType: keyboardType,
      style: GoogleFonts.cairo(),
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        contentPadding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 0.h),
        constraints: const BoxConstraints(
          maxHeight: 50,
          minHeight: 50,
        ),
        prefixIcon: Icon(
          prefixIcon,
          color: Colors.grey.shade700,
        ),
        hintText: hintText,
        hintStyle: GoogleFonts.cairo(),
        helperStyle: GoogleFonts.cairo(fontSize: 13),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey.shade600),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey.shade600),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey.shade600),
        ),
      ),
    );
  }
}
