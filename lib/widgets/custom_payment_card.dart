import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomPaymentCard extends StatelessWidget {

  final String cardName;
  final void Function() onPress;

  const CustomPaymentCard({
    required this.cardName,
    required this.onPress,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 96.h,
      width: 350.w,
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15)),
        child: Row(
          children: [
            SizedBox(width: 40.w),
            const Icon(Icons.payment_outlined),
            SizedBox(width: 10.w),
            Text(
              cardName,
              style: GoogleFonts.cairo(
                  fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            IconButton(
                onPressed: onPress,
                icon: const Icon(
                  Icons.send,
                )),
            SizedBox(width: 20.w),
          ],
        ),
      ),
    );
  }
}