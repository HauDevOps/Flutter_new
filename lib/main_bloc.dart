import 'dart:async';
import 'dart:developer';

import 'package:flutter_blocexer/basic_bloc.dart';
import 'package:flutter_blocexer/main_page.dart';
import 'package:rxdart/rxdart.dart';


class CounterBloc extends BlocBase{
  var countController = BehaviorSubject<int>();
  Sink get countSink => countController.sink;
  Stream<int> get countStream => countController.stream;

  @override
  void dispose() {
    countController.close();
  }

  var count = 0;

  void increment(){
    count += 1;
    countController.sink.add(count);
  }

  void decrement(){
    count -= 1;
    countController.sink.add(count);
  }

}