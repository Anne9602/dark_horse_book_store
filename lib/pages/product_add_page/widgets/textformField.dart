import 'package:flutter/material.dart';

//입력란 매서드
TextFormField textformField(
  controller,
  String hintText,
  TextInputAction inputAction, [
  int? maxLine, //옵션파라미터
]) {
  return TextFormField(
    controller: controller,
    maxLines: maxLine ?? 1, //기본 한줄세팅
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
