import 'package:flutter/material.dart';

//제품 등록 입력란 매서드
TextFormField textformField({
  required controller,
  required String hintText,
  required TextInputAction inputAction,
  int? maxLine, //옵션파라미터
  required FormFieldValidator validator,
}) {
  return TextFormField(
    controller: controller,
    maxLines: maxLine ?? 1, //기본 한줄세팅
    validator: validator,
    decoration: InputDecoration(
      hintText: hintText,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.brown[200]!, width: 2),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.brown[400]!, width: 3),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red, width: 2),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red, width: 3),
      ),
    ),
    textInputAction: inputAction,
  );
}
