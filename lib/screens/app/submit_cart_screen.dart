import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mahjoub_company/api/orders_api_controller.dart';
import 'package:mahjoub_company/get/adresses_getx_controller.dart';
import 'package:mahjoub_company/models/address.dart';
import 'package:mahjoub_company/models/api_response.dart';
import 'package:mahjoub_company/utils/helpers.dart';

class SubmitCartScreen extends StatefulWidget {
  final List<Map<String, dynamic>> cartItems;

  const SubmitCartScreen({required this.cartItems, Key? key}) : super(key: key);

  @override
  State<SubmitCartScreen> createState() => _SubmitCartScreenState();
}

class _SubmitCartScreenState extends State<SubmitCartScreen> {
  List<Address> addresses = AddressesGetxController.to.addressItem.value;
  List<String> cards = <String>[
    'Visa',
    'Master Card',
  ];
  int? selectedItem;
  String? selectedItem2;
  String? _paymentType;
  bool online = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.localizations.submit_cart),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        children: [
          SizedBox(height: 10.h),
          DropdownButton<int>(
            isExpanded: true,
            hint: Text(context.localizations.select_address),
            style: const TextStyle(color: Colors.black),
            items: addresses.map((address) {
              return DropdownMenuItem<int>(
                value: address.id,
                child: Text(address.info!),
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
          SizedBox(height: 10.h),
          Row(
            children: [
              Expanded(
                child: RadioListTile<String>(
                  value: 'Cash',
                  groupValue: _paymentType,
                  onChanged: (String? value) {
                    setState(() {
                      _paymentType = value;
                      online = false;
                    });
                  },
                  title: Text(context.localizations.cash,
                      style: GoogleFonts.cairo(fontSize: 18.sp)),
                ),
              ),
              Expanded(
                child: RadioListTile<String>(
                  value: 'Online',
                  groupValue: _paymentType,
                  onChanged: (String? value) {
                    setState(() {
                      _paymentType = value;
                      online = true;
                    });
                  },
                  title: Text(context.localizations.online,
                      style: GoogleFonts.cairo(fontSize: 18.sp)),
                ),
              ),
            ],
          ),
          Visibility(
            visible: online,
            replacement: const SizedBox(height: 48),
            child: DropdownButton<String>(
              isExpanded: true,
              hint: Text(context.localizations.select_card),
              style: const TextStyle(color: Colors.black),
              items: cards.map((card) {
                return DropdownMenuItem<String>(
                  value: card,
                  child: Text(card),
                );
              }).toList(),
              onChanged: (String? value) {
                setState(() {
                  selectedItem2 = value;
                });
              },
              icon: const Icon(Icons.keyboard_arrow_down_sharp),
              value: selectedItem2,
            ),
          ),
          SizedBox(height: 15.h),
          ElevatedButton(
            onPressed: () {
              createOrder();
            },
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 50.h),
              primary: Colors.grey.shade800,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            child: Text(
              context.localizations.submit_cart,
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

  Future<void> createOrder() async {
    ApiResponse apiResponse = await OrdersApiController().createOrder(
      addressId: selectedItem!,
      cartItems: widget.cartItems,
      paymentType: _paymentType!,
    );
    context.showSnackBar(
      message: apiResponse.message,
      error: !apiResponse.success,
    );
  }
}
