import 'package:flutter/material.dart';
import 'package:flutter_blocexer/api/api_bloc.dart';

import '../basic_bloc.dart';

class ApiPage extends StatefulWidget {
  @override
  _ApiPageState createState() => _ApiPageState();
}

class _ApiPageState extends State<ApiPage> {
  @override
  Widget build(BuildContext context) {
    ApiBloc bloc = BlocProvider.of<ApiBloc>(context);
    return Scaffold(
      body: Column(
        children: [
          StreamBuilder(
            stream: bloc.apiController,
            builder: (BuildContext context, snapShot) {
              if (!snapShot.hasData) {
                return Text('');
              }
              return Container(
                height: MediaQuery.of(context).size.width,
                width: MediaQuery.of(context).size.width,
                child: Text(snapShot.data),
              );
            },
          ),
          Align(
            alignment: Alignment.topCenter,
            child: ElevatedButton(
              onPressed: () {
                bloc.getData();
              },
              child: Text('Call API'),
            ),
          ),
        ],
      ),
    );
  }
}
