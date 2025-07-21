import 'package:dark_horse_book_store/common_widgets/appbar.dart';
import 'package:flutter/material.dart';

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
            //상품 이름 입력란
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
            //성품 가격 입련란
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
            //상품 설명 입력란
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
          ],
        ),
      ),
    );
  }

  //텍스트폼필드 매써드
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
