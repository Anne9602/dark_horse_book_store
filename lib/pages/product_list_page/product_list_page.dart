import 'dart:io';

import 'package:dark_horse_book_store/common_widgets/product_item.dart';
import 'package:dark_horse_book_store/common_widgets/appbar.dart';
import 'package:dark_horse_book_store/model/book.dart';
import 'package:dark_horse_book_store/pages/product_add_page/product_add_page.dart';
import 'package:dark_horse_book_store/pages/product_detail_page/product_detail_page.dart';
import 'package:flutter/material.dart';

/// 상품 목록 페이지
class ProductListPage extends StatefulWidget {
  ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  List<Book> books = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BuildAppbar(title: '🐴 다크호스 서점'),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child:
            //리스트에 아무것도 없을 경우 상품없음으로 표시
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
                    return GestureDetector(
                      child: ProductItem(book: books[index]),
                      onTap: () {
                        //상품상페이지로이동
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) =>
                                    ProductDetailPage(book: books[index]),
                          ),
                        );
                      },
                    );
                  },
                ),
      ),
      //상품 등록 페이지로 이동
      floatingActionButton: floatingButton(context),
    );
  }

  /// 상품 등록 페이지로 이동하는 플로팅 버튼

  FloatingActionButton floatingButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        //상품 등록 페이지로 이동
        var result = await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProductAddPage()),
        );
        if (result != null) {
          setState(() {
            books.add(result as Book);
          });
        }
      },
      backgroundColor: Colors.brown,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      child: Icon(Icons.add, size: 30),
    );
  }
}
