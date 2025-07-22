import 'book.dart';

class BookManager {
  static List<Book> books = [];

  static void addBook(Book book) {
    books.add(book);
  }

  static void removeBook(Book book) {
    books.remove(book);
  }

  static List<Book> getBooks() {
    return List.from(books);
  }

  static void clear() {
    books.clear();
  }
} 