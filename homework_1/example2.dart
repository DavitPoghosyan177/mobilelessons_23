import 'dart:io';

void main() {
    print('Enter n1');
    var n1 = int.parse(stdin.readLineSync()!);
    print('Enter n2');
    var n2 = int.parse(stdin.readLineSync()!);

    var adon  = n1 + n2;
    var sub = n1 - n2;
    var mult = n1 * n2;
    var div = n1 / n2;

    print('addition = $adon');
    print('subtraction = $sub');
    print('multiplication = $mult');
    print('division = $div');
}
