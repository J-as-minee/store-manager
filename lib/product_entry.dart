import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductAdd extends StatefulWidget {
  @override
  State<ProductAdd> createState() => _ProductAddState();
}

class _ProductAddState extends State<ProductAdd> {
  final textController = TextEditingController();
  final priceController = TextEditingController();
  final quantityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,

      appBar: AppBar(
        // backgroundColor: Colors.grey[800],
        title: Text('Add Product'),
        centerTitle: true,
        elevation: 0,
      ),

      body: SingleChildScrollView(

        child: Container(

          child: Center(

            child: Column(

              crossAxisAlignment: CrossAxisAlignment.center,

              children: <Widget>[

                SizedBox(height: 30.0),

                SizedBox(
                  width: 300,
                  child: TextField(
                    controller: textController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter Product Name',
                    ),
                  ),
                ),

                SizedBox(height: 30.0),

                SizedBox(
                  width: 300,
                  child: TextField(
                    controller: priceController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter Product Price',
                    ),
                  ),
                ),

                SizedBox(height: 30.0),

                SizedBox(
                  width: 300,
                  child: TextField(
                    controller: quantityController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter Product Quantity',
                    ),
                  ),
                ),

                SizedBox(height: 50.0),

                ElevatedButton(
                  onPressed: () {
                    String name = textController.text;
                    int price = 0;
                    int quantity = 0;

                    try {
                      price = int.parse(priceController.text);
                    } catch (e) {
                      print('Invalid price format: ${priceController.text}');
                    }

                    try {
                      quantity = int.parse(quantityController.text);
                    } catch (e) {
                      print(
                          'Invalid quantity format: ${quantityController.text}');
                    }

                    if (price != null && quantity != null) {
                      saveProductToLocalStorage(name, price, quantity);
                      print('$name');
                      print('$price');
                      print('$quantity');
                    }
                  },
                  child: Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void saveProductToLocalStorage(String prodName, int prodPrice, int prodQuantity) async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('prodName', prodName);
    sp.setInt('prodPrice', prodPrice);
    sp.setInt('prodQuantity', prodQuantity);
  }
}
