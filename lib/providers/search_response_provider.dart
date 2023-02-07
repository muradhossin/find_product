import 'dart:convert';

import 'package:find_product/models/search_response.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SearchResponseProvider extends ChangeNotifier{
  SearchResponse? searchResponse;
  String? searchData;
  bool get hasDataLoaded => searchResponse != null;

  void setSearchData(String text) {
    searchData = text;
    getSearchData();
  }

  Future<void> getSearchData() async{
    final urlString = "https://panel.supplyline.network/api/product/search-suggestions/?limit=10&search=$searchData";
    try{
      final response = await http.get(Uri.parse(urlString));
      final map = jsonDecode(response.body);
      if(response.statusCode == 200){
        searchResponse = SearchResponse.fromJson(map);
        notifyListeners();
      }else{
        print(map['message']);
      }
    }catch(error){
      print(error.toString());
    }
  }



}