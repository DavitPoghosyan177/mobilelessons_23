import 'dart:io';

void writeToFile(File fileName ,String content) {
  fileName.writeAsStringSync(content);
}

void main(){
  final File fileName = File('/home/davit/Desktop/mobilelessons_23/homework_6/Files/info.txt');
  print("Write your text:");
  final String content = stdin.readLineSync() ?? "";
  writeToFile(fileName, content);
}

