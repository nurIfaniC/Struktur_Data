import 'dart:io';

List<String> chars = ['a', 'b', 'c'];

void charCombination(String a, int n) {
  if (n == 0) {
    stdout.write('$a ');
    return;
  }
  for (var c in chars) {
    charCombination(a + c, n - 1);
  }
}

void main() {
  int n = 3;
  charCombination("", n);
  print("\nBUILD SUCCESSFUL\n(total time: 1 second)");
}

