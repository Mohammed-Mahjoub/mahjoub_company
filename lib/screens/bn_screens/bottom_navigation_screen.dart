import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mahjoub_company/api/auth_api_controller.dart';
import 'package:mahjoub_company/get/cart_getx_controller.dart';
import 'package:mahjoub_company/models/api_response.dart';
import 'package:mahjoub_company/models/bn_screen.dart';
import 'package:mahjoub_company/prefs/shared_pref_controller.dart';
import 'package:mahjoub_company/screens/bn_screens/categories_screen.dart';
import 'package:mahjoub_company/screens/bn_screens/home_screen.dart';
import 'package:mahjoub_company/screens/bn_screens/settings_screen.dart';
import 'package:mahjoub_company/screens/bn_screens/cart_screen.dart';
import 'package:mahjoub_company/utils/helpers.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int _selectedPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<BnScreen> screens = <BnScreen>[
      BnScreen(title: context.localizations.home, widget: const HomeScreen()),
      BnScreen(title: context.localizations.cart, widget: const CartScreen()),
      BnScreen(
          title: context.localizations.categories,
          widget: const CategoriesScreen()),
      BnScreen(
          title: context.localizations.settings,
          widget: const SettingsScreen()),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(screens[_selectedPageIndex].title),
        actions: [
          Visibility(
            visible: screens[_selectedPageIndex].title == context.localizations.cart,
            child: IconButton(
              onPressed: () {
                CartGetxController.to.clear();
              },
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            Container(
              width: double.infinity,
              height: 170,
              color: Colors.black45,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CircleAvatar(radius: 40,backgroundColor: Colors.white,child: Icon(Icons.person),),
                    Text(
                      SharedPrefController().getValueFor(key: PrefKeys.name.name),
                      style: GoogleFonts.cairo(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white),
                    ),
                    Text(
                      SharedPrefController().getValueFor(key: PrefKeys.mobile.name),
                      style:
                          GoogleFonts.cairo(fontSize: 16, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
                Future.delayed(const Duration(milliseconds: 500), () {
                  Navigator.pushNamed(context, '/favorite_screen');
                });
              },
              leading: const Icon(Icons.favorite_border),
              title: Text(context.localizations.favorite),
              subtitle: Text(context.localizations.favorite_items),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 18,
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
                Future.delayed(const Duration(milliseconds: 500), () {
                  Navigator.pushNamed(context, '/payment_screen');
                });
              },
              leading: const Icon(Icons.payment_outlined),
              title: Text(context.localizations.payment),
              subtitle: Text(context.localizations.payment_methods),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 18,
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
                Future.delayed(const Duration(milliseconds: 500), () {
                  Navigator.pushNamed(context, '/order_screen');
                });
              },
              leading: const Icon(Icons.card_giftcard),
              title: Text(context.localizations.orders),
              subtitle: Text(context.localizations.my_orders),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 18,
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
                Future.delayed(const Duration(milliseconds: 500), () {
                  Navigator.pushNamed(context, '/notification_screen');
                });
              },
              leading: const Icon(Icons.notifications_none),
              title: Text(context.localizations.notifications),
              subtitle: Text(context.localizations.my_notifications),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 18,
              ),
            ),
            ListTile(
              onTap: () async {
                ApiResponse apiResponse = await AuthApiController().logout();
                if (apiResponse.success) {
                  Navigator.pushReplacementNamed(context, '/sign_in_screen');
                }
              },
              leading: const Icon(Icons.logout),
              title: Text(context.localizations.logout),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 18,
              ),
            ),
          ],
        ),
      ),
      body: screens[_selectedPageIndex].widget,
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(10),
          topLeft: Radius.circular(10),
        ),
        child: BottomNavigationBar(
          onTap: (int selectedPageIndex) {
            setState(() => _selectedPageIndex = selectedPageIndex);
          },
          currentIndex: _selectedPageIndex,
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: Colors.black,
          selectedIconTheme: const IconThemeData(
            color: Colors.black,
          ),
          selectedLabelStyle: GoogleFonts.montserrat(
            fontWeight: FontWeight.bold,
            fontSize: 10.sp,
          ),
          selectedFontSize: 14.sp,
          unselectedItemColor: Colors.grey.shade400,
          unselectedIconTheme: IconThemeData(
            color: Colors.grey.shade800,
          ),
          unselectedLabelStyle: GoogleFonts.cairo(
            fontSize: 11.sp,
          ),
          unselectedFontSize: 12.sp,
          iconSize: 24,
          elevation: 20,
          items: const [
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.home),
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.shopping_cart),
              icon: Icon(Icons.shopping_cart_outlined),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.category),
              icon: Icon(Icons.category_outlined),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.settings),
              icon: Icon(Icons.settings_outlined),
              label: 'Settings',
            )
          ],
        ),
      ),
    );
  }
}
