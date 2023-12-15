import 'dart:io';
import 'dart:convert';

void readFromJson() {
  var file = File('/home/davit/Desktop/mobilelessons_23/homework_6/Files/number.json');
  final String strJsonData = file.readAsStringSync();
  final Map<String, dynamic> jsonData = jsonDecode(strJsonData);
  final List<dynamic> numbers = jsonData['numbers'];
  int a = 0;
  final nlist = numbers.cast<int>(); 
  for(var numm in nlist){
    a += numm;
  }
  print(a);
}
void main() {
  readFromJson();
}