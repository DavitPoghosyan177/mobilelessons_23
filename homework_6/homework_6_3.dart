import 'dart:io';

void main() {
  File inputFile = File('/home/davit/Desktop/mobilelessons_23/homework_6/Files/input.txt');
  File outputFile = File('/home/davit/Desktop/mobilelessons_23/homework_6/Files/output.txt');

  String content = inputFile.readAsStringSync(); //return my info with string:
  
  if (outputFile.existsSync()) {
    outputFile.writeAsStringSync(content, mode: FileMode.append);//append -> add string old file,write -> delete and write 
    print('Content added to output.txt');
  } else {
    outputFile.writeAsStringSync(content);
    print('Content written to new output.txt');
  }
  } 
