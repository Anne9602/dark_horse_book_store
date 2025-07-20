// Flutter의 기본 위젯들을 사용하기 위한 import
import 'package:flutter/material.dart';

// 장바구니 아이템 하나를 표시하는 위젯
// StatelessWidget을 사용하는 이유: 이 위젯은 자체적으로 상태를 변경하지 않고, 
// 부모 위젯(CartPage)에서 전달받은 데이터만 표시하기 때문
class CartItemTile extends StatelessWidget {
  // 위젯에서 사용할 데이터들을 저장하는 변수들
  final Map<String, dynamic> item;    // 아이템 정보 (제목, 가격, 수량)
  final VoidCallback onAdd;           // 수량 증가 버튼을 눌렀을 때 실행될 함수
  final VoidCallback onRemove;        // 수량 감소 버튼을 눌렀을 때 실행될 함수
  final VoidCallback onDelete;        // 삭제 버튼을 눌렀을 때 실행될 함수

  // 위젯 생성자
  // required: 이 매개변수는 반드시 전달해야 한다는 의미
  // super.key: 부모 위젯에서 전달받은 키를 그대로 전달
  const CartItemTile({
    super.key,
    required this.item,
    required this.onAdd,
    required this.onRemove,
    required this.onDelete,
  });

  // 위젯을 그리는 메서드 - UI를 구성하는 부분
  @override
  Widget build(BuildContext context) {
    // Card: 입체감이 있는 카드 형태의 위젯
    return Card(
      // 카드 주변의 여백 설정
      // EdgeInsets.symmetric: 가로와 세로 방향으로 다른 여백 설정
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      // 카드의 그림자 깊이 (0이면 그림자 없음)
      elevation: 2,
      // 카드의 모양 설정
      shape: RoundedRectangleBorder(
        // 모서리를 둥글게 만듦
        borderRadius: BorderRadius.circular(10),
      ),
      // 카드 내부의 내용
      child: Padding(
        // 내부 여백 설정 (모든 방향에 16픽셀)
        padding: const EdgeInsets.all(16.0),
        // Row: 자식 위젯들을 가로로 배치하는 위젯
        child: Row(
          children: [
            // 책 제목과 가격을 표시하는 부분
            // Expanded: 남은 공간을 모두 차지하도록 하는 위젯
            Expanded(
              // Column: 자식 위젯들을 세로로 배치하는 위젯
              child: Column(
                // 자식 위젯들을 왼쪽 정렬
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 책 제목 텍스트
                  Text(
                    item['title'], // Map에서 'title' 키의 값을 가져옴
                    style: const TextStyle(
                      fontSize: 16,           // 글자 크기
                      fontWeight: FontWeight.bold, // 글자를 굵게
                    ),
                  ),
                  // 제목과 가격 사이의 간격
                  const SizedBox(height: 4),
                  // 책 가격 텍스트
                  Text(
                    "${item['price'].toString()}원", // Map에서 'price' 키의 값을 가져와서 문자열로 변환
                    style: const TextStyle(
                      fontSize: 14,     // 글자 크기
                      color: Colors.grey, // 글자 색상을 회색으로
                    ),
                  ),
                ],
              ),
            ),
            
            // 수량 조절 버튼들을 표시하는 부분
            // Row: 버튼들을 가로로 배치
            Row(
              children: [
                // 수량 감소 버튼
                IconButton(
                  // 버튼을 눌렀을 때 실행될 함수
                  onPressed: onRemove,
                  // 버튼에 표시될 아이콘
                  icon: const Icon(Icons.remove_circle_outline),
                  // 아이콘 색상을 브라운으로 설정
                  color: const Color(0xFF8B4513),
                ),
                // 현재 수량을 표시하는 텍스트
                Text(
                  "${item['quantity']}", // Map에서 'quantity' 키의 값을 가져옴
                  style: const TextStyle(
                    fontSize: 16,           // 글자 크기
                    fontWeight: FontWeight.bold, // 글자를 굵게
                  ),
                ),
                // 수량 증가 버튼
                IconButton(
                  // 버튼을 눌렀을 때 실행될 함수
                  onPressed: onAdd,
                  // 버튼에 표시될 아이콘
                  icon: const Icon(Icons.add_circle_outline),
                  // 아이콘 색상을 브라운으로 설정
                  color: const Color(0xFF8B4513),
                ),
              ],
            ),
            
            // 삭제 버튼
            IconButton(
              // 버튼을 눌렀을 때 실행될 함수
              onPressed: onDelete,
              // 버튼에 표시될 아이콘
              icon: const Icon(Icons.delete_outline),
              // 아이콘 색상을 빨간색으로 설정 (삭제 기능임을 시각적으로 표현)
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
} 