import 'package:dark_horse_book_store/common_widgets/appbar.dart';
import 'package:dark_horse_book_store/common_widgets/click_button.dart';
import 'package:dark_horse_book_store/pages/product_add_page/widgets/textformfield.dart';
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //상품 이미지 등록칸
              GestureDetector(
                onTap: () {
                  //이미지 선택 시 갤러리 및 카메라 접근 로직 추가
                  //1. 팝업 다이얼로그를 띄워서 갤러리 또는 카메라 선택

                  //2. 선택된 이미지로 상품 이미지 업데이트
                },
                child: Container(
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
              ),

              SizedBox(height: 20),
              //1. 상품 이름 입력란
              Text(
                '상품 이름',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              textformField(
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
              textformField(
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
              textformField(
                _textEditingContentController,
                '상품 설명을 입력해주세요',
                TextInputAction.done,
                5, // 최대 줄 수 설정
              ),

              //등록버튼
              SizedBox(height: 20),
              ClickButton(
                onPressed: () {
                  //등록 버튼 클릭 시 상품 등록 로직 추가
                  //1. 입력된 정보 가져오기
                  String title = _textEditingTitleController.text;
                  String price = _textEditingPriceController.text;
                  String content = _textEditingContentController.text;

                  //2. 상품 등록 API 호출 또는 로컬 데이터베이스에 저장

                  //3. 성공 시 알림 메시지 표시 및 페이지 이동
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text('상품이 등록되었습니다!')));
                },
                text: '등록하기',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
