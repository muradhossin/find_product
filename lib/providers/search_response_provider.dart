import 'dart:convert';

import 'package:find_product/models/search_response.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SearchResponseProvider extends ChangeNotifier{
  SearchResponse? searchResponse;
  String? searchData;
  int offset = 10;
  int limit = 10;

  bool get hasDataLoaded => searchResponse != null;


  Future<void> setOffset(int number, int limNumber) async{
    offset = number;
    limit = limNumber;
    await getSearchData();
  }

  void setSearchData(String text) {
    searchData = text;
    getSearchData();
  }

  Future<void> getSearchData() async{
    final urlString = "https://panel.supplyline.network/api/product/search-suggestions/?limit=$limit&offset=$offset&search=$searchData";
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