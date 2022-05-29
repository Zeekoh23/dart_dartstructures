class Node<T> {
  T value;
  Node<T>? next;

  Node({required this.value, this.next});

  @override
  String toString() {
    if (next == null) return '$value';
    return '$value -> ${next.toString()}';
  }
}

class Stack<E> {
  Node<E>? top;
  Node<E>? bottom;
  int length = 0;

  //@override
  bool get isEmpty => top == null;

  @override
  String toString() {
    if (isEmpty) return 'Empty List';
    return top!.value.toString();
  }

  printList() {
    var arr = [];
    var currentNode = top;
    while (currentNode != null) {
      arr.add(currentNode.value);
      currentNode = currentNode.next;
    }
    return arr;
  }

  peek() {
    if (isEmpty) {
      return toString();
    }
    return top?.value;
  }

  push(E value) {
    var newnode = Node(value: value);
    //bottom ??= top;
    if (top == null) {
      top = newnode;
      bottom = newnode;
    } else {
      var holdingPointer = top;
      top = newnode;
      top?.next = holdingPointer;
    }
    length++;
    return printList();
  }

  pop() {
    if (top == null) {
      return toString();
    }

    if (top == bottom) {
      bottom = null;
    }
    top = top?.next;
    length--;
    return printList();
  }
}

class StackWithArray<E> {
  List<E> array = [];

  // @override
  bool get isEmpty => array[array.length - 1] == null;

  @override
  String toString() {
    if (isEmpty) return 'Empty list';
    return array[array.length - 1].toString();
  }

  peek() {
    if (isEmpty) {
      return toString();
    }
    return toString();
  }

  push(E value) {
    array.add(value);
    return array;
  }

  pop() {
    array.removeLast();
    return array;
  }
}

class Queue<T> {
  Node<T>? first;
  Node<T>? last;
  int length = 0;

  //@override
  bool get isEmpty => first == null;

  @override
  String toString() {
    if (isEmpty) return 'Empty List';
    return first!.value.toString();
  }

  printList() {
    var arr = [];
    var currentNode = first;
    while (currentNode != null) {
      arr.add(currentNode.value);
      currentNode = currentNode.next;
    }
    return arr;
  }

  peek() {
    if (isEmpty) {
      return toString();
    }
    return toString();
  }

  enqueue(T value) {
    var newnode = Node(value: value);
    if (length == 0) {
      first = newnode;
      last = newnode;
    } else {
      last?.next = newnode;
      last = last?.next;
    }
    length++;
    return printList();
  }

  dequeue() {
    if (first == null) {
      return toString();
    }
    if (first == last) {
      last = null;
    }
    first = first?.next;
    length++;
    return printList();
  }
}

class QueuesWithStack<T> {
  List<T> first = [];
  List<T> last = [];

  enqueue(T value) {
    int length = first.length;
    for (int i = 0; i < length; i++) {
      last.add(first.removeLast());
    }
    last.add(value);
    return last;
  }

  dequeue() {
    int length = last.length;
    for (int i = 0; i < length; i++) {
      first.add(last.removeLast());
    }
    first.removeLast();
    return first;
  }

  peek() {
    if (last.isNotEmpty) {
      return last[0];
    }
    return first[first.length - 1];
  }
}

void main() {
  var myStack3 = QueuesWithStack();
  myStack3.enqueue('Ada1');
  myStack3.enqueue('Posi1');
  print(myStack3.enqueue('Lolade1'));
  //print(myStack3.dequeue());
  print(myStack3.peek());
  /*var myStack2 = Queue();
  myStack2.enqueue('Ada');
  myStack2.enqueue('Posi');
  print(myStack2.enqueue('Lolade'));
  print(myStack2.peek());
  print(myStack2.dequeue());*/
  /*var myStack1 = StackWithArray();
  myStack1.push('google');
  myStack1.push('udemy');
  print(myStack1.push('linkedin'));
  print(myStack1.peek());
  print(myStack1.pop());*/
  /* var myStack = Stack();
  myStack.push('google');
  myStack.push('udemy');
  print(myStack.push('linkedin'));
  print(myStack.peek());
  print(myStack.pop());*/
}
