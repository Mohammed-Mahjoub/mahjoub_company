import 'package:flutter/material.dart';
import 'package:mahjoub_company/api/addresses_api_controller.dart';
import 'package:mahjoub_company/get/cities_getx_controller.dart';
import 'package:mahjoub_company/models/api_response.dart';
import 'package:mahjoub_company/utils/helpers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mahjoub_company/models/city.dart';
import 'package:mahjoub_company/widgets/custom_text_field.dart';

class NewAddressScreen extends StatefulWidget {
  const NewAddressScreen({Key? key}) : super(key: key);

  @override
  State<NewAddressScreen> createState() => _NewAddressScreenState();
}

class _NewAddressScreenState extends State<NewAddressScreen> {
  late TextEditingController _addressNameController;
  late TextEditingController _addressInfoController;
  late TextEditingController _addressContactNumberController;
  int? selectedItem;
  List<City> cities = CitiesGetxController.to.citiesItem.value;

  @override
  void initState() {
    super.initState();
    _addressNameController = TextEditingController();
    _addressInfoController = TextEditingController();
    _addressContactNumberController = TextEditingController();
  }

  @override
  void dispose() {
    _addressNameController.dispose();
    _addressInfoController.dispose();
    _addressContactNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.localizations.new_address),
        leading: IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/addresses_screen');
            },
            icon: const Icon(Icons.arrow_back)),
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
                  context.localizations.add_new_address,
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
                  context.localizations.enter_data,
                  style: GoogleFonts.cairo(
                    fontSize: 16.sp,
                    color: Colors.black45,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 40.h),
              CustomTextField(
                textEditingController: _addressNameController,
                hintText: context.localizations.user_name,
                keyboardType: TextInputType.text,
                prefixIcon: Icons.person,
              ),
              SizedBox(height: 15.h),
              CustomTextField(
                textEditingController: _addressInfoController,
                hintText: 'Info',
                keyboardType: TextInputType.text,
                prefixIcon: Icons.location_on,
              ),
              SizedBox(height: 15.h),
              CustomTextField(
                textEditingController: _addressContactNumberController,
                hintText: context.localizations.mobile,
                keyboardType: TextInputType.number,
                prefixIcon: Icons.phone_android_outlined,
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
                  performCreate();
                },
                child: Text(
                  context.localizations.add_new_address,
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
      ),
    );
  }

  Future performCreate() async {
    if (checkData()) {
      await create();
      Navigator.pushReplacementNamed(context, '/addresses_screen');
    }
  }

  bool checkData() {
    if (_addressNameController.text.isNotEmpty &&
        _addressInfoController.text.isNotEmpty &&
        _addressContactNumberController.text.isNotEmpty &&
        selectedItem != null) {
      return true;
    }
    context.showSnackBar(message: 'Enter Required Data!!!', error: true);
    return false;
  }

  Future<void> create() async {
    ApiResponse apiResponse = await AddressesApiController().createAddress(
      name: _addressNameController.text,
      info: _addressInfoController.text,
      mobileNumber: _addressContactNumberController.text,
      cityId: selectedItem!.toString(),
    );
    context.showSnackBar(
      message: apiResponse.message,
      error: !apiResponse.success,
    );
  }
}
