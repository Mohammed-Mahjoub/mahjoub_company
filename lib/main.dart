import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mahjoub_company/database/db_controller.dart';
import 'package:mahjoub_company/prefs/shared_pref_controller.dart';
import 'package:mahjoub_company/screens/app/about_us_screen.dart';
import 'package:mahjoub_company/screens/app/addresses_screen.dart';
import 'package:mahjoub_company/screens/app/favorite_screen.dart';
import 'package:mahjoub_company/screens/bn_screens/bottom_navigation_screen.dart';
import 'package:mahjoub_company/screens/app/edit_mobile_screen.dart';
import 'package:mahjoub_company/screens/app/edit_password_screen.dart';
import 'package:mahjoub_company/screens/app/edit_profile_screen.dart';
import 'package:mahjoub_company/screens/app/new_address_screen.dart';
import 'package:mahjoub_company/screens/app/notifications_screen.dart';
import 'package:mahjoub_company/screens/app/onboarding_screen.dart';
import 'package:mahjoub_company/screens/app/orders_screen.dart';
import 'package:mahjoub_company/screens/auth/forgot_password_screen.dart';
import 'package:mahjoub_company/screens/auth/reset_password_screen.dart';
import 'package:mahjoub_company/screens/auth/sign_in_screen.dart';
import 'package:mahjoub_company/screens/auth/sign_up_screen.dart';
import 'package:mahjoub_company/screens/bn_screens/settings_screen.dart';
import 'package:mahjoub_company/screens/core/launch_screen.dart';
import 'package:mahjoub_company/screens/payment_screens/add_new_card_screen.dart';
import 'package:mahjoub_company/screens/payment_screens/payment_screen.dart';
import 'package:flutter_gen/gen_l10n/app-localizations.dart';

import 'get/language_getc_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefController().initPref();
  await DbController().initDatabase();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);
  LanguageGetxController controller =
      Get.put<LanguageGetxController>(LanguageGetxController());

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) {
        return GetX<LanguageGetxController>(
          init: LanguageGetxController(),
          global: true,
          builder: (controller) {
            return MaterialApp(
              theme: ThemeData(
                appBarTheme: AppBarTheme(
                  iconTheme: const IconThemeData(color: Colors.black),
                  titleTextStyle: GoogleFonts.cairo(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.sp,
                  ),
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  centerTitle: true,
                ),
              ),
              debugShowCheckedModeBanner: false,
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
              supportedLocales: const [
                Locale('ar'),
                Locale('en'),
              ],
              locale: Locale(controller.language.value),
              initialRoute: '/launch_screen',
              routes: {
                '/launch_screen': (context) => const LaunchScreen(),
                '/on_boarding_screen': (context) => const OnBoardingScreen(),
                '/sign_in_screen': (context) => const SignInScreen(),
                '/sign_up_screen': (context) => const SignUpScreen(),
                '/forgot_password_screen': (context) =>
                    const ForGotPasswordScreen(),
                // '/verification_screen': (context) => const VerificationScreen(),
                '/reset_password_screen': (context) =>
                    const ResetPasswordScreen(),
                // '/sub_categories_screen': (context) => const SubCategoriesScreen(),
                // '/products_screen': (context) => const ProductsScreen(),
                // '/product_screen': (context) => const ProductScreen(),
                '/payment_screen': (context) => const PaymentScreen(),
                '/favorite_screen': (context) => const FavoriteScreen(),
                '/add_new_card_screen': (context) => const AddNewCardScreen(),
                // '/submit_cart_screen': (context) => const SubmitCartScreen(),
                '/notification_screen': (context) =>
                    const NotificationsScreen(),
                '/order_screen': (context) => const OrdersScreen(),
                // '/order_details_screen': (context) => const OrderDetailsScreen(),
                '/addresses_screen': (context) => const AddressesScreen(),
                '/new_address_screen': (context) => const NewAddressScreen(),
                '/settings_screen': (context) => const SettingsScreen(),
                '/bn_screen': (context) => const BottomNavigationScreen(),
                '/edit_profile_screen': (context) => const EditProfileScreen(),
                '/edit_mobile_screen': (context) => const EditMobileScreen(),
                '/edit_password_screen': (context) =>
                    const EditPasswordScreen(),
                '/about_us_screen': (context) => const AboutUsScreen(),
              },
            );
          },
        );
      },
    );
  }
}
