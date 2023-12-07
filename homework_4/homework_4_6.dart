import 'dart:io';
void main(){
  print('Enter Number');
  int? numm = int.tryParse(stdin.readLineSync()!) ?? 0;
  for (int i = 1; i <= numm; i++) {
    if(i % 2 == 0){
      print(i);
    }
}
}