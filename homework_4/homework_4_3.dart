import 'dart:io';

void reverseSentence(String sentence) {
  String a = sentence.split(" ").reversed.join(" ");
  print(a);
}
void main() {
  print("Please give a sentence: ");
  String sentence = stdin.readLineSync() ?? "";

  reverseSentence(sentence);
}

