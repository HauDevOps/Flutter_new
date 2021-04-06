import 'package:flutter/material.dart';
import 'screen_bloc.dart';

class ScreenPage extends StatefulWidget {
  @override
  _ScreenPageState createState() => _ScreenPageState();
}

class _ScreenPageState extends State<ScreenPage> {
  final List<int> numbers = [1, 2, 3, 5, 8, 13, 21, 34, 55];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          _titleWidget(),
          Container(
            height: MediaQuery.of(context).size.width * 0.50,
            width: MediaQuery.of(context).size.width * 10,
            child: _productWidget(context),
          )
        ],
      ),
    );
  }

  Widget _titleWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Giá Sốc Hôm Nay',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.deepOrange),
        ),
        Row(
          children: [
            Text(
              '02:42:02',
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 20, color: Colors.red),
            ),
            Text(
              '>',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.grey),
            ),
          ],
        ),
      ],
    );
  }

  Widget _productWidget(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            LogoBox(),
            LogoBox(),
            LogoBox(),
            LogoBox(),
          ],
        ),
    );
  }
}

class LogoBox extends StatelessWidget {
  const LogoBox({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey,
        border: Border.all(width: 1, color: Colors.black26),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.all(40),
      child: FlutterLogo(
        size: 50,
      ),
    );
  }
}



//   return ListView.builder(
//   scrollDirection: Axis.horizontal,
//   itemCount: numbers.length,
//   itemBuilder: (context, index) {
//   return Container(
//   width: MediaQuery.of(context).size.width * 0.4,
//   child: Card(
//   shape: RoundedRectangleBorder(
//   borderRadius: BorderRadius.circular(20)
//   ),
//   child: Container(
//   width: size.width / 2.5,
//   height: size.width / 2,
//   child: Column(
//   children: [
//   SizedBox(
//   height: 10,
//   ),
//   Text(
//   "Most\nFavorites",
//   style: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
//   ),
//   Text(
//   "20 Items",
//   style: TextStyle(fontSize: 16, color: Colors.white),
//   ),
//   ],
//   )
//
//   ),
//   ),
//   );
//   },
//   );
// }

// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(15),
// ),
// ),
// Card(
// child: Container(
// width: size.width / 2.5,
// height: size.width / 2,
// ),
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(15),
// ),
// ),
// Card(
// child: Container(
// width: size.width / 2.5,
// height: size.width / 2,
// ),
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(15),
// ),
// ),
// Card(
// child: Container(
// width: size.width / 2.5,
// height: size.width / 2,
// ),
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(15),
// ),
// ),
