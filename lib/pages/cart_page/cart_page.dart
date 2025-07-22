import 'package:dark_horse_book_store/common_widgets/click_button.dart';
import 'package:flutter/material.dart';
import 'package:dark_horse_book_store/common_widgets/appbar.dart';
import 'package:dark_horse_book_store/model/cart_manager.dart';
import 'widgets/cart_item_tile.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  // CartManager에서 장바구니 아이템들을 가져오는 getter
  List<Map<String, dynamic>> get cartItems => CartManager.getCartItems();

  // 총 금액을 계산하는 함수
  int getTotalPrice() {
    return CartManager.getTotalPrice();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 배경색을 아이보리 톤으로 설정
      backgroundColor: const Color(0xFFFAF5EF),

      // 공통 앱바 사용
      appBar: BuildAppbar(title: '🐴 장바구니'),

      // 앱의 본문 부분
      body:
          cartItems.isEmpty
              ? Center(
                // 장바구니가 비어있을 때 표시되는 메시지
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.shopping_cart_outlined,
                      size: 80,
                      color: Colors.brown.withOpacity(0.5),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "장바구니가 비어있습니다.",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.brown.withOpacity(0.7),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "책을 추가해보세요!",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.brown.withOpacity(0.5),
                      ),
                    ),
                  ],
                ),
              )
              : Column(
                // Column: 자식 위젯들을 세로로 배치하는 위젯
                children: [
                  // Expanded: 남은 공간을 모두 차지하도록 하는 위젯
                  Expanded(
                    // ListView.builder: 리스트 형태로 위젯들을 생성하는 위젯
                    // 메모리 효율적: 화면에 보이는 항목만 생성
                    child: ListView.builder(
                      // 리스트의 총 개수
                      itemCount: cartItems.length,
                      // 각 항목을 어떻게 그릴지 정의하는 함수
                      itemBuilder: (context, index) {
                        // 현재 인덱스의 아이템 정보 가져오기
                        final item = cartItems[index];
                        // CartItemTile 위젯을 반환
                        return CartItemTile(
                          item: item,
                          // 수량 증가 버튼을 눌렀을 때 실행될 함수
                          onAdd: () {
                            setState(() {
                              CartManager.updateQuantity(index, item['quantity'] + 1);
                            });
                          },
                          // 수량 감소 버튼을 눌렀을 때 실행될 함수
                          onRemove: () {
                            setState(() {
                              // 수량이 1보다 클 때만 감소
                              if (item['quantity'] > 1) {
                                CartManager.updateQuantity(index, item['quantity'] - 1);
                              }
                            });
                          },
                          // 삭제 버튼을 눌렀을 때 실행될 함수
                          onDelete: () {
                            setState(() {
                              CartManager.removeFromCart(index);
                            });
                          },
                        );
                      },
                    ),
                  ),

                  // 총 금액을 표시하는 컨테이너
                  Container(
                    // 내부 여백 설정
                    padding: const EdgeInsets.all(16.0),
                    // 컨테이너의 스타일 설정
                    decoration: BoxDecoration(
                      color: const Color(0xFFFAF5EF), // 아이보리 톤
                      borderRadius: BorderRadius.circular(10), // 모서리를 둥글게
                      border: Border.all(
                        color: Colors.brown.withOpacity(0.2),
                        width: 1,
                      ),
                      boxShadow: [
                        // 그림자 효과
                        BoxShadow(
                          color: Colors.brown.withOpacity(0.1), // 그림자 색상
                          spreadRadius: 1, // 그림자 확산 정도
                          blurRadius: 3, // 그림자 흐림 정도
                          offset: const Offset(0, 1), // 그림자 위치 (x, y)
                        ),
                      ],
                    ),
                    // 외부 여백 설정
                    margin: const EdgeInsets.symmetric(horizontal: 16.0),
                    // Row: 자식 위젯들을 가로로 배치
                    child: Row(
                      // 자식 위젯들을 양 끝으로 배치
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // "총 금액:" 텍스트
                        const Text(
                          "총 금액:",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // 실제 총 금액 텍스트
                        Text(
                          "${getTotalPrice().toString()}원",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.brown,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // 구매하기 버튼
                  Padding(
                    // 버튼 주변에 여백 추가
                    padding: const EdgeInsets.all(16.0),
                    // ElevatedButton: 입체감이 있는 버튼
                    child: ClickButton(
                      text: "구매하기",
                      onPressed: () {
                        // 다이얼로그를 표시하는 메서드
                        showDialog(
                          context: context,
                          // AlertDialog: 확인/취소 버튼이 있는 팝업 창
                          builder:
                              (context) => AlertDialog(
                                backgroundColor: const Color(
                                  0xFFFAF5EF,
                                ), // 아이보리 배경
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                title: Text(
                                  "구매 완료",
                                  style: TextStyle(
                                    color: Colors.brown,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                content: Text(
                                  "책을 구매해주셔서 감사합니다!",
                                  style: TextStyle(
                                    color: Colors.brown.withOpacity(0.8),
                                  ),
                                ),
                                actions: [
                                  // TextButton: 텍스트만 있는 버튼
                                  TextButton(
                                    onPressed:
                                        () =>
                                            Navigator.pop(context), // 다이얼로그 닫기
                                    child: Text(
                                      "확인",
                                      style: TextStyle(
                                        color: Colors.brown,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                        );
                      },
                    ),
                  ),
                ],
              ),
    );
  }
}
