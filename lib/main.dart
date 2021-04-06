
import 'package:flutter/material.dart';
import 'package:flutter_blocexer/routers/customer_router.dart';
import 'package:flutter_blocexer/routers/router_name.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: CustomRouter.allRoutes,
      initialRoute: router_product,
    );
  }
}




