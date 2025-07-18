import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});


@override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  // 장바구니에 담긴 책 정보를 리스트로 정의
  List<Map<String, dynamic>> cartItems = [
    {"title": "데미안", "price": 16000, "quantity": 1},
    {"title": "어린 왕자", "price": 13500, "quantity": 1},
    {"title": "죄와 벌", "price": 18000, "quantity": 1},
    {"title": "1984", "price": 15000, "quantity": 1},
    {"title": "연금술사", "price": 14000, "quantity": 1},
  ];


  // 총 금액 계산 함수
  int getTotalPrice() {
    return cartItems.fold(0, (sum, item) => sum + item['price'] * item['quantity']);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF5EF), // 아이보리 톤 배경
      appBar: AppBar(
        title: const Text("다크호스 서점", style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFFB89C84), // 브라운 톤 상단바
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // 뒤로가기 기능
          },
        ),
      ),
      // 본문 영역
      body: cartItems.isEmpty
          ? const Center(
              // 장바구니가 비어있을 때 표시되는 화면
              child: Text(
                "장바구니가 비어있습니다.",
                style: TextStyle(fontSize: 16),
              ),
            )
          : Column(
              children: [
                // 장바구니에 담긴 항목들을 리스트로 출력
                Expanded(
                  child: ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      final item = cartItems[index];
                      return CartItemTile(
                        item: item,
                        onAdd: () {
                          setState(() {
                            item['quantity']++;
                          });
                        },
                        onRemove: () {
                          setState(() {
                            if (item['quantity'] > 1) {
                              item['quantity']--;
                            }
                          });
                        },
                        onDelete: () {
                          setState(() {
                            cartItems.removeAt(index);
                          });
                        },
                      );
                    },
                  ),
                ),

                // 구매하기 버튼
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFB89C84),
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      // 구매하기 버튼 클릭 시 다이얼로그 표시
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text("구매 완료"),
                          content: const Text("책을 구매해주셔서 감사합니다!"),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text("확인"),
                            )
                          ],
                        ),
                      );
                    },
                    child: const Text(
                      "구매하기",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
