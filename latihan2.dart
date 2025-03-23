class Mahasiswa implements Comparable<Mahasiswa> {
  String nrp;
  String nama;

  Mahasiswa(this.nrp, this.nama);

  @override
  int compareTo(Mahasiswa other) {
    return this.nrp.compareTo(other.nrp);
  }

  @override
  String toString() {
    return 'NRP: $nrp, Nama: $nama';
  }
}

class Latihan {
  static void selectionSort<T extends Comparable<T>>(List<T> arr) {
    int n = arr.length;

    for (int i = 0; i < n - 1; i++) {
      int minIndex = i;
      for (int j = i + 1; j < n; j++) {
        if (arr[j].compareTo(arr[minIndex]) < 0) {
          minIndex = j;
        }
      }

      if (minIndex != i) {
        T temp = arr[i];
        arr[i] = arr[minIndex];
        arr[minIndex] = temp;
      }
    }
  }

  static void display<T>(List<T> data) {
    for (T obj in data) {
      print(obj);
    }
    print('');
  }
}
void main() {
  List<Mahasiswa> mahasiswaList = [
    Mahasiswa('12345', 'Ichaa'),
    Mahasiswa('12347', 'Inka'),
    Mahasiswa('12346', 'Rahma'),
    Mahasiswa('12344', 'Shapiraa'),
  ];

  print('Sebelum diurutkan:');
  Latihan.display(mahasiswaList);

  Latihan.selectionSort(mahasiswaList);

  print('Setelah diurutkan:');
  Latihan.display(mahasiswaList);
}
