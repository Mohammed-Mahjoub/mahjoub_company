import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mahjoub_company/get/cart_getx_controller.dart';
import 'package:mahjoub_company/models/new_cart.dart';
import 'package:mahjoub_company/screens/app/submit_cart_screen.dart';
import 'package:mahjoub_company/utils/helpers.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  CartGetxController controller = CartGetxController.to;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.loading.isTrue) {
        return const Center(child: CircularProgressIndicator());
      } else if (controller.cartItems.isNotEmpty) {
        return Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: controller.cartItems.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image(
                              image: NetworkImage(
                                  controller.cartItems[index].imageUrl),
                              fit: BoxFit.contain,
                              width: 100,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    controller.cartItems[index].nameEn,
                                    style: GoogleFonts.cairo(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    controller.cartItems[index].infoEn,
                                    style: GoogleFonts.cairo(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                      'Quantity: ${controller.cartItems[index].quantity}',
                                      style: GoogleFonts.cairo(
                                          color: Colors.blue.shade700,
                                          fontSize: 16.sp)),
                                ],
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                CartGetxController.to.changeQuantity(
                                  index,
                                  controller.cartItems[index].quantity + 1,
                                );
                              },
                              icon: const Icon(Icons.add),
                            ),
                            IconButton(
                              onPressed: () {
                                CartGetxController.to.changeQuantity(
                                  index,
                                  controller.cartItems[index].quantity - 1,
                                  true,
                                );
                              },
                              icon: const Icon(Icons.remove),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: ElevatedButton(
                onPressed: () {
                  List<Map<String, dynamic>> newCarts =
                      <Map<String, dynamic>>[];
                  for (int i = 0; i < controller.cartItems.value.length; i++) {
                    newCarts.add(NewCart(controller.cartItems[i].productId,
                            controller.cartItems[i].quantity)
                        .toMap());
                  }
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            SubmitCartScreen(cartItems: newCarts),
                      ));
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50.h),
                  primary: Colors.grey.shade800,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Text(
                  context.localizations.submit,
                  style: GoogleFonts.cairo(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 15.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
              color: Colors.grey.shade300,
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        '${context.localizations.total}:',
                        style: GoogleFonts.cairo(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        controller.total.toString(),
                        style: GoogleFonts.cairo(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      Text(
                        '${context.localizations.quantity}:',
                        style: GoogleFonts.cairo(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        controller.quantity.toString(),
                        style: GoogleFonts.cairo(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        );
      } else {
        return Center(
          child: Text(
            'CART IS EMPTY',
            style: GoogleFonts.cairo(
              fontWeight: FontWeight.bold,
              fontSize: 24.sp,
            ),
          ),
        );
      }
    });
  }
}
