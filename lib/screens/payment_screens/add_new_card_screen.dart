import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mahjoub_company/widgets/custom_text_field.dart';
import 'package:mahjoub_company/utils/helpers.dart';

class AddNewCardScreen extends StatefulWidget {
  const AddNewCardScreen({Key? key}) : super(key: key);

  @override
  State<AddNewCardScreen> createState() => _AddNewCardScreenState();
}

class _AddNewCardScreenState extends State<AddNewCardScreen> {
  late TextEditingController _cardNameController;
  late TextEditingController _cardHolderNameController;
  late TextEditingController _cardNumberNameController;
  late TextEditingController _cardExpirationDateController;
  late TextEditingController _cardCVVController;
  String? _cardType;

  @override
  void initState() {
    super.initState();
    _cardNameController = TextEditingController();
    _cardHolderNameController = TextEditingController();
    _cardNumberNameController = TextEditingController();
    _cardExpirationDateController = TextEditingController();
    _cardCVVController = TextEditingController();
  }

  @override
  void dispose() {
    _cardNameController.dispose();
    _cardHolderNameController.dispose();
    _cardNumberNameController.dispose();
    _cardExpirationDateController.dispose();
    _cardCVVController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(context.localizations.add_card),
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
          CustomTextField(
            textEditingController: _cardNameController,
            hintText: context.localizations.card_name,
            keyboardType: TextInputType.text,
            prefixIcon: Icons.credit_card_rounded,
          ),
          SizedBox(height: 15.h),
          CustomTextField(
            textEditingController: _cardHolderNameController,
            hintText: context.localizations.card_name,
            keyboardType: TextInputType.text,
            prefixIcon: Icons.person_outlined,
          ),
          SizedBox(height: 15.h),
          CustomTextField(
            textEditingController: _cardNumberNameController,
            hintText: context.localizations.card_number,
            keyboardType: TextInputType.number,
            prefixIcon: Icons.numbers_outlined,
          ),
          SizedBox(height: 15.h),
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                  textEditingController: _cardExpirationDateController,
                  hintText: context.localizations.card_expiration_date,
                  keyboardType: TextInputType.number,
                  prefixIcon: Icons.date_range_outlined,
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: CustomTextField(
                  textEditingController: _cardCVVController,
                  hintText: context.localizations.card_cvv_number,
                  keyboardType: TextInputType.number,
                  prefixIcon: Icons.password,
                  obscure: true,
                ),
              ),
            ],
          ),
          SizedBox(height: 15.h),
          Row(
            children: [
              Expanded(
                child: RadioListTile<String>(
                  value: 'V',
                  groupValue: _cardType,
                  onChanged: (String? value) {
                    setState(() {
                      _cardType = value;
                    });
                  },
                  title:
                  Text(context.localizations.visa, style: GoogleFonts.cairo(fontSize: 18.sp)),
                ),
              ),
              Expanded(
                child: RadioListTile<String>(
                  value: 'M',
                  groupValue: _cardType,
                  onChanged: (String? value) {
                    setState(() {
                      _cardType = value;
                    });
                  },
                  title: Text(context.localizations.master_card,
                      style: GoogleFonts.cairo(fontSize: 18.sp)),
                ),
              ),
            ],
          ),
          SizedBox(height: 15.h),
          ElevatedButton(
            onPressed: () {
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
