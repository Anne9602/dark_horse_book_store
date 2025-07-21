import 'package:dark_horse_book_store/common_widgets/appbar.dart';
import 'package:flutter/material.dart';

/// 상품 등록 페이지
class ProductAddPage extends StatelessWidget {
  ProductAddPage({super.key});

  TextEditingController _textEditingTitleController = TextEditingController();
  TextEditingController _textEditingPriceController = TextEditingController();
  TextEditingController _textEditingContentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BuildAppbar(title: "상품 등록"),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //상품 이미지 등록칸
            Container(
              width: double.infinity,
              height: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.brown[100],
              ),
              child: Center(
                child: Text(
                  '이미지 선택',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown,
                  ),
                ),
              ),
            ),

            SizedBox(height: 20),
            //1. 상품 이름 입력란
            Text(
              '상품 이름',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            _textformField(
              _textEditingTitleController,
              '상품이름을 입력하세요',
              TextInputAction.next,
            ),
            SizedBox(height: 20),
            //2. 성품 가격 입련란
            Text(
              '상품 가격',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            _textformField(
              _textEditingPriceController,
              '상품 가격을 입력해주세요',
              TextInputAction.next,
            ),
            SizedBox(height: 20),
            //3. 상품 설명 입력란
            Text(
              '상품 설명',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            _textformField(
              _textEditingContentController,
              '상품 설명을 입력해주세요',
              TextInputAction.done,
            ),

            //등록버튼
            SizedBox(height: 20),
            SizedBox(
              height: 50,
              width: double.infinity,

              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  //등록 버튼 누르기
                },
                child: Text(
                  '등록하기',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //입력란 매서드
  TextFormField _textformField(
    controller,
    String hintText,
    TextInputAction inputAction,
  ) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.brown[200]!, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.brown[400]!, width: 3),
        ),
      ),
      textInputAction: inputAction,
    );
  }
}
