import 'package:find_product/providers/search_response_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_language_fonts/google_language_fonts.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

import '../customwidgets/product_item_view.dart';

class SearchPage extends StatefulWidget {
  static const String routeName = "search";

  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late SearchResponseProvider searchResponseProvider;

  @override
  void didChangeDependencies() {
    searchResponseProvider =
        Provider.of<SearchResponseProvider>(context, listen: true);
    searchResponseProvider.getSearchData();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final productList =
        searchResponseProvider.searchResponse?.data?.products?.results;
    return Scaffold(
      backgroundColor: Color(0xFFE5E5E5),
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildSectionSearchBar(context),
            SizedBox(height: 30,),
            searchResponseProvider.hasDataLoaded ? Padding(
              padding: const EdgeInsets.only(left: 17, right: 17, top: 8, bottom: 8),
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                mainAxisExtent: 300,
               mainAxisSpacing: 5,
                crossAxisSpacing: 10),
                itemCount: productList!.length,
                itemBuilder: (context, index) {
                  return ProductItemView(item: productList[index],);
                },
              ),
            ): Center(child: CircularProgressIndicator(),),
          ],
        ),
      ),
    );
  }

  SizedBox buildSectionSearchBar(BuildContext context) {
    return SizedBox(
      height: 148,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Positioned(
            top: 100,
            left: 17,
            right: 17,
            child: Container(
              height: 48,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Color(0xFFFFFFFF),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 24, right: 12),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "কাঙ্ক্ষিত পণ্যটি খুঁজুন",
                    suffixIcon: IconButton(
                        onPressed: () {},
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
