import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

//도서 정보를 보여주는 카드형 리스트 아이템 위젯
//상품목록페이지(product_list)와 상품 등록 페이지(product_add)에 사용

class ProductItem extends StatelessWidget {
  ProductItem({super.key, required this.bookTitle, required this.price});

  String bookTitle;
  int price;

  //세자리수 끊어 표기 (#,###)
  final NumberFormat formatter = NumberFormat('#,###');

  @override
  Widget build(BuildContext context) {
    //제일 큰 틀(정보 한묶음)
    return Container(
      width: double.infinity,
      height: 140,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Color(0xFFFFFFF0),
        border: Border.all(color: Colors.brown[200]!),
      ),
      child: Row(
        children: [
          SizedBox(width: 10),
          //이미지 부분
          Container(
            width: 90,
            height: 120,

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.brown[100],
              border: Border.all(color: Colors.brown[200]!),
            ),
          ),
          SizedBox(width: 12),
          //텍스트 정보
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  bookTitle,
                  softWrap: true,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 15),
                Text(
                  '₩ ${formatter.format(price)} 원',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
