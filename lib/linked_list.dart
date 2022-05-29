class Node<T> {
  //T means it can hold any type
  Node({required this.value, this.next, this.prev});

  T value;
  Node<T>? next;
  Node<T>? prev;

  @override //i overrided toString so i can print it later
  String toString() {
    if (next == null) return '$value';

    return ' $value -> ${next.toString()}';
  } //it will print all the nodes after this one recursively
}

class LinkedList<E> extends Iterable<E> {
  Node<E>? head;
  Node<E>? tail;

  //an iterator tells an iterable class how to move through its elements

  //iterable requires an iterator
  @override
  Iterator<E> get iterator => _LinkedListIterator(this);

  @override
  bool get isEmpty => head == null;

  @override
  String toString() {
    if (isEmpty) return 'Empty List';
    return head.toString();
  }

  append(E value) {
    //if the list is empty you update head and tail
    /*if (isEmpty) {
      push(value);
      return;
    }*/
    var newNode = Node(value: value, next: null, prev: null);
    newNode.prev = tail;
    tail?.next = newNode;
    tail = newNode;
    //you create a new node after the tail, since the tail is guaranteed to be non-null
    /* tail?.next = Node(value: value);

    //Since this is tail-end insertion, your new node is also the new tail of the list.
    tail = tail?.next;*/
  }

  push(E value) {
    /*var newNode = Node(value: value, next: null, prev: null);
    newNode.next = head;
    head?.prev = newNode;
    head = newNode;*/

    head = Node(value: value, next: head);
    tail ??=
        head; //??= is a null aware assignment. assigns value to the variable on the left, only if that variable is null
  }
  //?? returns expression on my left except if its null, then returns expression on my right
  //?. it is a null aware access method invocation. this method prevents you accessing a method or a property that might be null
  //...? it is a null-aware spread operator. it prevents you from adding null elements using the spread operator

  printList() {
    var arr = [];
    var currentNode = head;
    while (currentNode != null) {
      arr.add(currentNode.value);
      currentNode = currentNode.next;
    }
    return arr;
  }

  printMiddle() {
    var arr = [];
    var currentNode = head;

    while (currentNode != null) {
      arr.add(currentNode.value);
      currentNode = currentNode.next;
    }
    double halflength = (arr.length - 1) / 2;
    return arr[halflength.toInt()];
  }

  Node<E>? nodeAt(int index) {
    //create a new reference to head and set a counter
    var currentNode = head;
    var currentIndex = 0;

    //you move the reference down the list until you have reached the desired index
    while (currentNode != null && currentIndex < index) {
      currentNode = currentNode.next;
      currentIndex++;
    }
    return currentNode;
  }

  Node<E>? traverseIndex(int index) {
    var counter = 0;
    var currentNode = head;
    while (counter != index) {
      currentNode = currentNode!.next;
      counter++;
    }
    return currentNode;
  }

  insertAfter(Node<E> node, E value) {
    //incase the index or node is the same value as the tail node we call append method
    if (tail == node) {
      append(value);
      return tail!;
    }

    if (isEmpty) {
      push(value);
      return head!;
    }

    var newNode = Node(value: value, next: null, prev: null);
    var leader = node;
    var follower = leader.next;
    leader.next = newNode;
    newNode.prev = leader;
    newNode.next = follower;
    follower?.prev = newNode;
    return printList();

    //Otherwise, you simply link up the new node with the rest of the list and return the new node.
    //node.next = Node(value: value, next: node.next);
    //return node.next!;
  }

  /*insert(int index, E value) {
    //incase the index or node is the same value as the tail node we call append method
    if (head?.next == null) {
      append(value);
      return tail!;
    }

    if (isEmpty) {
      push(value);
      return head!;
    }

    var newNode = Node(value: value, next: null, prev: null);
    var leader = traverseIndex(index);
    var follower = leader?.next;
    leader?.next = newNode;
    newNode.prev = leader;
    newNode.next = follower;
    follower?.prev = newNode;
    return printList();

    //Otherwise, you simply link up the new node with the rest of the list and return the new node.
    //node.next = Node(value: value, next: node.next);
    //return node.next!;
  }*/

  /*Node<E> insertAfter(Node<E> node, E value) {
    //incase the index or node is the same value as the tail node we call append method
    if (tail == node) {
      append(value);
      return tail!;
    }

    //Otherwise, you simply link up the new node with the rest of the list and return the new node.
    node.next = Node(value: value, next: node.next);
    return node.next!;
  }*/

