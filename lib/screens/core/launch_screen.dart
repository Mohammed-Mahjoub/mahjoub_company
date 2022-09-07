import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahjoub_company/api/cities_api_controller.dart';
import 'package:mahjoub_company/get/cart_getx_controller.dart';
import 'package:mahjoub_company/get/cities_getx_controller.dart';
import 'package:mahjoub_company/models/city.dart';
import 'package:mahjoub_company/prefs/shared_pref_controller.dart';
import 'package:mahjoub_company/utils/helpers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override
  void initState() {
    super.initState();
    if (SharedPrefController().getValueFor(key: PrefKeys.id.name)!=null) {
      CartGetxController cartGetxController = Get.put<CartGetxController>(CartGetxController());
    }
    CitiesGetxController citiesGetxController =
    Get.put<CitiesGetxController>(CitiesGetxController());

    Future.delayed(
      const Duration(seconds: 3),
          () {
        bool loggedIn = SharedPrefController()
            .getValueFor<bool>(key: PrefKeys.loggedIn.name) ??
            false;
        String route = loggedIn ? '/bn_screen' : '/on_boarding_screen';
        Navigator.pushReplacementNamed(context, route);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<City>>(
      future: CitiesApiController().getCities(),
      builder: (context, snapshot) {
        return Scaffold(
          /*
      * to of resize background photo
      * resizeToAvoidBottomInset: false,
      * */
          body: Stack(
            children: [
              const SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: Image(
                  image: AssetImage('images/launch.png'),
                  fit: BoxFit.cover,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Divider(color: Colors.transparent),
                  Image(
                      image: const AssetImage('images/logo.png'),
                      height: 250.h),
                  Text(
                    context.localizations.launch_screen_title,
                    style: GoogleFonts.cairo(
                      color: Colors.black,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
