import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mahjoub_company/widgets/custom_payment_card.dart';
import 'package:mahjoub_company/utils/helpers.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.localizations.payment),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        children: [
          Image(
            height: 200.h,
            width: double.infinity,
            fit: BoxFit.contain,
            image: const AssetImage('images/payment.png'),
          ),
          SizedBox(height: 10.h),
          CustomPaymentCard(cardName: context.localizations.visa, onPress: (){}),
          SizedBox(height: 20.h),
          CustomPaymentCard(cardName: context.localizations.master_card, onPress: (){}),
          SizedBox(height: 20.h),
          SizedBox(height: 20.h),

          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/add_new_card_screen');
            },
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 50.h),
              primary: Colors.grey.shade800,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            child: Text(
              context.localizations.add,
              style: GoogleFonts.cairo(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}


