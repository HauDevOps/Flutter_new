import 'dart:async';
import 'package:flutter_blocexer/basic_bloc.dart';
import 'package:rxdart/rxdart.dart';

class CounterBloc extends BlocBase {
  var count = 0;
  var countController = BehaviorSubject<int>();
  //Sink get countSink => countController.sink;
  Stream<int> get countStream => countController.stream;

  @override
  void dispose() {
    countController.close();
  }

  void increment() {
    countController.sink.add(count++);
  }

  void decrement() {
    if (count >= 0) {
      countController.sink.add(count--);
    }
  }
}
