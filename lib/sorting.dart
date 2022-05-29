//All of the sorting algorithms in this chapter will require swapping values between two indices in a list. To make that more convenient, you can add an extension to List itself.
extension SwappableList<E> on List<E> {
  void swap(int indexA, int indexB) {
    final temp = this[indexA];
    this[indexA] = this[indexB];
    this[indexB] = temp;
  }
}

var numbers = [99, 44, 6, 2, 1, 5, 63, 87, 283, 4, 0];

bubbleSort<E extends Comparable<dynamic>>(List<E> list) {
  for (int end = list.length - 1; end > 0; end--) {
    bool swapped = false;
    for (int current = 0; current < end; current++) {
      if (list[current].compareTo(list[current + 1]) > 0) {
        list.swap(current, current + 1);
        swapped = true;
      }
    }
    if (!swapped) return;
  }
}

insertionSort<E extends Comparable<dynamic>>(List<E> list) {
  for (int current = 1; current < list.length; current++) {
    for (int shifting = current; shifting > 0; shifting--) {
      if (list[shifting].compareTo(list[shifting - 1]) < 0) {
        list.swap(shifting, shifting - 1);
      } else {
        break;
      }
    }
  }
}

//merge function
//splitting list
List<E> mergeSort<E extends Comparable<dynamic>>(List<E> list) {
  final middle = list.length ~/ 2;
  final left = list.sublist(0, middle);
  final right = list.sublist(middle);

  return _merge(left, right);
}

//merging list
//You’ll start by creating a helper function named _merge. The sole responsibility of this function is to take in two sorted lists and combine them while retaining the sort order.
List<E> _merge<E extends Comparable<dynamic>>(List<E> listA, List<E> listB) {
  int indexA = 0;
  int indexB = 0;
  final result = <E>[];

  while (indexA < listA.length && indexB < listB.length) {
    final valueA = listA[indexA];
    final valueB = listB[indexB];

    if (valueA.compareTo(valueB) < 0) {
      result.add(valueA);
      indexA += 1;
    } else if (valueA.compareTo(valueB) > 0) {
      result.add(valueB);
      indexB += 1;
    } else {
      result.add(valueA);
      result.add(valueB);
      indexA += 1;
      indexB += 1;
    }
  }

  if (indexA < listA.length) {
    result.addAll(listA.getRange(indexA, listA.length));
  }
  if (indexB < listB.length) {
    result.addAll(listB.getRange(indexB, listB.length));
  }
  return result;
}

//quick sort
List<E> quickSort<E extends Comparable<dynamic>>(List<E> list) {
  if (list.length < 2) return list;

  final pivot = list[0];

  final less = list.where((value) => value.compareTo(pivot) < 0);
  final equal = list.where((value) => value.compareTo(pivot) == 0);
  final greater = list.where((value) => value.compareTo(pivot) > 0);

  return [
    ...quickSort(less.toList()),
    ...equal,
    ...quickSort(greater.toList())
  ];
}

List<String> spanish = ["unico", "arbol", "cosas", "futbol"];

const basket = [2, 65, 34, 2, 1, 7, 8];
var basket1 = basket.sort((a, b) {
  return a - b;
});

//not working
/*bubbleSort(List<int> array) {
  int length = array.length;
  for (int i = 0; i < length; i++) {
    for (int j = 0; j < length; j++) {
      if (array[j] > array[j + 1]) {
        int temp = array[j];
        array[j] = array[j + 1];
        array[j + 1] = temp;
      }
    }
  }
  return array;
}*/

selectionSort(List<int> array) {
  int length = array.length;
  for (int i = 0; i < length; i++) {
    int min = i;
    int temp = array[i];
    for (int j = i + 1; j < length; j++) {
      if (array[j] < array[min]) {
        min = j;
      }
    }
    array[i] = array[min];
    array[min] = temp;
  }
  return array;
}

/*merge(List<int> left, List<int> right) {
  var result = [];
  int leftIndex = 0;
  int rightIndex = 0;

  while (leftIndex < left.length && rightIndex < right.length) {
    if (left[leftIndex] < right[rightIndex]) {
      result.add(left[leftIndex]);
      leftIndex++;
    } else {
      result.add(right[rightIndex]);
      rightIndex++;
    }
  }
  print('$left, $right');
  return result.addAll(left.sublist(leftIndex)).addAll(right.sublist(rightIndex));
}*/

void main() {
  print('selection sorted is ${selectionSort(numbers)}');

  quickSort(numbers);
  print('quick sorted is $numbers');
  //mergeSort(numbers);
  //print('merge sorted is $numbers');
  // insertionSort(numbers);
  //print('insertion sorted is $numbers');

  //bubbleSort(numbers);
  //print('bubble sorted is $numbers');
}
