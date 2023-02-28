import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:store_app_api/Services/update_product_services.dart';
import 'package:store_app_api/screen/home_page.dart';
import 'package:store_app_api/screen/update_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      title: 'Store App',
      home: HomePage(),
      routes: {
        'updateScreen': (context) => UpdateProductPage(),

      },
    );
  }
}

