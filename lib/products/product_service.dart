import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_blocexer/products/product.dart';
import 'package:http/http.dart' as http;
import 'product_model.dart';

class ProductService{

  static Future browse() async{
    Products products;
    Response<Map> response = await Dio().get("https://api.tiki.vn/v2/widget/deals/hot");
    if (response.statusCode == 200) {
      products = Products.fromJson(response.data);
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    return products;
  }


}