import 'dart:io';
import 'dart:convert';

void readFromJson() {
  var file = File('/home/davit/Desktop/mobilelessons_23/homework_6/Files/books.json');
  final String strJsonData = file.readAsStringSync();
  final Map<String, dynamic> jsonData = jsonDecode(strJsonData);
  final List<dynamic> books = jsonData['books'];

  List<Map<String, dynamic>> oldBooks = [];
  List<Map<String, dynamic>> newBooks = [];

  for (var book in books) {
    String title = book['title'];
    String author = book['author'];
    int puby = int.tryParse(book['publication year']) ?? 0;

    if (puby <= 2000) {
      oldBooks.add({'title': title, 'author': author, 'publication year': puby});
    } else {
      newBooks.add({'title': title, 'author': author, 'publication year': puby});
    }
  }

  File oldBooksFile = File('/home/davit/Desktop/mobilelessons_23/homework_6/Files/old-books.json');
  oldBooksFile.writeAsStringSync(jsonEncode({'books': oldBooks}));

  File newBooksFile = File('/home/davit/Desktop/mobilelessons_23/homework_6/Files/new-books.json');
  newBooksFile.writeAsStringSync(jsonEncode({'books': newBooks}));
}

void main() {
  readFromJson();
}

