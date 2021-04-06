import 'package:flutter_blocexer/products/product.dart';
import 'package:flutter_blocexer/products/product_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class ProductService{
  static var _url = Uri.parse("https://api.tiki.vn/v2/widget/deals/hot");
  static Future browse() async{
    List collection;
    List<Products> _contacts;
    var response = await http.get(_url);
    if (response.statusCode == 200) {
      collection = convert.jsonDecode(response.body);
      _contacts = collection.map((json) => Products.fromJson(json)).toList();
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    return _contacts;
  }


}