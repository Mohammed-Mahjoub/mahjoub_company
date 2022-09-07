import 'package:flutter/material.dart';
import 'package:mahjoub_company/api/auth_api_controller.dart';
import 'package:mahjoub_company/get/cities_getx_controller.dart';
import 'package:mahjoub_company/models/api_register_response.dart';
import 'package:mahjoub_company/models/store.dart';
import 'package:mahjoub_company/screens/auth/verification_screen.dart';
import 'package:mahjoub_company/utils/helpers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mahjoub_company/models/city.dart';
import 'package:mahjoub_company/widgets/custom_text_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late TextEditingController _nameController;
  late TextEditingController _mobileController;
  late TextEditingController _passwordController;
  bool obscure = true;
  String? _gender;
  int? selectedItem;
  String? code;
  List<City> cities = CitiesGetxController.to.citiesItem.value;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _mobileController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _mobileController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade800,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          context.localizations.sign_up,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.grey.shade800,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 20.h),
                child: Column(children: [Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Text(
                    context.localizations.create_account,
                    style: GoogleFonts.cairo(
                      fontSize: 20.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                  Align(
                    alignment: AlignmentDirectional.topStart,
                    child: Text(
                      context.localizations.enter_data,
                      style: GoogleFonts.cairo(
                        fontSize: 16.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),],),
              ),
            ),
            SizedBox(height: 40.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Column(
                children: [
                  SizedBox(height: 40.h),
                  CustomTextField(
                    textEditingController: _nameController,
                    hintText: context.localizations.user_name,
                    keyboardType: TextInputType.text,
                    prefixIcon: Icons.person_outlined,
                  ),
                  SizedBox(height: 15.h),
                  CustomTextField(
                    textEditingController: _mobileController,
                    hintText: context.localizations.mobile,
                    keyboardType: TextInputType.phone,
                    prefixIcon: Icons.phone_android_outlined,
                  ),
                  SizedBox(height: 15.h),
                  CustomTextField(
                    textEditingController: _passwordController,
                    hintText: context.localizations.password,
                    keyboardType: TextInputType.visiblePassword,
                    prefixIcon: Icons.lock,
                    obscure: obscure,
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() => obscure = !obscure);
                      },
                      icon: Icon(obscure ? Icons.visibility : Icons.visibility_off),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      Expanded(
                        child: RadioListTile<String>(
                          value: 'M',
                          groupValue: _gender,
                          onChanged: (String? value) {
                            setState(() {
                              _gender = value;
                            });
                          },
                          title: Text('Male',
                              style: GoogleFonts.cairo(fontSize: 18.sp)),
                        ),
                      ),
                      Expanded(
                        child: RadioListTile<String>(
                          value: 'F',
                          groupValue: _gender,
                          onChanged: (String? value) {
                            setState(() {
                              _gender = value;
                            });
                          },
                          title: Text('Female',
                              style: GoogleFonts.cairo(fontSize: 18.sp)),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  DropdownButton<int>(
                    isExpanded: true,
                    hint: Text(context.localizations.city),
                    style: const TextStyle(color: Colors.black),
                    items: cities.map((city) {
                      return DropdownMenuItem<int>(
                        value: city.id,
                        child: Text(city.nameEn),
                      );
                    }).toList(),
                    onChanged: (int? value) {
                      setState(() {
                        selectedItem = value;
                      });
                    },
                    icon: const Icon(Icons.keyboard_arrow_down_sharp),
                    value: selectedItem,
                  ),
                  SizedBox(height: 40.h),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50.h),
                      primary: Colors.grey.shade800,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    onPressed: () {
                      performRegister();
                    },
                    child: Text(
                      context.localizations.register,
                      style: GoogleFonts.cairo(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future performRegister() async {
    if (checkData()) {
      await register();
    }
  }

  bool checkData() {
    if (_nameController.text.isNotEmpty &&
        _mobileController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty &&
        _gender != null &&
        selectedItem != null) {
      return true;
    }
    context.showSnackBar(message: 'Enter Required Data!!!', error: true);
    return false;
  }

  Future<void> register() async {
    ApiRegisterResponse apiRegisterResponse =
        await AuthApiController().register(
      name: _nameController.text,
      mobileNumber: _mobileController.text,
      password: _passwordController.text,
      gender: _gender!,
      cityId: selectedItem.toString(),
      storeApiKey: Store().storeApiKey,
    );
    if (apiRegisterResponse.success) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VerificationScreen(
                mobileNumber: _mobileController.text,
                code: apiRegisterResponse.code),
          ));
    }
    context.showSnackBar(
      message: apiRegisterResponse.message,
      error: !apiRegisterResponse.success,
    );
  }
}
