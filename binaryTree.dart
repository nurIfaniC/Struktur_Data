import 'dart:io';
import 'dart:collection';

class Node<T> {
  T nodeValue;
  Node<T>? left, right;

  Node(this.nodeValue) : left = null, right = null;
}

class BinaryTree<T> {
  Node<T>? root;

  void InsertData(T newValue) {
    Node<T> newNode = Node(newValue);
    if (root == null) {
      root = newNode;
      return;
    } else {
      print("Root Binary Tree sudah terisi");
    }
  }

  // method untuk menambahkan berdasarkan lever order secara queue
  void printLevelOrder(Node<T>? node) {
    if (node == null) return;

    Queue<Node<T>> queue = Queue<Node<T>>();
    queue.add(node);

    while (queue.isNotEmpty) {
      Node<T> current = queue.removeFirst();
      stdout.write('${current.nodeValue} ');

      if (current.left != null) queue.add(current.left!);
      if (current.right != null) queue.add(current.right!);
    }
  }

  // method untuk menambahkan data berdasarkan target dengan linear search
  void insertAfterTarget(T targetValue, T newValue) {
    if (root == null) {
      print("Tree masih kosong");
      return;
    }

    Queue<Node<T>> queue = Queue<Node<T>>();
    queue.add(root!);

    while (queue.isNotEmpty) {
      Node<T> current = queue.removeFirst();

      if (current.nodeValue == targetValue) {
        if (current.left == null) {
          current.left = Node(newValue);
          print("Berhasil tambah di kiri dari $targetValue");
          return;
        } else if (current.right == null) {
          current.right = Node(newValue);
          print("Berhasil tambah di kanan dari $targetValue");
          return;
        } else {
          print("Node dengan value '$targetValue' sudah punya dua anak");
          return;
        }
      }

      if (current.left != null) queue.add(current.left!);
      if (current.right != null) queue.add(current.right!);
    }

    print("Target '$targetValue' tidak ditemukan di tree.");
  }

  // Traversal Pre-Order
  void printPreorder(Node<T>? node) {
    if (node != null) {
      stdout.write("${node.nodeValue} ");
      printPreorder(node.left);
      printPreorder(node.right);
    }
  }

  // Traversal Pre-Order non rekursif
  void PreOrderNonRekursif(Node<T>? node) {
    if (node == null) return;

    List<Node<T>> s = [];
    s.add(node);

    while (s.isNotEmpty) {
      Node<T> current = s.removeLast();
      stdout.write('${current.nodeValue} ');

      if (current.right != null) {
        s.add(current.right!);
      }
      if (current.left != null) {
        s.add(current.left!);
      }
    }
  }

  // Traversal In order
  void printInOrder(Node<T>? node) {
    if (node != null) {
      printInOrder(node.left);
      stdout.write("${node.nodeValue} ");
      printInOrder(node.right);
    }
  }

  // Traversal In Order non rekursif
  void InOrderNonRekursif(Node<T>? node) {
    if (node == null) return;

    List<Node<T>> s = [];
    Node<T>? curr = node;

    while (curr != null || s.isNotEmpty) {
      while (curr != null) {
        s.add(curr);
        curr = curr.left;
      }
      curr = s.removeLast();
      stdout.write("${curr.nodeValue} ");
      curr = curr.right;
    }
  }

  // Traversal Post Order
  void printPostOrder(Node<T>? node) {
    if (node != null) {
      printPostOrder(node.left);
      printPostOrder(node.right);
      stdout.write("${node.nodeValue} ");
    }
  }

  // Traversal Post Order non rekursif
  void PostOrderNonRekursif(Node<T>? node) {
    if (node == null) return;

    List<Node<T>> s1 = [];
    List<Node<T>> s2 = [];

    s1.add(node);

    while (s1.isNotEmpty) {
      Node<T> current = s1.removeLast();
      s2.add(current);

      if (current.left != null) {
        s1.add(current.left!);
      }
      if (current.right != null) {
        s1.add(current.right!);
      }
    }

    while (s2.isNotEmpty) {
      stdout.write('${s2.removeLast().nodeValue} ');
    }
  }
}

void main() {
  BinaryTree<String> bTree = BinaryTree<String>();

  // Buat root
  bTree.InsertData("a");

  // Tambah manual ke tree
  bTree.root!.left = Node("1");
  bTree.root!.left!.left = Node("3");
  bTree.root!.left!.right = Node("4");
  bTree.root!.right = Node("2");
  bTree.root!.right!.left = Node("5");

  print('Pre Order Transversal: ');
  bTree.printPreorder(bTree.root);

  print('\nIn Order Transversal: ');
  bTree.printInOrder(bTree.root);

  print('\nPost Order Transversal: ');
  bTree.printPostOrder(bTree.root);

  print('\nPre-Order Non-Rekursif');
  bTree.PreOrderNonRekursif(bTree.root);

  print("\nIn-order Non-Rekursif:");
  bTree.InOrderNonRekursif(bTree.root);

  print("\nPost-Order Non-Rekursif");
  bTree.PostOrderNonRekursif(bTree.root);

  print("\nLevel Order:");
  bTree.printLevelOrder(bTree.root);

  print("\nTambah node setelah target:");
  bTree.insertAfterTarget("2", "9");

  print("\nLevel Order setelah insert:");
  bTree.printLevelOrder(bTree.root);
}
