import 'package:flutter/material.dart';
import 'package:mahjoub_company/utils/helpers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mahjoub_company/models/city.dart';
import 'package:mahjoub_company/widgets/custom_text_field.dart';

class EditPasswordScreen extends StatefulWidget {
  const EditPasswordScreen({Key? key}) : super(key: key);

  @override
  State<EditPasswordScreen> createState() => _EditPasswordScreenState();
}

class _EditPasswordScreenState extends State<EditPasswordScreen> {
  late TextEditingController _passwordController;
  late TextEditingController _verifyPasswordController;
  bool _obscure = true;

  @override
  void initState() {
    super.initState();
    _passwordController = TextEditingController();
    _verifyPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _verifyPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.localizations.edit_password,
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
                  context.localizations.edit_password,
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
                textEditingController: _passwordController,
                hintText: context.localizations.password,
                keyboardType: TextInputType.visiblePassword,
                prefixIcon: Icons.lock,
                obscure: _obscure,
                suffixIcon: IconButton(onPressed: (){
                  setState(() {
                    _obscure = !_obscure;
                  });
                }, icon: Icon(_obscure ? Icons.visibility : Icons.visibility_off)),
              ),
              SizedBox(height: 15.h),
              CustomTextField(
                textEditingController: _verifyPasswordController,
                hintText: context.localizations.password,
                keyboardType: TextInputType.visiblePassword,
                prefixIcon: Icons.lock,
                obscure: _obscure,
                suffixIcon: IconButton(onPressed: (){
                  setState(() {
                    _obscure = !_obscure;
                  });
                }, icon: Icon(_obscure ? Icons.visibility : Icons.visibility_off)),
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
                  Navigator.pop(context);
                },
                child: Text(
                  context.localizations.edit_password,
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
