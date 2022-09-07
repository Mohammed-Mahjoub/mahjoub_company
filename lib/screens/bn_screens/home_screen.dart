import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mahjoub_company/api/home_api_controller.dart';
import 'package:mahjoub_company/models/home.dart';
import 'package:mahjoub_company/models/product.dart';
import 'package:mahjoub_company/widgets/home_section.dart';
import 'package:mahjoub_company/utils/helpers.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController _pageController;

  final List<Product> _products = <Product>[
    Product.my(
      nameEn: 'ch-sp-model-1',
      infoEn: 'werwerwerwerwer',
      imageUrl: 'images/product1.png',
      price: '10',
      favorite: true,
    ),
    Product.my(
      nameEn: 'ch-sp-model-2',
      infoEn: 'werwerwerwerwer',
      imageUrl: 'images/product2.png',
      price: '15',
      favorite: true,
    ),
    Product.my(
      nameEn: 'ch-sp-model-3',
      infoEn: 'werwerwerwerwer',
      imageUrl: 'images/product3.png',
      price: '13',
      favorite: true,
    ),
    Product.my(
      nameEn: 'ch-sp-model-4',
      infoEn: 'werwerwerwerwer',
      imageUrl: 'images/product4.png',
      price: '12',
      favorite: true,
    ),
    Product.my(
      nameEn: 'ch-sp-model-5',
      infoEn: 'werwerwerwerwer',
      imageUrl: 'images/product5.png',
      price: '17',
      favorite: true,
    ),
    Product.my(
      nameEn: 'ch-sp-model-6',
      infoEn: 'werwerwerwerwer',
      imageUrl: 'images/product6.png',
      price: '10',
      favorite: true,
    ),
    Product.my(
      nameEn: 'ch-sp-model-7',
      infoEn: 'werwerwerwerwer',
      imageUrl: 'images/product7.png',
      price: '11',
      favorite: true,
    ),
    Product.my(
      nameEn: 'ch-sp-model-8',
      infoEn: 'werwerwerwerwer',
      imageUrl: 'images/product8.png',
      price: '16',
      favorite: true,
    ),
    Product.my(
      nameEn: 'ch-sp-model-9',
      infoEn: 'werwerwerwerwer',
      imageUrl: 'images/product9.png',
      price: '11',
      favorite: true,
    ),
    Product.my(
      nameEn: 'ch-sp-model-10',
      infoEn: 'werwerwerwerwer',
      imageUrl: 'images/product10.png',
      price: '9',
      favorite: true,
    ),
  ];


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
    return FutureBuilder<Home?>(
      future: HomeApiController().getHome(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasData && snapshot.data != null) {
          return ListView(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(maxHeight: 190.h),
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: snapshot.data!.slider!.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Card(
                      margin:
                          EdgeInsetsDirectional.only(end: index != 2 ? 10 : 0),
                      elevation: 1,
                      color: Colors.white,
                      child: Image(
                        image: NetworkImage(
                            snapshot.data!.slider![index].imageUrl!),
                        fit: BoxFit.contain,
                      ),
                      // alignment: Alignment.center,
                    );
                  },
                ),
              ),
              Text(
                context.localizations.categories,
                style: GoogleFonts.cairo(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ConstrainedBox(
                constraints: const BoxConstraints(maxHeight: 170),
                child: GridView.builder(
                  itemCount: snapshot.data!.categories!.length,
                  scrollDirection: Axis.horizontal,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisSpacing: 10,
                    childAspectRatio: 150 / 130,
                  ),
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 1,
                      color: Colors.grey.shade100,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            child: Image(
                              image: NetworkImage(
                                  snapshot.data!.categories![index].imageUrl!),
                              fit: BoxFit.fill,
                            ),
                          ),
                          SizedBox(height: 5.h),
                          Center(
                            child: Text(
                              snapshot.data!.categories![index].nameEn!,
                              style: GoogleFonts.cairo(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 20.h),
              HomeSection(
                  title: context.localizations.latest_products,
                  onPressed: () {}),
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: snapshot.data!.latestProducts!.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Stack(
                      children: [
                        Container(
                          color: Colors.grey.shade100,
                          child: Image(
                            image: NetworkImage(snapshot
                                .data!.latestProducts![index].imageUrl!),
                            fit: BoxFit.fill,
                            width: double.infinity,
                          ),
                        ),
                        Positioned(
                          right: 5,
                          top: 5,
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                _products[index].favorite =
                                    !_products[index].favorite!;
                              });
                            },
                            icon: Icon(
                              Icons.favorite,
                              color: _products[index].favorite!
                                  ? Colors.red
                                  : Colors.grey,
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
                                    snapshot
                                        .data!.latestProducts![index].nameEn!,
                                    style: GoogleFonts.cairo(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                          '${snapshot.data!.latestProducts![index].price}\$',
                                          style: GoogleFonts.cairo(
                                              color: Colors.blueAccent)),
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
              SizedBox(height: 20.h),
              HomeSection(
                  title: context.localizations.like_products,
                  onPressed: () {
                    Navigator.pushNamed(context, '/favorite_screen');
                  }),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _products.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Image(
                            image: NetworkImage(snapshot
                                .data!.latestProducts![index].imageUrl!),
                            fit: BoxFit.contain,
                            width: 120,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                snapshot.data!.latestProducts![index].nameEn!,
                                style: GoogleFonts.cairo(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                snapshot.data!.latestProducts![index].infoEn!,
                                style: GoogleFonts.cairo(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                  '${snapshot.data!.latestProducts![index].price} \$',
                                  style: GoogleFonts.cairo(
                                      color: Colors.blue.shade700,
                                      fontSize: 16.sp)),
                            ],
                          ),
                          const Spacer(),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                _products[index].favorite =
                                    !_products[index].favorite!;
                              });
                            },
                            icon: Icon(
                              Icons.favorite,
                              color: _products[index].favorite!
                                  ? Colors.red
                                  : Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              )
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
    );
  }
}
