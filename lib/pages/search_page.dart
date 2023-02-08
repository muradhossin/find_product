import 'package:find_product/customwidgets/search_bar_view.dart';
import 'package:find_product/models/search_response.dart';
import 'package:find_product/pages/product_details_page.dart';
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
  final TextEditingController _searchController = TextEditingController();
  late ScrollController _controller;
  bool isTextShowing = true;


  bool isDataCalledOnce = true;
  bool hasDataSearched = false;
  int offsetNumber = 10;
  int limitNumber = 10;

  bool _hasNextPage = true;
  bool _isLoadMoreRunning = false;


  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (isDataCalledOnce) {
      searchResponseProvider =
          Provider.of<SearchResponseProvider>(context, listen: true);
    }
    isDataCalledOnce = false;

    final searchProduct = ModalRoute.of(context)!.settings.arguments;
    if(searchProduct != null){
      if(isTextShowing){
        _searchController.text = searchProduct.toString();
      }

    }

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE5E5E5),
      body: SingleChildScrollView(
        controller: _controller,
        child: Column(
          children: [
            buildSectionSearchBar(context),
            const SizedBox(
              height: 30,
            ),
            searchResponseProvider.hasDataLoaded
                ? buildSectionProductView()
                : hasDataSearched
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : const Text(""),
          ],
        ),
      ),
    );
  }

  Column buildSectionProductView() {
    final productList =
        searchResponseProvider.searchResponse?.data?.products?.results;
    return Column(
      children: [
        productList!.isNotEmpty
            ? Padding(
                padding: const EdgeInsets.only(
                    left: 17, right: 17, top: 8, bottom: 8),
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
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
                    return ProductItemView(
                      item: productList[index],
                    );
                  },
                ),
              )
            : const Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    "Data Not Found",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
        if (_isLoadMoreRunning == true)
          const Center(
            child: CircularProgressIndicator(),
          ),
        if (_hasNextPage == false)
          Container(
            padding: const EdgeInsets.only(top: 5, bottom: 5),
            child: const Center(
              child: Text(
                'No more data available',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ),
          ),
      ],
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

                          setState(() {
                            hasDataSearched = true;
                          });
                        },
                        icon: const Icon(Icons.search_rounded)),
                  ),
                  onTap: (){

                    setState(() {
                      isTextShowing = false;
                      _searchController.clear();

                    });

                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _scrollListener() async {
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      setState(() {
        _isLoadMoreRunning = true;
      });

      offsetNumber += 10;
      limitNumber += 10;
      if (offsetNumber <=
          searchResponseProvider.searchResponse!.data!.products!.count!) {
        await searchResponseProvider.setOffset(offsetNumber, limitNumber);
      }
      offsetNumber -= 10;
      limitNumber -= 10;
      setState(() {
        _isLoadMoreRunning = false;
        _hasNextPage = false;
      });
    }
  }
}
