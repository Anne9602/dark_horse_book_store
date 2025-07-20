// Flutter의 기본 위젯들을 사용하기 위한 import
import 'package:flutter/material.dart';
// 우리가 만든 CartItemTile 위젯을 가져오기 위한 import
import 'widgets/cart_item_tile.dart';

// 장바구니 페이지를 나타내는 위젯
// StatefulWidget을 사용하는 이유: 장바구니 아이템의 수량이 변경되거나 아이템이 삭제될 때 화면을 다시 그려야 하기 때문
class CartPage extends StatefulWidget {
  // 위젯 생성자 - super.key는 부모 위젯에서 전달받은 키를 그대로 전달
  const CartPage({super.key});

  // StatefulWidget은 반드시 createState() 메서드를 구현해야 함
  // 이 메서드는 위젯의 상태를 관리하는 State 객체를 생성
  @override
  State<CartPage> createState() => _CartPageState();
}

// CartPage의 상태를 관리하는 클래스
// State 클래스를 상속받아 위젯의 상태 변화를 처리
class _CartPageState extends State<CartPage> {
  // 장바구니에 담긴 책 정보를 저장하는 리스트
  // Map<String, dynamic>은 키-값 쌍으로 데이터를 저장하는 자료구조
  // dynamic은 어떤 타입의 값이든 저장할 수 있다는 의미
  List<Map<String, dynamic>> cartItems = [
    {"title": "데미안", "price": 16000, "quantity": 1},      // 책 제목, 가격, 수량
    {"title": "어린 왕자", "price": 13500, "quantity": 1},
    {"title": "죄와 벌", "price": 18000, "quantity": 1},
    {"title": "1984", "price": 15000, "quantity": 1},
    {"title": "연금술사", "price": 14000, "quantity": 1},
  ];

  // 총 금액을 계산하는 함수
  // fold() 메서드는 리스트의 모든 요소를 순회하면서 값을 누적
  // 0은 초기값, (sum, item) => ... 는 각 요소를 처리하는 함수
  int getTotalPrice() {
    return cartItems.fold(0, (sum, item) => sum + item['price'] * item['quantity']);
  }

  // 위젯을 그리는 메서드 - UI를 구성하는 부분
  @override
  Widget build(BuildContext context) {
    // Scaffold: 앱의 기본 레이아웃 구조를 제공하는 위젯
    // 앱바, 본문, 플로팅 액션 버튼 등을 포함
    return Scaffold(
      // 배경색을 아이보리 톤으로 설정
      backgroundColor: const Color(0xFFFAF5EF),
      
      // 앱 상단의 앱바 (제목 표시줄)
      appBar: AppBar(
        // 앱바에 표시될 제목
        title: const Text("다크호스 서점", style: TextStyle(fontWeight: FontWeight.bold)),
        // 앱바의 배경색을 브라운으로 설정
        backgroundColor: const Color(0xFF8B4513),
        // 앱바의 텍스트와 아이콘 색상을 흰색으로 설정
        foregroundColor: Colors.white,
        // 앱바 왼쪽의 뒤로가기 버튼
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // 뒤로가기 버튼을 누르면 이전 화면으로 돌아감
            Navigator.pop(context);
          },
        ),
      ),
      
      // 앱의 본문 부분
      body: cartItems.isEmpty
          ? const Center(
              // 장바구니가 비어있을 때 표시되는 메시지
              child: Text(
                "장바구니가 비어있습니다.",
                style: TextStyle(fontSize: 16),
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
                    color: Colors.white, // 배경색
                    borderRadius: BorderRadius.circular(10), // 모서리를 둥글게
                    boxShadow: [
                      // 그림자 효과
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1), // 그림자 색상
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
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF8B4513)),
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
                      backgroundColor: const Color(0xFF8B4513), // 버튼 배경색
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
                          title: const Text("구매 완료"),
                          content: const Text("책을 구매해주셔서 감사합니다!"),
                          actions: [
                            // TextButton: 텍스트만 있는 버튼
                            TextButton(
                              onPressed: () => Navigator.pop(context), // 다이얼로그 닫기
                              child: const Text("확인"),
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
