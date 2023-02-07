import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  static const String routeName = "search";

  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE5E5E5),
      body: Column(
        children: [
          buildSectionSearchBar(context),
        ],
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
                            onPressed: (){},
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
