import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 상단 앱바 (뒤로가기 버튼은 기본 제공됨)
      appBar: AppBar(
        title: const Text('장바구니'), // 페이지 타이틀
        centerTitle: true, // 타이틀 가운데 정렬
      ),

      // 본문 영역
      body: const Center(
        // 장바구니가 비어있을 때 기본으로 보여줄 메시지
        child: Text(
          '장바구니가 비어있습니다.',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
