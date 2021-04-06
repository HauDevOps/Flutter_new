import 'package:flutter/material.dart';
import 'package:flutter_blocexer/basic_bloc.dart';
import 'package:flutter_blocexer/products/product.dart';
import 'package:flutter_blocexer/products/product_bloc.dart';
import 'package:flutter_blocexer/products/product_model.dart';

class ProductPage extends StatefulWidget {
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  ProductBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<ProductBloc>(context);
    bloc.callApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users'),
      ),
      body: Column(
        children: [
          _titleWidget(),
          StreamBuilder(
            stream: bloc.productStream,
            builder:
                (BuildContext context, AsyncSnapshot<List<Data>> snapShot) {
              if (!snapShot.hasData) {
                return Center(
                  child: Text('Data not found'),
                );
              }
              return Container(
                height: 250,
                child: Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.all(8),
                    itemCount: snapShot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        width: MediaQuery.of(context).size.width / 2,
                        height: 10,
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          border: Border.all(width: 1, color: Colors.black26),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Stack(
                          children: [
                            Image.network(snapShot.data[index].product.thumbnailUrl)
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
