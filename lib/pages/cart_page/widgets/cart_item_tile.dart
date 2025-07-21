import 'package:flutter/material.dart';

// 장바구니 아이템 하나를 표시하는 위젯
class CartItemTile extends StatelessWidget {
  final Map<String, dynamic> item; // 아이템 정보 (제목, 가격, 수량)
  final VoidCallback onAdd; // 수량 증가 버튼을 눌렀을 때 실행될 함수
  final VoidCallback onRemove; // 수량 감소 버튼을 눌렀을 때 실행될 함수
  final VoidCallback onDelete; // 삭제 버튼을 눌렀을 때 실행될 함수

  const CartItemTile({
    super.key,
    required this.item,
    required this.onAdd,
    required this.onRemove,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            // 책 제목과 가격을 표시하는 부분
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item['title'],
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "${item['price'].toString()}원",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.brown.withOpacity(0.7),
                    ),
                  ),
                ],
              ),
            ),

            // 수량 조절 버튼들
            Row(
              children: [
                IconButton(
                  onPressed: onRemove,
                  icon: const Icon(Icons.remove_circle_outline),
                  color: Colors.brown,
                ),
                Text(
                  "${item['quantity']}",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown,
                  ),
                ),
                IconButton(
                  onPressed: onAdd,
                  icon: const Icon(Icons.add_circle_outline),
                  color: Colors.brown,
                ),
              ],
            ),

            // 삭제 버튼
            IconButton(
              onPressed: onDelete,
              icon: const Icon(Icons.delete_outline),
              color: Colors.red[400],
            ),
          ],
        ),
      ),
    );
  }
}
