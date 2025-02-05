import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blocexer/basic_bloc.dart';
import 'package:flutter_blocexer/products/product.dart';
import 'package:flutter_blocexer/products/product_bloc.dart';

class ProductPage extends StatefulWidget {
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  ProductBloc bloc;
  int _selectedIndex = 0;

  // void checkString() {
  //   const String strings =
  //       'https://meatdeli.com.vn/txng/200039003320403214154028813510';
  //
  //   final lastIndex = strings.lastIndexOf('/');
  //   final strCheck = strings.substring(lastIndex + 1, strings.length);
  //
  //   print('DEVTEst ' + strCheck);
  // }



  String handlerQR(String str) {
    var qrCode = str;

    final lastIndex = str.lastIndexOf('/');
    if(lastIndex != -1){
      qrCode = str.substring(lastIndex + 1, str.length);
    }
    print('TheCuong qrCode $qrCode');
    return qrCode;
  }

  bool isCheckQR(String str, List<String> defines) {
    if (str.isNotEmpty && defines.isNotEmpty) {
      for (final value in defines) {
        if (str.contains(value)) {
          return true;
        }
      }
    }
    return false;
  }

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<ProductBloc>(context);
    bloc.callApi();
    const sTemp = 'https://meatdeli.com.vn/txng/200039003320403214154028813510';
    handlerQR(sTemp);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users'),
      ),
      body: Column(
        children: [
          Container(
              margin: const EdgeInsets.all(20),
              child: Column(
                children: [
                  titleAppbar(),
                  StreamBuilder(
                    stream: bloc.productStream,
                    builder: (BuildContext context,
                        AsyncSnapshot<List<Data>> snapShot) {
                      if (!snapShot.hasData) {
                        return Center(
                          child: Text('Data not found'),
                        );
                      }
                      return Container(
                        color: Colors.grey,
                        height: 260,
                        child: Expanded(
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                            itemCount: snapShot.data.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Card(
                                child: Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.all(10),
                                      child: Stack(
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                            child: Image.network(
                                              snapShot.data[index].product
                                                  .thumbnailUrl,
                                              height: 150.0,
                                              width: 150.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Stack(
                                      children: [
                                        Text(
                                          snapShot.data[index].product.price
                                              .toString(),
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.red),
                                        ),
                                      ],
                                    ),
                                    Stack(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          child: Text(
                                            'Đã bán ' +
                                                snapShot.data[index].progress
                                                    .qtyOrdered
                                                    .toString(),
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                                backgroundColor:
                                                    Colors.red[600]),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ))
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Trang chủ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.table_chart),
            label: 'Danh mục',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fireplace),
            label: 'Lướt',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.chat),
          //   label: 'Chat',
          // ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.person),
          //   label: 'Cá nhân',
          // ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget titleAppbar() {
    return Container(
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(
          'Giá Sốc / Hôm Nay',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: Colors.deepOrange),
        ),
        TweenAnimationBuilder<Duration>(
            duration: Duration(minutes: 60),
            tween: Tween(begin: Duration(minutes: 120), end: Duration.zero),
            onEnd: () {},
            builder: (BuildContext context, Duration value, Widget child) {
              final minutes = value.inMinutes % 60;
              final seconds = value.inSeconds % 60;
              final hour = value.inHours % 24;
              return Container(
                decoration: BoxDecoration(
                    borderRadius:
                        const BorderRadius.all(const Radius.circular(8))),
                child: Row(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Text(
                          "$hour",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.white,
                              backgroundColor: Colors.red),
                        )),
                    Text(" : "),
                    ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Text(
                          "$minutes",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.white,
                              backgroundColor: Colors.red),
                        )),
                    Text(" : "),
                    ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Text(
                          "$seconds",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.white,
                              backgroundColor: Colors.red),
                        )),
                    Text(
                      '>',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.grey),
                    ),
                  ],
                ),
              );
            }),
      ]),
    );
  }
}
