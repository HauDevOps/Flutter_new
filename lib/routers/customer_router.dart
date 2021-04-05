import 'package:flutter/material.dart';
import 'package:flutter_blocexer/basic_bloc.dart';
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
        return MaterialPageRoute(builder: (_) => null);
    }
  }
}
