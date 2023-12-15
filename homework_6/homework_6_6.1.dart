import 'dart:io';
import 'dart:convert';

void writeToFile(File fileName ,int content) {
  final String ncontent = content.toString();
  fileName.writeAsStringSync(ncontent);
}

int readFromJson(File fileName) {
  final String strJsonData = fileName.readAsStringSync();
  final Map<String, dynamic> jsonData = jsonDecode(strJsonData);
  final List<dynamic> numbers = jsonData['numbers'];
  int a = 0;
  final nlist = numbers.cast<int>(); 
  for(var numm in nlist){
    a += numm;
  }
  return a;
}
void main() {
  final File outFileName = File('/home/davit/Desktop/mobilelessons_23/homework_6/Files/sum.txt');
  final File inFileName = File('/home/davit/Desktop/mobilelessons_23/homework_6/Files/number.json');
  final outputcontent = readFromJson(inFileName);
  writeToFile(outFileName, outputcontent);

}