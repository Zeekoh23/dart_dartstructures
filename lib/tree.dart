class Node<T> {
  Node<T>? left;
  Node<T>? right;
  T value;

  Node({required this.value, this.left, this.right});

  @override
  String toString() {
    return _diagram(this);
  }

  String _diagram(Node<T>? node,
      [String top = '', String root = '', String bottom = '']) {
    if (node == null) {
      return '$root null\n';
    }
    if (node.left == null && node.right == null) {
      return '$root ${node.value}\n';
    }
    final a = _diagram(node.right, '$top ', '$top|--', '$top| ');
    final b = '$root${node.value}';
    final c = _diagram(node.left, '$bottom | ', '$bottom|__', '$bottom ');
    return '$a$b$c';
  }

  void traverseInOrder(void Function(T value) action) {
    left?.traverseInOrder(action);
    action(value);
    right?.traverseInOrder(action);
  }
}

class BinarySearchTree<T extends Comparable<dynamic>> {
  Node<T>? root;

  @override
  String toString() => root.toString();

  void insert(T value) {
    root = _insertAt(root, value);
  }

  Node<T> _insertAt(Node<T>? node, T value) {
    if (node == null) {
      return Node(value: value);
    }
    if (value.compareTo(node.value) < 0) {
      node.left = _insertAt(node.left, value);
    } else {
      node.right = _insertAt(node.right, value);
    }
    return node;
  }

  //BinarySearchTree(this.root);
  // <, >, >=, <= works for only int variable

  /*insert(int value) {
    var newNode = Node(value: value);
    if (root == null) {
      root = newNode;
    } else {
      var currentNode = root;

      while (true) {
        if (currentNode!.value > value) {
          if (currentNode.left == null) {
            currentNode.left = newNode;
            //return this;
          } else {
            currentNode = currentNode.left;
          }
        } else {
          if (currentNode.right == null) {
            currentNode.right = newNode;
            //return this;
          } else {
            currentNode = currentNode.right;
          }
        }
      }
    }
  }*/
  //not efficient enough
  /*bool contains(T value) {
    if (root == null) return false;
    var found = false;
    root!.traverseInOrder((other) {
      if (value == other) {
        found = true;
      }
    });
    return found;
  }*/
  //efficient
  bool contains(T value) {
    var current = root;
    while (current != null) {
      if (current.value == value) {
        return true;
      }
      if (value.compareTo(current.value) < 0) {
        current = current.left;
      } else {
        current = current.right;
      }
    }
    return false;
  }

  /*lookup(int value) {
    if (root == null) {
      return false;
    }
    var currentNode = root;
    while (currentNode != null) {
      if (value < currentNode.value) {
        currentNode = currentNode.left;
      } else if (value > currentNode.value) {
        currentNode = currentNode.right;
      } else if (value == currentNode.value) {
        return currentNode.value;
      }
    }
    return false;
  }*/

  void remove(T value) {
    root = _remove(root, value);
  }

  Node<T>? _remove(Node<T>? node, T value) {
    if (node == null) return null;

    if (value == node.value) {
      if (node.left == null && node.right == null) {
        return null;
      }
      if (node.left == null) {
        return node.right;
      }
      if (node.right == null) {
        return node.left;
      }
      node.value = node.right!.min.value;
      node.right = _remove(node.right, node.value);
    } else if (value.compareTo(node.value) < 0) {
      node.left = _remove(node.left, value);
    } else {
      node.right = _remove(node.right, value);
    }
    return node;
  }

  /*remove(int value) {
    if (root == null) {
      return false;
    }
    var currentNode = root;
    var parentNode = null;
    while (currentNode != null) {
      if (value < currentNode.value) {
        parentNode = currentNode;
        currentNode = currentNode.left;
      } else if (value > currentNode.value) {
        parentNode = currentNode;
        currentNode = currentNode.right;
      } else if (value == currentNode.value) {
        if (currentNode.right == null) {
          root = currentNode.left;
        } else {
          if (parentNode.value > currentNode.value) {
            parentNode.left = currentNode.left;
          } else if (parentNode.value < currentNode.value) {
            parentNode.right = currentNode.left;
          }
        }
      } else if (currentNode.right?.left == null) {
        if (parentNode == null) {
          root = currentNode.left;
        } else {
          currentNode.right?.left = currentNode.left;
          if (parentNode.value > currentNode.value) {
            parentNode.left = currentNode.right;
          } else if (parentNode.value < currentNode.value) {
            parentNode.left = currentNode.right;
          } else if (parentNode.value < currentNode.value) {
            parentNode.right = currentNode.right;
          }
        }
      } else {
        var leftmost = currentNode.right?.left;
        var leftmostParent = currentNode.right;
        while (leftmost?.left != null) {
          leftmostParent = leftmost;
          leftmost = leftmost?.left;
        }
        leftmostParent?.left = leftmost?.right;
        leftmost?.left = currentNode.left;
        leftmost?.right = currentNode.right;

        if (parentNode == null) {
          root = leftmost;
        } else {
          if (parentNode.value > currentNode.value) {
            parentNode.left = leftmost;
          } else if (parentNode.value < currentNode.value) {
            parentNode.right = leftmost;
          }
        }
      }
      return true;
    }
  }*/
}

//a helper extension
extension _MinFinder<T> on Node<T> {
  Node<T> get min => left?.min ?? this;
}

void main() {
  BinarySearchTree<int> buildExampleTree() {
    var tree = BinarySearchTree<int>();
    tree.insert(9);
    tree.insert(20);
    tree.insert(4);
    tree.insert(7);
    tree.insert(10);
    tree.insert(15);
    tree.insert(1);
    tree.insert(12);
    tree.insert(18);
    return tree;
  }
  /*var tree = BinarySearchTree<int>();
  tree.insert(9);
  tree.insert(20);
  tree.insert(4);
  tree.insert(7);
  tree.insert(10);
  tree.insert(15);
  tree.insert(1);
  tree.insert(12);
  tree.insert(18);*/
  //late int value;

  final tree = buildExampleTree();
  /* print(tree);
  if (tree.contains(7)) {
    print('found 5!');
  } else {
    print("couldn't find 5");
  }*/

  print('before i removed 15');
  print(tree);
  tree.remove(15);
  print('tree after removing root:');
  print(tree);

  //print();
  // print(tree.contains(7));
}
