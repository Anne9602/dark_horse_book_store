// 이미지 선택 팝업 다이얼로그
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

/// 갤러리 또는 카메라에서 이미지 선택
Future<dynamic> clickImage(BuildContext context, void Function(File) callback) {
  return showModalBottomSheet(
    context: context,
    builder: (context) {
      return SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextButton(
              //앨범에서 사진 선택
              onPressed: () {
                Navigator.pop(context);
                getGalleryImage(callback);
              },
              child: Text(
                '갤러리에서 선택',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                //사진촬영
                Navigator.pop(context);
                getCameraImage(callback);
              },
              child: Text(
                '사진촬영하기',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown,
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}

//갤러리에서 사진 선택
Future<void> getGalleryImage(void Function(File) callback) async {
  var image = await ImagePicker().pickImage(source: ImageSource.gallery);
  if (image != null) {
    //선택된 이미지로 상품 이미지 업데이트
    callback(File(image.path));
  }
}

//카메라에서 사진 촬영
Future<void> getCameraImage(void Function(File) callback) async {
  var image = await ImagePicker().pickImage(source: ImageSource.camera);
  if (image != null) {
    //선택된 이미지로 상품 이미지 업데이트
    callback(File(image.path));
  }
}
