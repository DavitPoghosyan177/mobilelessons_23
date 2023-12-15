import 'dart:io';
import 'dart:convert';

void readFromJson() {
  var file = File('/home/davit/Desktop/mobilelessons_23/homework_6/Files/books.json');
  final String strJsonData = file.readAsStringSync();
  final Map<String, dynamic> jsonData = jsonDecode(strJsonData);
  final List<dynamic> books = jsonData['books'];

  for (var book in books) {
    String title  = book['title'];
    String author = book['author'];
    String puby     = book['publication year'];

    print('Title: $title, Author: $author , PY: $puby');
  }
}
void main() {
  readFromJson();
}