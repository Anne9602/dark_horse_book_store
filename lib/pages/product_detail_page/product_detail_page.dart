import 'package:flutter/material.dart';
import 'package:dark_horse_book_store/model/book.dart';
import 'package:dark_horse_book_store/common_widgets/appbar.dart';
import 'package:dark_horse_book_store/common_widgets/click_button.dart';
import 'package:intl/intl.dart';

// 상품 상세 페이지
class ProductDetailPage extends StatefulWidget {
  final Book book; // 상세 정보를 표시할 Book 객체
  const ProductDetailPage({super.key, required this.book});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int quantity = 1; // 구매 수량 상태
  final NumberFormat formatter = NumberFormat('#,###'); // 가격 세자리수 포맷

  // 수량 증가 함수
  void _increment() {
    setState(() {
      quantity++;
    });
  }

  // 수량 감소 함수 (최소 1개)
  void _decrement() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
    }
  }

  // 구매하기 버튼 클릭 시 구매 확인/완료 팝업을 띄우는 함수
  void _showPurchaseDialog() async {
    final result = await showDialog(
      context: context,
      builder: (context) {
        // 1차: 구매 확인 다이얼로그
        return AlertDialog(
          title: Text('구매 확인'),
          content: Text('"${widget.book.title}"을(를) $quantity개 구매하시겠습니까?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false), // 취소
              child: Text('취소'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true), // 확인
              child: Text('확인'),
            ),
          ],
        );
      },
    );
    // 확인을 누른 경우: 구매 완료 다이얼로그
    if (result == true) {
      await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('구매 완료'),
            content: Text('구매가 완료되었습니다!'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(), // 확인
                child: Text('확인'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final book = widget.book;
    return Scaffold(
      // 상단 공통 AppBar
      appBar: BuildAppbar(title: '상세페이지'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 상품 이미지 (상품 등록 페이지와 동일한 규격)
              Container(
                width: double.infinity,
                height: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.brown[100],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.file(book.image, fit: BoxFit.cover),
                ),
              ),
              SizedBox(height: 24),
              // 상품명
              Text(
                book.title,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              // 상품 가격
              Text(
                '₩ ${formatter.format(book.price)} 원',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown,
                ),
              ),
              SizedBox(height: 16),
              // 상품 설명
              Text(
                book.content ?? '',
                style: TextStyle(fontSize: 16, color: Colors.black87),
              ),
              SizedBox(height: 32),
              // 수량 조절(-/+) 및 총 가격 표시 영역
              Row(
                children: [
                  // - 버튼
                  IconButton(
                    onPressed: _decrement,
                    icon: Icon(Icons.remove_circle_outline),
                    color: Colors.brown,
                  ),
                  // 수량 표시
                  Text(
                    '$quantity',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown,
                    ),
                  ),
                  // + 버튼
                  IconButton(
                    onPressed: _increment,
                    icon: Icon(Icons.add_circle_outline),
                    color: Colors.brown,
                  ),
                  SizedBox(width: 16),
                  // 총 가격 표시
                  Text(
                    '총 가격: ₩ ${formatter.format(book.price * quantity)}',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 32),
              // 구매하기 버튼 (공통 위젯)
              ClickButton(text: '구매하기', onPressed: _showPurchaseDialog),
            ],
          ),
        ),
      ),
    );
  }
}
