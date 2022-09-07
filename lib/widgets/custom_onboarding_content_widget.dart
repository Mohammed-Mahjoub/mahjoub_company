import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomOnBoardingContent extends StatefulWidget {
 final String image;
 final String title;
 final String subTitle;

  const CustomOnBoardingContent({
    Key? key,
    required this.image,
    required this.title,
    required this.subTitle,
  }) : super(key: key);

  @override
  State<CustomOnBoardingContent> createState() =>
      _CustomOnBoardingContentState();
}

class _CustomOnBoardingContentState extends State<CustomOnBoardingContent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(
            height: 450.h,
            width: double.infinity,
            image: AssetImage(widget.image),
          ),
          SizedBox(height: 20.h),
          Text(
            widget.title,
            style: GoogleFonts.cairo(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5.h),
          Text(
            widget.subTitle,
            style: GoogleFonts.cairo(
              fontSize: 15.sp,
            ),
          ),
        ],
      ),
    );
  }
}
