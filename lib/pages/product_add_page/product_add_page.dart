import 'package:dark_horse_book_store/common_widgets/appbar.dart';
import 'package:flutter/material.dart';

class ProductAddPage extends StatelessWidget {
  const ProductAddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: BuildAppbar(title: "상품 등록"));
  }
}
