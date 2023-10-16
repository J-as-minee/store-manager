import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text('Store Manager'),
        centerTitle: true,
        // backgroundColor: Colors.grey[800],
        elevation: 0,
      ),

      body: Container(
        // color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,


          children: <Widget>[
            Center(

              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, '/add');
                },

                // style: ElevatedButton.styleFrom(
                //   backgroundColor: Colors.grey[800],
                // ),

                icon: Icon(Icons.add),

                label: Text(
                  'Add Product',
                  style: TextStyle(
                      fontSize: 20.0,
                      letterSpacing: 2.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(height: 25.0),

            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, '/list');
                },

                style: ElevatedButton.styleFrom(
                  // backgroundColor: Colors.grey[800],
                ),

                icon: Icon(Icons.list),

                label: Text(
                  'View Product',
                  style: TextStyle(
                      fontSize: 20.0,
                      letterSpacing: 2.0,
                      fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
