import 'dart:io';

void main() {
  print('Enter Number');
  int? numm = int.tryParse(stdin.readLineSync()!) ?? 0;

  int result = 1;
  for (int i = 1; i <= numm; i++) {
    result *= i;  
  }

  print('Factorial of $numm');
  print(result);
}