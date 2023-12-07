import 'dart:io';
void main() {
  print('Enter * count');
  int? numm = int.tryParse(stdin.readLineSync()!) ?? 0;
  for (int i = 1; i <= numm; i++) {
    for (int j = 1; j <= i; j++) {
      stdout.write('*'); //because print" output under by under
    }
    print(''); 
  }
}
