// import 'package:find_product/pages/search_page.dart';
// import 'package:find_product/providers/search_response_provider.dart';
// import 'package:flutter/material.dart';
//
// class SearchBarView extends StatefulWidget {
//   final TextEditingController textEditingController;
//   final SearchResponseProvider searchResponseProvider;
//   const SearchBarView({Key? key, required this.textEditingController, required this.searchResponseProvider,}) : super(key: key);
//
//   @override
//   State<SearchBarView> createState() => _SearchBarViewState();
// }
//
// class _SearchBarViewState extends State<SearchBarView> {
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 148,
//       width: MediaQuery.of(context).size.width,
//       child: Stack(
//         children: [
//           Positioned(
//             top: 100,
//             left: 17,
//             right: 17,
//             child: Container(
//               height: 48,
//               width: MediaQuery.of(context).size.width,
//               decoration: BoxDecoration(
//                 color: const Color(0xFFFFFFFF),
//                 borderRadius: BorderRadius.circular(15),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.only(left: 24, right: 12),
//                 child: TextField(
//                   controller: widget.textEditingController,
//                   decoration: InputDecoration(
//                     border: InputBorder.none,
//                     hintText: "কাঙ্ক্ষিত পণ্যটি খুঁজুন",
//                     suffixIcon: IconButton(
//                         onPressed: () {
//                           widget.searchResponseProvider
//                               .setSearchData(widget.textEditingController.text);
//                           Navigator.pushNamed(context, SearchPage.routeName);
//                         },
//                         icon: const Icon(Icons.search_rounded)),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
