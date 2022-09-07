import 'package:flutter/material.dart';
import 'package:mahjoub_company/get/cities_getx_controller.dart';
import 'package:mahjoub_company/utils/helpers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mahjoub_company/models/city.dart';
import 'package:mahjoub_company/widgets/custom_text_field.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late TextEditingController _nameController;
  late TextEditingController _passwordController;
  bool obscure = true;
  String? _gender;
  int? selectedItem;
  List<City> cities = CitiesGetxController.to.citiesItem.value;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.localizations.edit_profile,
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
                  context.localizations.edit_your_profile,
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
                textEditingController: _nameController,
                hintText: context.localizations.user_name,
                keyboardType: TextInputType.text,
                prefixIcon: Icons.person_outlined,
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
                      title:
                          Text('Male', style: GoogleFonts.cairo(fontSize: 18.sp)),
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
                hint:  Text(context.localizations.city),
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
                  context.localizations.edit_your_data,
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
