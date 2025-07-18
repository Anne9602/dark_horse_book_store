import 'package:dark_horse_book_store/common_widgets/product_item.dart';
import 'package:dark_horse_book_store/common_widgets/widgets.dart';
import 'package:dark_horse_book_store/model/book.dart';
import 'package:flutter/material.dart';

class ProductListPage extends StatefulWidget {
  ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  List<Book> books = [
    Book(title: '고구마', price: 15000, image: 'assets/business_model_story.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BuildAppbar(title: '🐴 다크호스 서점'),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child:
            books.isEmpty
                ? Container(
                  height: 140,
                  child: Center(
                    child: Text(
                      '이런..! \n지금은 상품이 없습니다. 🥲',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
                : ListView.separated(
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 10);
                  },
                  itemCount: books.length,
                  itemBuilder: (context, index) {
                    //상품 목록 리스트
                    return ProductItem(book: books[index]);
                  },
                ),
      ),
    );
  }
}
