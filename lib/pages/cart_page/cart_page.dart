import 'package:flutter/material.dart';
import 'package:dark_horse_book_store/common_widgets/appbar.dart';
import 'widgets/cart_item_tile.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  // 장바구니에 담긴 책 정보를 저장하는 리스트 (빈 리스트로 시작)
  List<Map<String, dynamic>> cartItems = [];

  // 총 금액을 계산하는 함수
  int getTotalPrice() {
    return cartItems.fold(0, (sum, item) => sum + (item['price'] as int) * (item['quantity'] as int));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 배경색을 아이보리 톤으로 설정
      backgroundColor: const Color(0xFFFAF5EF),
      
      // 공통 앱바 사용
      appBar: BuildAppbar(title: '🐴 장바구니'),
      
      // 앱의 본문 부분
      body: cartItems.isEmpty
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
                          // setState: 위젯을 다시 그리도록 하는 메서드
                          setState(() {
                            item['quantity']++; // 수량 1 증가
                          });
                        },
                        // 수량 감소 버튼을 눌렀을 때 실행될 함수
                        onRemove: () {
                          setState(() {
                            // 수량이 1보다 클 때만 감소
                            if (item['quantity'] > 1) {
                              item['quantity']--;
                            }
                          });
                        },
                        // 삭제 버튼을 눌렀을 때 실행될 함수
                        onDelete: () {
                          setState(() {
                            // 해당 인덱스의 아이템을 리스트에서 제거
                            cartItems.removeAt(index);
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
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      // 실제 총 금액 텍스트
                      Text(
                        "${getTotalPrice().toString()}원",
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.brown),
                      ),
                    ],
                  ),
                ),

                // 구매하기 버튼
                Padding(
                  // 버튼 주변에 여백 추가
                  padding: const EdgeInsets.all(16.0),
                  // ElevatedButton: 입체감이 있는 버튼
                  child: ElevatedButton(
                    // 버튼의 스타일 설정
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.brown, // 버튼 배경색
                      foregroundColor: Colors.white, // 버튼 텍스트 색상
                      minimumSize: const Size(double.infinity, 50), // 버튼 최소 크기 (가로 전체, 세로 50)
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10), // 모서리를 둥글게
                      ),
                    ),
                    // 버튼을 눌렀을 때 실행될 함수
                    onPressed: () {
                      // 다이얼로그를 표시하는 메서드
                      showDialog(
                        context: context,
                        // AlertDialog: 확인/취소 버튼이 있는 팝업 창
                        builder: (context) => AlertDialog(
                          backgroundColor: const Color(0xFFFAF5EF), // 아이보리 배경
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
                              onPressed: () => Navigator.pop(context), // 다이얼로그 닫기
                              child: Text(
                                "확인",
                                style: TextStyle(
                                  color: Colors.brown,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                    // 버튼에 표시될 텍스트
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