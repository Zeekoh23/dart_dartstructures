import 'dart:collection';

class HashTables {
  List<dynamic>? data;

  HashTables(
    int size,
  ) {
    this.data = List.filled(size, 0, growable: true);
  }

  _hash(String key) {
    var hash = 0;
    for (int i = 0; i < key.length; i++) {
      hash = (hash + key.codeUnitAt(i) * 1) % data!.length;
    }
    return hash;
  }

  set(String key, int value) {
    int address = _hash(key);
    if (data![address] == []) {
      data![address] = [];
    }
    data!.add([key, value]);
    return data;
  }

  get(String key) {
    var address = _hash(key);
    final currentBucket = data![address];
    if (currentBucket) {
      for (int i = 0; i < currentBucket.length; i++) {
        if (currentBucket[i][0] == key) {
          return currentBucket[i][1];
        }
      }
    }
    return '';
  }

  keys() {
    const keysArrays = [];
    for (int i = 0; i < data!.length; i++) {
      if (data![i]) {
        keysArrays.add(data![i][0][0]);
      }
    }
    return keysArrays;
  }
}

var myHashTable = HashTables(3);

firstRecurringCharacter(List<int> arr) {
  //initialize the index of first repeating element
  int min = -1;

  //creates an empty hashset
  HashSet<int> set = HashSet<int>();

  //traverse or loop through the input array from left to right
  for (int i = arr.length - 1; i >= 0; i--) {
    // If element is already in hash set, update min
    if (set.contains(arr[i])) {
      min = i;
    } else {
      set.add(arr[i]);
    }
  }
  if (min != -1) {
    print('the first repeating element is ${arr[min]}');
  } else {
    print('no repeating elements');
  }
}

firstRecurringChar2(List<int> arr) {
  dynamic map = {};
  for (int i = 0; i < arr.length; i++) {
    if (map[arr[i]] != []) {
      return arr[i];
    } else {
      map[arr[i]] = i;
    }
    print(map);
  }
  return [];
}

void main() {
  print(firstRecurringChar2([5, 2, 5, 2, 3, 5, 1, 2, 4]));
  //firstRecurringCharacter([2, 5, 5, 2, 3, 5, 1, 2, 4]);
  //print(myHashTable.set('grapes', 10000));
}
