import 'package:stack/stack.dart';
import 'dart:io';

class DecimalConverter {
  String convertToBinary(int decimal) {
    var stack = Stack<int>();
    while (decimal > 0) {
      stack.push(decimal % 2);
      decimal ~/= 2;
    }
    return stack.toList().reversed.join();
  }

  String convertToOctal(int decimal) {
    var stack = Stack<int>();
    while (decimal > 0) {
      stack.push(decimal % 8);
      decimal ~/= 8;
    }
    return stack.toList().reversed.join();
  }

  String convertToHexadecimal(int decimal) {
    var stack = Stack<String>();
    while (decimal > 0) {
      int remainder = decimal % 16;
      if (remainder < 10) {
        stack.push(remainder.toString());
      } else {
        stack.push(String.fromCharCode(remainder + 55)); // A = 65, jadi 10+55 = 65
      }
      decimal ~/= 16;
    }
    return stack.toList().reversed.join();
  }
}

void main() {
  var converter = DecimalConverter();

  print("Masukkan nilai desimal: ");
  int decimalValue = int.parse(stdin.readLineSync()!);

  String binary = converter.convertToBinary(decimalValue);
  String octal = converter.convertToOctal(decimalValue);
  String hexadecimal = converter.convertToHexadecimal(decimalValue);

  print("Nilai desimal     = $decimalValue");
  print("Nilai biner       = $binary");
  print("Nilai oktal       = $octal");
  print("Nilai hexadecimal = $hexadecimal");
}
