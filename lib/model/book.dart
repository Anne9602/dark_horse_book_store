import 'dart:io';

class Book {
  String id;
  String title;
  int price;
  String? content;
  File image;

  Book({
    required this.title,
    required this.price,
    this.content,
    required this.image,
  }) : id = DateTime.now().millisecondsSinceEpoch.toString();
}
