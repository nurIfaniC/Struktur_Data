import 'dart:io';

class Queue<T> {
  final int maxSize;
  List<T> _queue = [];

  Queue(this.maxSize);

  bool isFull() => _queue.length >= maxSize;
  bool isEmpty() => _queue.isEmpty;

  void enqueue(T item) {
    if (isFull()) {
      print('Antrian penuh. Tidak bisa menambahkan $item.');
    } else {
      _queue.add(item);
      print('$item berhasil ditambahkan ke antrian.');
    }
  }

  void dequeue() {
    if (isEmpty()) {
      print('Antrian kosong. Tidak ada yang bisa dihapus.');
    } else {
      T removedItem = _queue.removeAt(0);
      print('$removedItem telah keluar dari antrian.');
    }
  }

  void display() {
    if (isEmpty()) {
      print('Antrian kosong.');
    } else {
      print('Isi Antrian:');
      for (var i = 0; i < _queue.length; i++) {
        print('${i + 1}. ${_queue[i]}');
      }
    }
  }
}

void main() {
  stdout.write('Masukkan kapasitas maksimum antrian: ');
  int capacity = int.parse(stdin.readLineSync()!);
  var queue = Queue<String>(capacity);

  while (true) {
    print('\nMenu Antrian Reservasi:');
    print('1. Tambah ke Antrian');
    print('2. Hapus dari Antrian');
    print('3. Tampilkan Antrian');
    print('4. Keluar');
    stdout.write('Pilih menu (1-4): ');
    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        stdout.write('Masukkan nama untuk antrian: ');
        String name = stdin.readLineSync()!;
        queue.enqueue(name);
        break;
      case '2':
        queue.dequeue();
        break;
      case '3':
        queue.display();
        break;
      case '4':
        print('Program selesai.');
        return;
      default:
        print('Pilihan tidak valid. Silakan pilih 1-4.');
    }
  }
}
