import 'package:find_product/customwidgets/search_bar_view.dart';
import 'package:find_product/pages/search_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/search_response_provider.dart';


class ProductDetailsPage extends StatefulWidget {
  static const String routeName = "product_details";
  const ProductDetailsPage({Key? key, }) : super(key: key);

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  final TextEditingController _searchController= TextEditingController();


  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final searchResponseProvider = Provider.of<SearchResponseProvider>(context, listen: true);
    return Scaffold(
      backgroundColor: Color(0xFFE5E5E5),
      appBar: AppBar(title: const Text("প্রোডাক্ট ডিটেইল", style: TextStyle(color: Color(0xFF323232)),),
      backgroundColor: const Color(0xFFE5E5E5),
      iconTheme: const IconThemeData(color: Color(0xFF323232)),
      elevation: 0,
      ),
      body: Column(
        children: [
        buildSectionSearchBar(context, searchResponseProvider),

        ],
      ),
    );
  }

  SizedBox buildSectionSearchBar(BuildContext context, SearchResponseProvider searchResponseProvider) {
    return SizedBox(
      height: 148,
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
                          searchResponseProvider.setSearchData(_searchController.text);
                          Navigator.pushReplacementNamed(context, SearchPage.routeName, arguments: _searchController.text);

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