  E? pop() {
    //removes value at the front of the list
    final value = head?.value;
    head = head?.next;
    if (isEmpty) {
      tail = null;
    }
    return value;
  }

  E? removeLast() {
    //If the list only consists of one node, removeLast is functionally equivalent to pop.
    if (head?.next == null) return pop();

    //You start at the beginning and keep searching the nodes until current.next is tail. This signifies that current is the node right before tail.
    var current = head;
    while (current!.next != tail) {
      current = current.next;
    }

    //You collect the return value from the tail and after that rewire the node before the tail to be the new tail.
    final value = tail?.value;
    tail = current;
    tail?.next = null;
    return value;
  }

  removeAfter(Node<E> node) {
    final value = node.next?.value;
    //check input
    if (node.next == tail) {
      tail = node;
    }
    var leader = node;
    var follower = leader.next;
    leader.next = follower?.next;
    follower?.prev = leader.prev;
    return printList();
    /*node.next =
        node.next?.next; //assigns the removed node next to the next node next
    return value;*/
  }

  reverse() {
    //var node = ;
    //LinkedList<int> node = LinkedList<int>();
    //check input
    if (head?.next == null) {
      return head;
    }
    var first = head;
    tail = head;
    var second = first?.next;

    while (second != null) {
      var temp = second.next;
      second.next = first;
      first = second;
      second = temp;
    }
    head?.next = null;
    head = first;
    return printList();
  }
}

//to make an iterator, you cretae a class that implements the iterator interface.
/*abstract class Iterator<E>{
  E get current;//this refers to the current element in the collectio as you are iterating through
  bool moveNext();//updates the new value of current
}*/

class _LinkedListIterator<E> implements Iterator<E> {
  //You pass in a reference to the linked list so that the iterator has something to work with.
  _LinkedListIterator(LinkedList<E> list) : _list = list;
  final LinkedList<E> _list;

  //Since you implemented Iterator, you still need to add the required current getter and moveNext method.
  Node<E>? _currentNode;

  @override
  E get current => _currentNode!.value;

  bool _firstPass = true;

  @override
  bool moveNext() {
    //If the list is empty, then there’s no need to go any further. Let the iterable know that there are no more items in this collection by returning false.
    if (_list.isEmpty) return false;

    //Since _currentNode is null to start with, you need to set it to head on the first pass. After that just point it to the next node in the chain.
    if (_firstPass) {
      _currentNode = _list.head;
      _firstPass = false;
    } else {
      _currentNode = _currentNode?.next;
    }

    //Returning true lets the iterable know that there are still more elements, but when the current node is null, you know that you’ve reached the end of the list.
    return _currentNode != null;
  }
}

/*class Node1 {
  int data;
  var next;

  Node1({required this.data, this.next = null});
}

reverse(Node1 node) {
  var prev = null;
  var current = node;
  var next = null;
  while (current != null) {
    next = current.next!;
    current.next = prev;
    prev = current;
    current = next;
  }
  node = prev;
  return node;
}

printList(Node1 node) {
  while (node != null) {
    print('${node.data} ');
    node = node.next;
  }
}*/

void main() {
  var list = LinkedList<int>();
  list.push(3);
  list.push(4);
  list.push(8);
  list.append(5);
  print('before: ${list.printList()}');
  var middleNode = list.traverseIndex(2)!;
  list.insertAfter(middleNode, 34);

  //print('Before: $list');
  print('list are ${list.printList()}');
  print('half of the list are ${list.printMiddle()}');

  /*final reverseorder = list.reverse();
  print('reverse order $reverseorder');

  final removedValue = list.removeAfter(middleNode);
  print('removing after index 2: $removedValue');*/

  //final poppedValue = list.removeLast();
  //print('After popped: $list');

  // var middleNode = List.nodeAt(2)!;
  //List.insertAfter(middleNode, 34);

  //print(List.reverse(List.head!))
  // print('After: $List');
  /* for (final element in List) {
    print(element);
  }*/
  /*final firstNode = List.traverseIndex(0);
  final removedValue = List.remove(firstNode!);
  print('Removed after: $List');*/
  /**/
  /*
  print('popped value: $poppedValue');*/
  /*final node1 = Node(value: 1);
  final node2 = Node(value: 2);
  final node3 = Node(value: 3);

  node1.next = node2;
  node2.next = node3;
  print(node1);*/
}
