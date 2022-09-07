import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mahjoub_company/utils/helpers.dart';
import 'package:mahjoub_company/models/product.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  final List<Product> _products = <Product>[
    Product.my(nameEn: 'ch-sp-model-1',infoEn: 'werwerwerwerwer', imageUrl: 'images/product1.png',price: '10',favorite: true,),
    Product.my(nameEn: 'ch-sp-model-2',infoEn: 'werwerwerwerwer', imageUrl: 'images/product2.png',price: '15',favorite: true,),
    Product.my(nameEn: 'ch-sp-model-3',infoEn: 'werwerwerwerwer', imageUrl: 'images/product3.png',price: '13',favorite: true,),
    Product.my(nameEn: 'ch-sp-model-4',infoEn: 'werwerwerwerwer', imageUrl: 'images/product4.png',price: '12',favorite: true,),
    Product.my(nameEn: 'ch-sp-model-5',infoEn: 'werwerwerwerwer', imageUrl: 'images/product5.png',price: '17',favorite: true,),
    Product.my(nameEn: 'ch-sp-model-6',infoEn: 'werwerwerwerwer', imageUrl: 'images/product6.png',price: '10',favorite: true,),
    Product.my(nameEn: 'ch-sp-model-7',infoEn: 'werwerwerwerwer', imageUrl: 'images/product7.png',price: '11',favorite: true,),
    Product.my(nameEn: 'ch-sp-model-8',infoEn: 'werwerwerwerwer', imageUrl: 'images/product8.png',price: '16',favorite: true,),
    Product.my(nameEn: 'ch-sp-model-9',infoEn: 'werwerwerwerwer', imageUrl: 'images/product9.png',price: '11',favorite: true,),
    Product.my(nameEn: 'ch-sp-model-10',infoEn: 'werwerwerwerwer', imageUrl: 'images/product10.png',price: '9',favorite: true,),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.localizations.favorite),),
      body: GridView.builder(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: _products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          return Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Stack(
              children: [
                Image(
                  image: AssetImage(_products[index].imageUrl!),
                  fit: BoxFit.fill,
                  width: double.infinity,
                ),
                Positioned(
                  left: 10,
                  top: 10,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 18,
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          _products[index].favorite = !_products[index].favorite!;
                        });
                      },
                      icon: Icon(
                        Icons.favorite,
                        color: _products[index].favorite! ? Colors.red : Colors.grey,
                        size: 20,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.w, vertical: 3.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _products[index].nameEn!,
                            style: GoogleFonts.cairo(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: [
                              Text('${_products[index].price}\$', style: GoogleFonts.cairo()),
                              const Spacer(),
                              Row(
                                children: const [
                                  Icon(
                                    Icons.star,
                                    size: 14,
                                    color: Colors.yellow,
                                  ),
                                  Icon(
                                    Icons.star,
                                    size: 14,
                                    color: Colors.yellow,
                                  ),
                                  Icon(
                                    Icons.star,
                                    size: 14,
                                    color: Colors.yellow,
                                  ),
                                  Icon(
                                    Icons.star,
                                    size: 14,
                                    color: Colors.yellow,
                                  ),
                                  Icon(
                                    Icons.star,
                                    size: 14,
                                    color: Colors.yellow,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
