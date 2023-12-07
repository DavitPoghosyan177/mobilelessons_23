import 'dart:io';

void main() {
  print('Think of a number between 0 and 100.');
  int low = 0;
  int high = 100;
  bool flag = false;

  while (!flag) {
    int guess = ((high - low) / 2).floor() + low;
    print('Is your number $guess? (greater(g), less(l), or equal(e))');
    String response = stdin.readLineSync()!.toLowerCase();

    if (response == 'e') {
      print('Fine, guess a number!: $guess');
      flag = true;
    } else if (response == 'g') {
      low = guess + 1;
    } else if (response == 'l') {
      high = guess - 1;
    } else {
      print('Please enter "greater(g)", "less(l)", or "equal(e)".');
    }
  }
}