import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mahjoub_company/utils/helpers.dart';

import '../get/adresses_getx_controller.dart';

class HomeSection extends StatefulWidget {
  const HomeSection({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  final String title;
  final void Function() onPressed;

  @override
  State<HomeSection> createState() => _HomeSectionState();
}

class _HomeSectionState extends State<HomeSection> {
  @override
  void initState() {
    AddressesGetxController addressesGetxController =
    Get.put<AddressesGetxController>(AddressesGetxController());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          widget.title,
          style: GoogleFonts.cairo(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
        TextButton(
          onPressed: widget.onPressed,
          child: Text(
            context.localizations.see_all,
            style: GoogleFonts.cairo(),
          ),
        )
      ],
    );
  }
}
