import 'dart:convert';
import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:find_product/customwidgets/search_bar_view.dart';
import 'package:find_product/pages/search_page.dart';
import 'package:find_product/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';

import '../models/search_response.dart';
import '../providers/search_response_provider.dart';

class ProductDetailsPage extends StatefulWidget {
  static const String routeName = "product_details";

  const ProductDetailsPage({
    Key? key,
  }) : super(key: key);

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final productItem = ModalRoute.of(context)!.settings.arguments as Results;
    final searchResponseProvider =
        Provider.of<SearchResponseProvider>(context, listen: true);
    return Scaffold(
      backgroundColor: Color(0xFFE5E5E5),
      appBar: AppBar(
        title: const Text(
          "প্রোডাক্ট ডিটেইল",
          style: TextStyle(color: Color(0xFF323232)),
        ),
        backgroundColor: const Color(0xFFE5E5E5),
        iconTheme: const IconThemeData(color: Color(0xFF323232)),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildSectionSearchBar(context, searchResponseProvider),
            buildSectionSlider(productItem),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width - 30,
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Text(
                      utf8.decode(
                        productItem.productName!.codeUnits,
                      ),
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF19181B),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 35,
                    child: Row(children: [
                      RichText(
                        text: TextSpan(
                            text: "ব্রান্ডঃ ",
                            style: const TextStyle(
                                color: Color(0xFF646464),
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                            children: [
                              TextSpan(
                                  text: "${productItem.brand!.name}  ",
                                  style: const TextStyle(
                                      color: Color(0xFF646464),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600))
                            ]),
                      ),
                      Container(
                        height: 8,
                        width: 8,
                        decoration: BoxDecoration(
                            color: Color(0xFFDA2079), shape: BoxShape.circle),
                      ),
                      RichText(
                        text: TextSpan(
                          text: "  ডিস্ট্রিবিউটরঃ ",
                          style: const TextStyle(
                              color: Color(0xFF646464),
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                          children: [
                            TextSpan(
                                text: "${productItem.seller}",
                                style: const TextStyle(
                                    color: Color(0xFF646464),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600))
                          ],
                        ),
                      ),
                    ]),
                  ),
                  Positioned(
                    top: 75,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 130,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 12.0, left: 8, right: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "ক্রয়মূল্যঃ",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFFDA2079)),
                                ),
                                Text(
                                  "$takaSymbol${productItem.charge!.currentCharge!.toInt()}",
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFFDA2079)),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "বিক্রয়মূল্যঃ",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF000000)),
                                ),
                                Text(
                                  "$takaSymbol${productItem.charge!.sellingPrice!.toInt()}",
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF000000)),
                                ),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 2.0, right: 2),
                            child: DottedLine(
                              lineLength: double.infinity,
                              direction: Axis.horizontal,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "লাভঃ",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF000000)),
                                ),
                                Text(
                                  "$takaSymbol${productItem.charge!.profit!.toInt()}",
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF000000)),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Positioned(
                    left: 5,
                    top: 230,
                    child: Text(
                      "বিস্তারিত",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF323232)),
                    ),
                  ),
                  Positioned(
                    top: 260,
                    left: 0,
                    right: 0,
                    child: Column(
                      children: [
                        Html(
                          data:
                              '${utf8.decode(productItem!.description!.codeUnits)}',
                          style: {
                            "body": Style(
                              fontSize: FontSize(16.0),
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF646464),
                              textAlign: TextAlign.justify,
                            ),
                          },
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 190,
                    left: MediaQuery.of(context).size.width / 3,
                    child: Container(
                      width: 90,
                      height: 90,
                      // color: Colors.red,
                      child: Stack(children: [
                        SizedBox(
                          height: 90,
                          width: 90,
                          child: CustomPaint(
                            painter: HexagonPainter(),
                          ),
                        ),
                        Positioned(
                          left: 25,
                          top: 25,
                          child: Column(
                            children: const [
                              Text(
                                "এটি",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFFFFFFFF)),
                              ),
                              Text("কিনুন",style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFFFFFFFF)),)
                            ],
                          ),
                        )
                      ]),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox buildSectionSlider(Results productItem) {
    return SizedBox(
      height: 308,
      child: CarouselSlider(
        options: CarouselOptions(
            height: 308,
            viewportFraction: 0.6,
            autoPlay: false,
            aspectRatio: 0.2,
            enlargeCenterPage: true,
            enlargeStrategy: CenterPageEnlargeStrategy.height,
            initialPage: 0,
            enlargeFactor: 0.3),
        items: productItem!.images!
            .map((e) => Container(
                margin: EdgeInsets.all(8),
                height: 308,
                width: 248,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color(0xFFFFFFFF)),
                child: Stack(children: [
                  Positioned(
                    top: 40,
                    left: 5,
                    child: CachedNetworkImage(
                      imageUrl: e!.image!,
                      height: 200,
                      placeholder: (context, url) => Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  ),
                ])))
            .toList(),
      ),
    );
  }

  SizedBox buildSectionSearchBar(
      BuildContext context, SearchResponseProvider searchResponseProvider) {
    return SizedBox(
      height: 80,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Positioned(
            top: 5,
            left: 17,
            right: 17,
            child: Container(
              height: 48,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: const Color(0xFFFFFFFF),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 24, right: 12),
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "কাঙ্ক্ষিত পণ্যটি খুঁজুন",
                    suffixIcon: IconButton(
                        onPressed: () {
                          searchResponseProvider
                              .setSearchData(_searchController.text);
                          Navigator.pushReplacementNamed(
                              context, SearchPage.routeName,
                              arguments: _searchController.text);
                        },
                        icon: const Icon(Icons.search_rounded)),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HexagonPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Color(0xFF6210E1);
    var path = Path();
    path.moveTo(size.width / 2, 0);
    path.lineTo(size.width, size.height / 4);
    path.lineTo(size.width, size.height - (size.height / 4));
    path.lineTo(size.width / 2, size.height);
    path.lineTo(0, size.height - (size.height / 4));
    path.lineTo(0, size.height / 4);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
