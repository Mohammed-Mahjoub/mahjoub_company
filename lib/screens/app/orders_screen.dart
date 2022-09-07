import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mahjoub_company/models/order.dart';
import 'package:mahjoub_company/screens/app/order_details_screen.dart';
import 'package:mahjoub_company/utils/helpers.dart';
import '../../api/orders_api_controller.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.localizations.orders),
      ),
      body: FutureBuilder<List<Order>>(
        future: OrdersApiController().getOrders(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => OrderDetailsScreen(id: snapshot.data![index].id!),));
                  },
                  child: Container(
                    height: 90,
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(
                      horizontal: 15.w,
                      vertical: 10.h,
                    ),
                    padding: EdgeInsetsDirectional.only(start: 15.w, end: 5.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          offset: Offset(0, 0),
                          color: Colors.black45,
                          blurRadius: 4,
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.card_giftcard),
                        SizedBox(width: 10.w),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    snapshot.data![index].status.toString(),
                                    style: GoogleFonts.cairo(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                  SizedBox(width: 5.w),
                                  Text(
                                    '${context.localizations.order_id}: ${snapshot.data![index].id}',
                                    style: GoogleFonts.cairo(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 12.sp,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    '${context.localizations.payment_methods}: ${snapshot.data![index].paymentType}',
                                    style: GoogleFonts.cairo(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 12.sp,
                                    ),
                                  ),
                                  SizedBox(width: 5.w),
                                  Text(
                                    '${context.localizations.order_date}: ${snapshot.data![index].date}',
                                    style: GoogleFonts.cairo(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 12.sp,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5.h),
                              Text(
                                '${context.localizations.total}: ${snapshot.data![index].total}\$',
                                style: GoogleFonts.cairo(
                                  fontWeight: FontWeight.w300,
                                  height: 1.0,
                                  fontSize: 12.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(
              child: Text(
                'No Data',
                style: GoogleFonts.cairo(),
              ),
            );
          }
        },
      ),
    );
  }
}
