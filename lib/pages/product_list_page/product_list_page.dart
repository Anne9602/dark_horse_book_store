import 'package:dark_horse_book_store/common_widgets/widgets.dart';
import 'package:flutter/material.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: BuildAppbar(title: '🐴 다크호스 서점'));
  }
}
