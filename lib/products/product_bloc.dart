

import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_blocexer/basic_bloc.dart';
import 'package:flutter_blocexer/products/product.dart';
import 'package:flutter_blocexer/remote/repository.dart';

class ProductBloc extends BlocBase{

  final StreamController<List<Data>> _productCounter = StreamController<List<Data>>();

  Stream<List<Data>> get productStream => _productCounter.stream;

  Future callApi() async{
    new Repository().callApi().then((value){
      print('API ${value.data.length}');
      _productCounter.sink.add(value.data);
    }).catchError((error){
      print('API error $error');
      _productCounter.addError(error);
    });
  }

  @override
  void dispose() {
    _productCounter.close();
  }
}

