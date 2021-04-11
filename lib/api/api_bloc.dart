import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';

import '../basic_bloc.dart';

class ApiBloc extends BlocBase{

  var apiController = BehaviorSubject<String>();
  //Sink get countSink => countController.sink;
  Stream<String> get apiStream => apiController.stream;

  void getData() async {
    var dio = Dio();
    final response = await dio.get('https://api.tiki.vn/v2/widget/deals/hot');
    print(response.data);
    apiController.sink.add(response.data.toString());
  }

  @override
  void dispose() {
    apiController.close();
  }
}

