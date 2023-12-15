import 'dart:io';
void readFromFile() {
  final File file = File('/home/davit/Desktop/mobilelessons_23/homework_6/Files/input.txt');
  final List<String> lines = file.readAsLinesSync();
  for (String line in lines) {
    print(line);
  }
}
void main(){
  readFromFile();
}