import 'dart:io';
import 'dart:convert';

void readFromJson() {
  var file = File('/home/davit/Desktop/mobilelessons_23/homework_6/Files/person.json');
  final String strJsonData = file.readAsStringSync();
  final Map<String, dynamic> jsonData = jsonDecode(strJsonData);
  final List<dynamic> employees = jsonData['employees'];

  for (var emp in employees) {
    String name = emp['name'];
    String email = emp['email'];
    print('Name: $name, Email: $email');
  }
}
void main() {
  readFromJson();
}