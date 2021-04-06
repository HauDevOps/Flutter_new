import 'package:flutter_blocexer/products/product.dart';
import 'package:flutter_blocexer/products/product_model.dart';
import 'package:flutter_blocexer/products/product_service.dart';

class Repository{
  Future<Products> callApi() async{
    return await ProductService.browse();
  }
}