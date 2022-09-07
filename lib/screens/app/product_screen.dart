import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mahjoub_company/api/categories_api_controller.dart';
import 'package:mahjoub_company/get/cart_getx_controller.dart';
import 'package:mahjoub_company/models/cart.dart';
import 'package:mahjoub_company/models/product.dart';
import 'package:mahjoub_company/models/product_details.dart';
import 'package:mahjoub_company/prefs/shared_pref_controller.dart';
import 'package:mahjoub_company/utils/helpers.dart';

class ProductScreen extends StatefulWidget {
  final Product product;

  const ProductScreen({required this.product, Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  late PageController _pageController;
  bool favorite = false;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.8, initialPage: 1);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.localizations.product),
      ),
      body: FutureBuilder<ProductDetail?>(
        future: CategoriesApiController().getProductDetails(widget.product.id!),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            return Stack(
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: 400.h),
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: 3,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: EdgeInsetsDirectional.only(
                            end: index != 2 ? 10 : 0),
                        elevation: 0,
                        color: Colors.white60,
                        child: Image(
                          image: NetworkImage(snapshot.data!.images![index].imageUrl!),
                          fit: BoxFit.contain,
                        ),
                        // alignment: Alignment.center,
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 450.h, left: 20.w, right: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            snapshot.data!.nameEn!,
                            style: GoogleFonts.cairo(
                                fontSize: 24.sp, fontWeight: FontWeight.bold),
                          ),
                          const Spacer(),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                favorite = !favorite;
                              });
                            },
                            icon: Icon(
                              Icons.favorite,
                              color: favorite ? Colors.red : Colors.grey,
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Text(
                          snapshot.data!.infoEn!,
                          style: GoogleFonts.cairo(
                              fontSize: 18.sp, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          Text(
                            '${snapshot.data!.price!}\$',
                            style: GoogleFonts.cairo(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue),
                          ),
                          const Spacer(),
                          Row(
                            children: const [
                              Icon(
                                Icons.star,
                                size: 20,
                                color: Colors.yellow,
                              ),
                              Icon(
                                Icons.star,
                                size: 20,
                                color: Colors.yellow,
                              ),
                              Icon(
                                Icons.star,
                                size: 20,
                                color: Colors.yellow,
                              ),
                              Icon(
                                Icons.star,
                                size: 20,
                                color: Colors.yellow,
                              ),
                              Icon(
                                Icons.star,
                                size: 20,
                                color: Colors.yellow,
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      ElevatedButton(
                        onPressed: () {
                          CartGetxController.to.create(cart);
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(double.infinity, 50.h),
                          primary: Colors.grey.shade800,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: Text(
                          context.localizations.add_to_chart,
                          style: GoogleFonts.cairo(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 40.h),
                    ],
                  ),
                ),
              ],
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

  Cart get cart{
    Cart cart = Cart();
    cart.userId = SharedPrefController().getValueFor(key: PrefKeys.id.name);
    cart.nameEn = widget.product.nameEn!;
    cart.nameAr = widget.product.nameAr!;
    cart.infoEn = widget.product.infoEn!;
    cart.infoAr= widget.product.infoAr!;
    cart.productId = widget.product.id!;
    cart.price = double.parse(widget.product.price!);
    cart.quantity = 1;
    cart.overalRate = widget.product.overalRate!;
    cart.subCategoryId = widget.product.subCategoryId!;
    cart.productRate = widget.product.productRate!.toString();
    cart.offerPrice = null;
    cart.favorite = widget.product.favorite!.toString();
    cart.imageUrl =  widget.product.imageUrl!;
    return cart;
  }
}
