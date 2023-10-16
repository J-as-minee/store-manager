import 'package:flutter/material.dart';
import 'package:store_manager/home.dart';
import 'package:store_manager/product_entry.dart';
import 'package:store_manager/product_list.dart';

void main() =>
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Home(),
      '/add': (context) => ProductAdd(),
      '/list': (context) => ProductList()
    },
  ));

