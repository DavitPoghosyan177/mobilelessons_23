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
    int puby   = int.tryParse(book['publication year']) ?? 0;
    if(puby <= 2000){
      print('Title: $title, Author: $author , PY: $puby');
      }

  }
}
void main() {
  readFromJson();
}