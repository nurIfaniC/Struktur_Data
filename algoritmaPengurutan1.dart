class Data {
  int value;
  int originalIndex;

  Data(this.value, this.originalIndex);
}

void linearSearchAll(List<int> data, int key) {
  List<int> foundIndexes = [];
  int comparisons = 0;

  for (int i = 0; i < data.length; i++) {
    comparisons++;
    if (data[i] == key) {
      foundIndexes.add(i);
    }
  }

  if (foundIndexes.isNotEmpty) {
    print("Nilai $key ditemukan pada indeks: ${foundIndexes.join(', ')}");
  } else {
    print("Nilai $key tidak ditemukan dalam data.");
  }

  print("Jumlah perbandingan (Linear Search): $comparisons");
}

int binarySearch(List<Data> sortedList, int key) {
  int low = 0;
  int high = sortedList.length - 1;
  int comparisons = 0;

  while (low <= high) {
    int mid = (low + high) ~/ 2;
    comparisons++;

    if (sortedList[mid].value == key) {
      print("Jumlah perbandingan (Binary Search): $comparisons");
      return sortedList[mid].originalIndex;
    } else if (sortedList[mid].value < key) {
      low = mid + 1;
    } else {
      high = mid - 1;
    }
  }

  print("Jumlah perbandingan (Binary Search): $comparisons");
  return -1;
}


void main() {
  List<int> data = [45, 10, 70, 30, 50, 90, 70]; // Data acak
  int target = 70;

  print("=== Linear Search ===");
  linearSearchAll(data, target);

  print("\n=== Binary Search ===");
  // Siapkan data untuk binary search
  List<Data> dataList = [];
  for (int i = 0; i < data.length; i++) {
    dataList.add(Data(data[i], i));
  }

  // Urutkan berdasarkan nilai
  dataList.sort((a, b) => a.value.compareTo(b.value));

  int result = binarySearch(dataList, target);
  if (result != -1) {
    print("Nilai $target ditemukan pada indeks asli: $result");
  } else {
    print("Nilai $target tidak ditemukan dalam data.");
  }
}
