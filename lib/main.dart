import 'package:flutter/material.dart';
import 'package:dark_horse_book_store/pages/product_list_page/product_list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dark Horse Book Store',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFFFFFFF0)),
      ),
      home: ProductListPage(),
    );
  }
}
