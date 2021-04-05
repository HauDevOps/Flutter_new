import 'package:flutter/material.dart';
import 'package:flutter_blocexer/api/api_bloc.dart';
import 'package:flutter_blocexer/api/api_page.dart';
import 'package:flutter_blocexer/basic_bloc.dart';
import 'package:flutter_blocexer/color/color_bloc.dart';
import 'package:flutter_blocexer/color/color_page.dart';
import 'package:flutter_blocexer/main_bloc.dart';
import 'package:flutter_blocexer/main_page.dart';
import 'package:flutter_blocexer/routers/router_name.dart';

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
        return MaterialPageRoute(builder: (_) => null);
    }
  }
}
