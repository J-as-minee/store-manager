import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'product.dart';
import 'dart:convert';

class ProductList extends StatefulWidget {
  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {

  String prodName = '';
  int prodPrice = 0;
  int prodQuantity = 0;

  List<Product> productList = [];


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

      body: ListView(
            children: <Widget>[

              SizedBox(height: 50.0),

              ElevatedButton(
                  onPressed: (){
                    Navigator.pushNamed(context, '/add');
                  },
                child: Container(
                  width: 250,
                  child: Text(
                    'ADD PRODUCT'
                  ),
                ),
              ),

              for (var product in productList)
                ListTile(
                  title: Text('Product Name: ${product.prodName}'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Price: ${product.prodPrice}'),
                      Text('Quantity: ${product.prodQuantity}'),
                    ],
                  ),
                ),

              SizedBox(height: 50.0),
            ],
          ),
    );
  }

  void retrieveProductInfo() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    // prodName = sp.getString('prodName') ?? '';
    // prodPrice = sp.getInt('prodPrice') ?? 0;
    // prodQuantity = sp.getInt('prodQuantity') ?? 0;
    List<String> productsJsonList = sp.getStringList('products') ?? [];

    productList = productsJsonList
        .map((productJson) => Product.fromJson(jsonDecode(productJson)))
        .toList();

    setState(() {});
  }
}
