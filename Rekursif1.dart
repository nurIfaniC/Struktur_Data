import 'dart:io';

void segitigaPascal(int n) {
  List<List<int>> pascal = [];
  
  for (int i = 0; i < n; i++) {
    List<int> row = [];
    int val = 1;
    stdout.write(' ' * (n - i)); 
    stdout.write('F${i + 1} ');
    for (int j = 0; j <= i; j++) {
      row.add(val);
      stdout.write('$val ');
      val = val * (i - j) ~/ (j + 1);
    }
    pascal.add(row);
    print('');
  }
}

void main() {
  int n = 6;
  segitigaPascal(n);
}
