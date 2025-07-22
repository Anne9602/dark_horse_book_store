// 전역 카트 상태를 관리하는 클래스
class CartManager {
  // 장바구니 아이템들을 저장하는 static 리스트
  static List<Map<String, dynamic>> cartItems = [];

  // 장바구니에 상품 추가하는 메서드
  static void addToCart(Map<String, dynamic> item) {
    // 이미 같은 상품이 있는지 확인
    final existingIndex = cartItems.indexWhere((cartItem) => cartItem['id'] == item['id']);
    
    if (existingIndex != -1) {
      // 이미 있는 상품이면 수량만 증가
      cartItems[existingIndex]['quantity'] += item['quantity'];
    } else {
      // 새로운 상품이면 리스트에 추가
      cartItems.add(item);
    }
  }

  // 장바구니에서 상품 제거하는 메서드
  static void removeFromCart(int index) {
    if (index >= 0 && index < cartItems.length) {
      cartItems.removeAt(index);
    }
  }

  // 장바구니 아이템 수량 변경하는 메서드
  static void updateQuantity(int index, int newQuantity) {
    if (index >= 0 && index < cartItems.length) {
      cartItems[index]['quantity'] = newQuantity;
    }
  }

  // 장바구니 비우는 메서드
  static void clearCart() {
    cartItems.clear();
  }

  // 장바구니 아이템 개수 반환하는 메서드
  static int getCartItemCount() {
    return cartItems.length;
  }

  // 총 금액 계산하는 메서드
  static int getTotalPrice() {
    return cartItems.fold(
      0,
      (sum, item) => sum + (item['price'] as int) * (item['quantity'] as int),
    );
  }

  // 장바구니 아이템 리스트 반환하는 메서드
  static List<Map<String, dynamic>> getCartItems() {
    return List.from(cartItems);
  }
} 