import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mahjoub_company/utils/helpers.dart';
import 'package:mahjoub_company/widgets/custom_indicator_widget.dart';
import 'package:mahjoub_company/widgets/custom_onboarding_content_widget.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int _currentPage = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
          child: Column(
            children: [
              Align(
                alignment: AlignmentDirectional.topEnd,
                child: Visibility(
                  visible: _currentPage < 2,
                  replacement: TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                          context, '/sign_in_screen');
                    },
                    child: Text(
                      context.localizations.start,
                      style: GoogleFonts.cairo(
                        color: Colors.black,
                        fontSize: 16.sp,
                      ),
                    ),
                  ),
                  child: TextButton(
                    onPressed: () {
                      _pageController.animateToPage(2,
                          duration: const Duration(seconds: 1),
                          curve: Curves.easeInOutBack);
                    },
                    child: Text(
                      context.localizations.skip,
                      style: GoogleFonts.cairo(
                        color: Colors.black,
                        fontSize: 16.sp,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: PageView(
                  physics: const BouncingScrollPhysics(),
                  onPageChanged: (int currentPage) {
                    setState(() {
                      _currentPage = currentPage;
                    });
                  },
                  controller: _pageController,
                  children: [
                    CustomOnBoardingContent(
                      image: 'images/onboarding1.png',
                      title: '${context.localizations.on_boarding_title1}\n'
                          '${context.localizations.on_boarding_title2}',
                      subTitle:
                          '${context.localizations.on_boarding_subtitle}\n'
                          '${context.localizations.on_boarding_subtitle2}',
                    ),
                    CustomOnBoardingContent(
                      image: 'images/onboarding2.png',
                      title: '${context.localizations.on_boarding_title3}\n'
                          '${context.localizations.on_boarding_title4}',
                      subTitle:
                          '${context.localizations.on_boarding_subtitle3}\n'
                          '${context.localizations.on_boarding_subtitle4}',
                    ),
                    CustomOnBoardingContent(
                      image: 'images/onboarding3.png',
                      title: '${context.localizations.on_boarding_title1}\n'
                          '${context.localizations.on_boarding_title5}',
                      subTitle:
                          '${context.localizations.on_boarding_subtitle4}\n'
                          '${context.localizations.on_boarding_subtitle5}',
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomIndicator(
                    isSelected: _currentPage == 0,
                    marginEnd: 15,
                  ),
                  CustomIndicator(
                    isSelected: _currentPage == 1,
                    marginEnd: 15,
                  ),
                  CustomIndicator(
                    isSelected: _currentPage == 2,
                  ),
                ],
              ),
              SizedBox(height: 50.h),
            ],
          ),
        ),
      ),
    );
  }
}
