import 'package:flutter/material.dart';
import 'package:mahjoub_company/utils/helpers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mahjoub_company/widgets/custom_text_field.dart';

class EditMobileScreen extends StatefulWidget {
  const EditMobileScreen({Key? key}) : super(key: key);

  @override
  State<EditMobileScreen> createState() => _EditMobileScreenState();
}

class _EditMobileScreenState extends State<EditMobileScreen> {
  late TextEditingController _mobileController;
  late TextEditingController _verifyMobileController;

  @override
  void initState() {
    super.initState();
    _mobileController = TextEditingController();
    _verifyMobileController = TextEditingController();
  }

  @override
  void dispose() {
    _mobileController.dispose();
    _verifyMobileController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.localizations.edit_mobile,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 30.h),
              Align(
                alignment: AlignmentDirectional.topStart,
                child: Text(
                  context.localizations.edit_mobile,
                  style: GoogleFonts.cairo(
                    fontSize: 20.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional.topStart,
                child: Text(
                  context.localizations.edit_your_data,
                  style: GoogleFonts.cairo(
                    fontSize: 16.sp,
                    color: Colors.black45,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 40.h),
              CustomTextField(
                textEditingController: _mobileController,
                hintText: context.localizations.mobile,
                keyboardType: TextInputType.phone,
                prefixIcon: Icons.phone_android_outlined,
              ),
              SizedBox(height: 15.h),
              CustomTextField(
                textEditingController: _verifyMobileController,
                hintText: context.localizations.verification,
                keyboardType: TextInputType.phone,
                prefixIcon: Icons.phone_android_outlined,
              ),
              SizedBox(height: 80.h),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50.h),
                  primary: Colors.grey.shade800,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/verification_screen');
                },
                child: Text(
                  context.localizations.edit_mobile,
                  style: GoogleFonts.cairo(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
