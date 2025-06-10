class Node<T> {
  T value;
  Node<T>? left;
  Node<T>? right;

  Node(this.value);
}

class BinaryTree<T> {
  Node<T>? root;

  BinaryTree() {
    root = null;
  }

  int maxDepthDiagram(
    Node<T>? node, {
    String prefix = '',
    bool isLeft = true,
    bool isRoot = true,
  }) {
    if (node == null) {
      print('${prefix}${isRoot ? '' : (isLeft ? '├── ' : '└── ')}maxDepth(null) = 0');
      return 0;
    }

    String nodePrefix = isRoot ? '' : (isLeft ? '├── ' : '└── ');
    print('$prefix$nodePrefix maxDepth(${node.value})');

    String childPrefix = prefix + (isRoot ? '' : (isLeft ? '│   ' : '    '));

    int lDepth = maxDepthDiagram(node.left, prefix: childPrefix, isLeft: true, isRoot: false);
    int rDepth = maxDepthDiagram(node.right, prefix: childPrefix, isLeft: false, isRoot: false);

    int depth = (lDepth > rDepth) ? (lDepth + 1) : (rDepth + 1);

    print('${prefix}${isRoot ? '' : (isLeft ? '│   ' : '    ')}maxDepth(${node.value}) = max($lDepth,$rDepth) + 1 = $depth\n');

    return depth;
  }
}

void main() {
  BinaryTree<int> tree = BinaryTree<int>();
  tree.root = Node<int>(10);
  tree.root!.left = Node<int>(20);
  tree.root!.right = Node<int>(30);
  tree.root!.right!.left = Node<int>(40);

  print('Diagram rekursif maxDepth:\n');
  int kedalaman = tree.maxDepthDiagram(tree.root);
  print('maxDepth(10) = $kedalaman');
}
