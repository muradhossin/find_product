import 'package:find_product/pages/product_details_page.dart';
import 'package:find_product/pages/search_page.dart';
import 'package:find_product/providers/search_response_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => SearchResponseProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SearchPage.routeName,
      routes: {
        SearchPage.routeName: (context) => SearchPage(),
        ProductDetailsPage.routeName: (context) => ProductDetailsPage()
      },
    );
  }
}
