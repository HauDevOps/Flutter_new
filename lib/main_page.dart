import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blocexer/basic_bloc.dart';
import 'package:flutter_blocexer/main_bloc.dart';
import 'package:rxdart/subjects.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    CounterBloc bloc = BlocProvider.of<CounterBloc>(context);
    return Scaffold(
        appBar: AppBar(
            title: Text(
          "BLoC Architecture",
        )),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {
                  bloc.increment();
                },
                child: Text('+'),
              ),
              StreamBuilder(
                  stream: bloc.countStream,
                  builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                    if (!snapshot.hasData) {
                      return Text('0');
                    }
                    return Text(snapshot.data.toString());
                  }),
              ElevatedButton(
                onPressed: () {
                  bloc.decrement();
                },
                child: Text('-'),
              ),
            ],
          ),
        ));
  }
}
