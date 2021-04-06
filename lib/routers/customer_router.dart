import 'package:flutter/material.dart';
import 'package:flutter_blocexer/api/api_bloc.dart';
import 'package:flutter_blocexer/api/api_page.dart';
import 'package:flutter_blocexer/basic_bloc.dart';
import 'package:flutter_blocexer/color/color_bloc.dart';
import 'package:flutter_blocexer/color/color_page.dart';
import 'package:flutter_blocexer/products/product_bloc.dart';
import 'package:flutter_blocexer/products/product_page.dart';
import 'file:///D:/TestAndroid/flutter_blocexer/lib/main/main_bloc.dart';
import 'file:///D:/TestAndroid/flutter_blocexer/lib/main/main_page.dart';
import 'package:flutter_blocexer/routers/router_name.dart';
import 'package:flutter_blocexer/screen_shop/screen_bloc.dart';
import 'package:flutter_blocexer/screen_shop/screen_page.dart';

class CustomRouter {
  static Route<dynamic> allRoutes(RouteSettings settings) {
    switch (settings.name) {
      case router_main:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  child: MainPage(),
                  bloc: CounterBloc(),
                ));
      case router_color:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
              child: ColorPage(),
              bloc: ColorBloc(),
            ));
      case router_api:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
              child: ApiPage(),
              bloc: ApiBloc(),
            ));
      case router_product:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
              child: ProductPage(),
              bloc: ProductBloc(),
            ));
        return MaterialPageRoute(builder: (_) => null);
    }
  }
}
