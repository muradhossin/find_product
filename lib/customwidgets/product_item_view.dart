import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:find_product/pages/product_details_page.dart';
import 'package:find_product/utils/constants.dart';
import 'package:flutter/material.dart';

import '../models/search_response.dart';

class ProductItemView extends StatefulWidget {
  final Results item;

  const ProductItemView({Key? key, required this.item}) : super(key: key);

  @override
  State<ProductItemView> createState() => _ProductItemViewState();
}

class _ProductItemViewState extends State<ProductItemView> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, ProductDetailsPage.routeName, arguments: widget.item);
      },
      child: Stack(children: [
        Container(
          height: 267,
          decoration: BoxDecoration(
              color: const Color(0xFFFFFFFF),
              borderRadius: BorderRadius.circular(15)),
        ),
        Positioned(
          top: 12,
          left: 38,
          child: CachedNetworkImage(
            height: 140,
            width: 100,
            imageUrl: widget.item!.image!,
            fit: BoxFit.fitWidth,
            placeholder: (context, url) => const Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ),
        Positioned(
          top: 150,
          left: 8,
          right: 8,
          height: 40,
          child: SizedBox(
            height: 40,
            child: Text(
              utf8.decode(widget.item!.productName!.codeUnits),
              style: const TextStyle(
                  fontSize: 14,
                  height: 1,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF323232)),
            ),
          ),
        ),
        Positioned(
          top: 195,
          left: 7,
          right: 7,
          child: SizedBox(
            height: 50,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: TextSpan(
                          text: "ক্রয় ",
                          style: const TextStyle(
                              color: Color(0xFF646464),
                              fontSize: 8,
                              fontWeight: FontWeight.w400),
                          children: [
                            TextSpan(
                                text:
                                    "$takaSymbol ${widget.item!.charge!.currentCharge!.toStringAsFixed(2)}",
                                style: const TextStyle(
                                    color: Color(0xFFDA2079),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700))
                          ]),
                    ),
                    Text(
                      "$takaSymbol${(widget.item!.charge!.currentCharge! + 200).toStringAsFixed(2)}",
                      style: const TextStyle(
                          color: Color(0xFFDA2079),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        decoration: TextDecoration.lineThrough,
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: TextSpan(
                          text: "বিক্রয় ",
                          style: const TextStyle(
                              color: Color(0xFF646464),
                              fontSize: 8,
                              fontWeight: FontWeight.w400),
                          children: [
                            TextSpan(
                                text:
                                    "$takaSymbol ${widget.item!.charge!.sellingPrice!.toStringAsFixed(2)}",
                                style: const TextStyle(
                                    color: Color(0xFF646464),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600))
                          ]),
                    ),
                    RichText(
                      text: TextSpan(
                          text: " লাভ ",
                          style: const TextStyle(
                              color: Color(0xFF646464),
                              fontSize: 8,
                              fontWeight: FontWeight.w400),
                          children: [
                            TextSpan(
                                text: "$takaSymbol${widget.item!.charge!.profit!.toStringAsFixed(2)}",
                                style: const TextStyle(
                                    color: Color(0xFF646464),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600))
                          ]),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
