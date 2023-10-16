import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductList extends StatefulWidget {
  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {

  String prodName = '';
  int prodPrice = 0;
  int prodQuantity = 0;


  @override
  void initState() {
    super.initState();
    retrieveProductInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,

      appBar: AppBar(
        // backgroundColor: Colors.grey[800],
        title: Text('List of Products'),
        centerTitle: true,
        elevation: 0,
      ),

      body: Container(
        child: Column(
          children: <Widget>[
            Text('Stored Product Name: $prodName'),
            Text('Stored Product Price: $prodPrice'),
            Text('Stored Product Quantity: $prodQuantity'),

            SizedBox(height: 20.0),
          ],
        ),
      ),

    );
  }

  void retrieveProductInfo() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    prodName = sp.getString('prodName') ?? '';
    prodPrice = sp.getInt('prodPrice') ?? 0;
    prodQuantity = sp.getInt('prodQuantity') ?? 0;
    setState(() {});
  }
}
