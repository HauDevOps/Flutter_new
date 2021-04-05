import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import '../basic_bloc.dart';


class ColorBloc extends BlocBase {
  var colorController = BehaviorSubject<Color>();

  Stream<Color> get colorStream => colorController.stream;

  @override
  void dispose() {
    colorController.close();
  }

  void changeColors(SelectedColors choice) {
    switch (choice) {
      case SelectedColors.red:
        {
          colorController.sink.add(Color(0xffff0000));
        }
        break;
      case SelectedColors.green:
        {
          colorController.sink.add(Color(0xFF42FA44));
        }
        break;
      case SelectedColors.yellow:
        {
          colorController.sink.add(Color(0xFFF6DA4C));
        }
        break;
      default: {
      }
      break;
    }
  }

  void showError(){
    colorController.sink.addError('error');
  }
}

enum SelectedColors{
  red,
  green,
  yellow,
  white
}

