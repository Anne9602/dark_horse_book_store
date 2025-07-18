import 'package:flutter/material.dart';

class Book {
  String title;
  int price;
  String? content;
  String image;

  Book({
    required this.title,
    required this.price,
    this.content,
    required this.image,
  });
}
