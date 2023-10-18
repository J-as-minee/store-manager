import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'product.dart';
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

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
    // retrieveProductInfo();
    getProductsFromFirestore();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('List of Products'),
        centerTitle: true,
        elevation: 0,
      ),

      body: ListView(
            children: <Widget>[

              SizedBox(height: 50.0),

              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/add');
                  },
                  child: Text('ADD PRODUCT'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    minimumSize: Size(150, 50),
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

  Future<List<Product>> getProductsFromFirestore() async {
    List<Product> products = [];

    try {
      CollectionReference productsCollection = FirebaseFirestore.instance.collection('products');
      QuerySnapshot querySnapshot = await productsCollection.get();

      if (querySnapshot.docs.isNotEmpty) {
        for (QueryDocumentSnapshot document in querySnapshot.docs) {
          Map<String, dynamic> data = document.data() as Map<String, dynamic>;
          Product product = Product.fromJson(data);
          products.add(product);
        }
      } else {
        print('The collection is empty');
      }
    } catch (e) {
      print('Error while fetching products from Firestore: $e');
    }

    return products;
  }

  void retrieveProductInfo() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    // prodName = sp.getString('prodName') ?? '';
    // prodPrice = sp.getInt('prodPrice') ?? 0;
    // prodQuantity = sp.getInt('prodQuantity') ?? 0;
    List<String> productsJsonList = sp.getStringList('') ?? [];

    productList = productsJsonList
        .map((productJson) => Product.fromJson(jsonDecode(productJson)))
        .toList();

    setState(() {});
  }
}
