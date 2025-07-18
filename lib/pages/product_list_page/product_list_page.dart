import 'package:dark_horse_book_store/common_widgets/product_item.dart';
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
    return Scaffold(
      appBar: BuildAppbar(title: '🐴 다크호스 서점'),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView.separated(
          separatorBuilder: (context, index) {
            return SizedBox(height: 10);
          },
          itemCount: 10,
          itemBuilder: (context, index) {
            //상품 목록 리스트
            return ProductItem(bookTitle: '삐에로는 우릴보며 웃지', price: 15000);
          },
        ),
      ),
    );
  }
}
