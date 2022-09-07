import 'package:flutter/material.dart';
import 'package:mahjoub_company/utils/helpers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mahjoub_company/widgets/custom_card.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
      ),
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Divider(color: Colors.transparent),
              Image(image: const AssetImage('images/logo.png'), height: 250.h),
              Text(
                context.localizations.launch_screen_title,
                style: GoogleFonts.cairo(
                  color: Colors.black,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const CustomCard(
                leadingIcon: Icons.language,
                trailingIcon: null,
                title: 'FaceBook',
                subTitle: 'https://www.facebook.com',
              ),
              const CustomCard(
                leadingIcon: Icons.language,
                trailingIcon: null,
                title: 'Instagram',
                subTitle: 'https://www.instagram.com',
              ),
            ],
          ),
          Positioned(
              bottom: 4,
              left: 0,
              right: 0,
              child: Text(
                textAlign: TextAlign.center,
                'Mohammed Mahjoub - e-lancer',
                style: GoogleFonts.cairo(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ))
        ],
      ),
    );
  }
}
