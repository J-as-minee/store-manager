import 'package:flutter/material.dart';
import 'package:store_manager/product_entry.dart';
import 'package:store_manager/product_list.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,);
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => ProductList(),
      '/add': (context) => ProductAdd(),
      '/list': (context) => ProductList()
    },
  ));
}
