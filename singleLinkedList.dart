class Node {
  dynamic nodeValue;
  Node? next;

  Node(this.nodeValue);
}

class SingleLinkedList {
  Node? head;

  void append(dynamic value) {
    Node newNode = Node(value);
    if (head == null) {
      head = newNode;
    } else {
      Node current = head!;
      while (current.next != null) {
        current = current.next!;
      }
      current.next = newNode;
    }
  }

  void display() {
    Node? current = head;
    while (current != null) {
      print(current.nodeValue);
      current = current.next;
    }
  }

  void delete(dynamic value) {
    if (head == null) return;

    if (head!.nodeValue == value) {
      head = head!.next;
      return;
    }

    Node? current = head;
    while (current!.next != null) {
      if (current.next!.nodeValue == value) {
        current.next = current.next!.next;
        return;
      }
      current = current.next;
    }
  }

  bool contains(dynamic value) {
    Node? current = head;
    while (current != null) {
      if (current.nodeValue == value) return true;
      current = current.next;
    }
    return false;
  }
}

void main() {
  SingleLinkedList list = SingleLinkedList();

  list.append(15);
  list.append(20);
  list.append(25);

  print('Daftar setelah menambahkan elemen:');
  list.display();

  print('\nMencari 20 dalam daftar:');
  if (list.contains(25)) {
    print('Ditemukan: 25');
  } else {
    print('Tidak ditemukan');
  }

  list.delete(25);

  print('\nDaftar setelah menghapus 25:');
  list.display();
}
