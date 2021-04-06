import 'package:flutter/material.dart';
import 'package:flutter_blocexer/routers/router_name.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../basic_bloc.dart';
import 'color_bloc.dart';

class ColorPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<ColorPage> {
  @override
  Widget build(BuildContext context) {
    ColorBloc bloc = BlocProvider.of<ColorBloc>(context);
    return Scaffold(
        appBar: AppBar(
            title: Text(
          "BLoC Architecture",
        )),
        body: Padding(
          padding: EdgeInsets.only(top: 100.0),
          child: Column(
            children: <Widget>[
              StreamBuilder(
                  initialData: Colors.white,
                  stream: bloc.colorController,
                  builder: (BuildContext context, snapShot) {
                    if (snapShot.hasError) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.width,
                        child: showMessed(),
                      );
                    }
                    return Center(
                      child: Container(
                        height: 200.0,
                        width: 200.0,
                        color: snapShot.data,
                      ),
                    );
                  },),
              ElevatedButton(
                onPressed: () {
                  bloc.changeColors(SelectedColors.red);
                },
                child: Text('Red'),
              ),
              ElevatedButton(
                onPressed: () {
                  bloc.changeColors(SelectedColors.green);
                },
                child: Text('Green'),
              ),
              ElevatedButton(
                onPressed: () {
                  bloc.changeColors(SelectedColors.yellow);
                },
                child: Text('Yellow'),
              ),
              ElevatedButton(
                onPressed: () {
                  bloc.showError();
                },
                child: Text('Show Error'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, router_api);
                },
                child: Text('Switch API'),
              )
            ],
          ),
        ));
  }
  static showMessed(){
    Fluttertoast.showToast(
        msg: "This is Center Short Toast",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }
}
