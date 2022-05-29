import 'dart:math';

compressBoxesTwice(List<String> boxes, List<String> boxes1) {
  boxes.forEach((String box) {
    print(boxes);
  });

  boxes.forEach((String box) {
    print(boxes);
  });

  //0(a + b) //different terms for different inputs
}

printAllNumbersThenAllPairSums(List<int> number) {
  print('these are the numbers:'); //0(1)
  number.forEach((int number) {
    //0(n)
    print(number); //0(n)
  });

  print('and these are the sums'); //0(1)
  for (int num1 in number) {
    for (int num2 in number) {
      print(num1 + num2);
    }
  }
  /*number.forEach((int num) {//0(n)
    
    number.forEach((int secnum) {
      //0(n)
      print(num + secnum); //0(n)
    });
  });*/
} //0(2 + 2n + n^2 + n) = 0(n^2)

arrayTypes() {
  List<String> strings1 = ['a', 'b', 'c', 'd'];
  print(strings1[2]);
  strings1.add('e');
  print(strings1);
  strings1.removeLast();
  print(strings1);
  strings1.insert(2, 'alien');
  print(strings1);
}

class Player {
  String name = '';
  String type = '';

  Player(String name1, String type1) {
    //print('player', this);
    this.name = name1;
    this.type = type1;
  }

  introduce() {
    print("Hi I am $name, I'm a $type");
  }
}

class Wizard extends Player {
  String name;
  String type;
  Wizard(this.name, this.type) : super(name, type);

  play() {
    print("WEEEEE I'm a $type");
  }
}

class MyArray {
  int length = 0;
  dynamic data = {};

  // MyArray({this.length = 0, this.data = {}});

  get(int index) {
    return data[index];
  }

  push(String item) {
    data[length] = item;
    length++;
    return length;
  }

  pop() {
    data[length - 1];
    data.remove(data[length - 1]);
    length--;
    return data[length - 1];
  }

  delete(int index) {
    data[index];
    shiftItems(index);
  }

  shiftItems(int index) {
    for (var i = index; i < length - 1; i++) {
      data[i] = data[i + 1];
    }
    data.remove(data[length - 1]);
    length--;
  }

  //MyArray({this.length = 0, this.data = {}});
}

String reverse(String str) {
  if (str.isEmpty || str.length < 2) {
    return 'not a string';
  }
  var backwards = [];
  var totalItems = str.length - 1;
  for (var i = totalItems; i >= 0; i--) {
    backwards.add(str[i]);
  }
  var reverse = backwards.join('');
  print(reverse);
  return reverse;
}

String reverse2(String str) {
  var reverse = str.split('').reversed.join('');
  print(reverse);
  return reverse;
}

List<int> mergeArrays(List<int> arr1, List<int> arr2) {
  //arr1.addAll(arr2);
  var merged = [arr1, arr2].expand((x) => x).toList();
  // merged.sort((arr1, arr2) => arr1.compareTo(arr2.))
  print(merged);

  //check input and stops recursion if array contains 1 element
  if (merged.length <= 1) {
    return merged;
  }

  //split in the middle of the array
  int splitindex = merged.length ~/ 2;

  //recursively call merge sort on left and right array
  List<int> leftArr = merged.sublist(0, splitindex);
  List<int> rightArr = merged.sublist(splitindex);
  print(merge(leftArr, rightArr));
  return merge(leftArr, rightArr);

  //return merged;
}

List<int> merge(List<int> left_arr, List<int> right_arr) {
  List<int> res = [];
  int i = 0;
  int j = 0;

  //search for the smallest element in left and right arrays and insert into result
  //after the loop only one array has remaining elements
  while (i < left_arr.length && j < right_arr.length) {
    if (left_arr[i] <= right_arr[j]) {
      res.add(left_arr[i]);
      i++;
    } else {
      res.add(right_arr[j]);
      j++;
    }
  }

  //insert remaining elements of left array into res as long as there are remaining elements
  while (i < left_arr.length) {
    res.add(left_arr[i]);
    i++;
  }

  //insert remaining elements of right array into res as long as they are remaining elements
  while (j < right_arr.length) {
    res.add(right_arr[j]);
    j++;
  }

  return res;
}

//2 sum of indices gives a particular number target
twoSumInArrays(List<int> nums, int target) {
  int i = 0;
  while (i < nums.length) {
    i++;
    int j = i + 1;
    while (j < nums.length) {
      if (nums[i] + nums[j] == target) {
        return [i, j];
      }
    }
  }
}

hasPairWithSum(List<int> nums, int sum) {
  var comp = Set();

  for (int i = 0; i < nums.length; i++) {
    if (comp.contains(nums[i])) {
      return true;
    }
    comp.add(sum - nums[i]);
  }
  return false;
}

/*containsCommonItem(List<dynamic> arr1, List<dynamic> arr2) {
  var map = {};
  for (int i = 0; i < arr1.length; i++) {
    if (!map.containsValue(arr1[i])) {
      var item = arr1[i];
      map[item] = true;
      //print(map);
    }
  }
  print(map);

  for (int j = 0; j < arr2.length; j++) {
    if (!map.containsKey(arr2[j])) return true;
    return false;
  }
}*/

containsCommonItem(List<dynamic> arr1, List<dynamic> arr2) {
  for (int i = 0; i < arr1.length; i++) {
    for (int j = 0; j < arr2.length; j++) {
      if (arr1[i] == arr2[j]) {
        return true;
      }
    }
  }
  return false;
}

num maxSubArray(List<int> a) {
  int size = a.length;
  var maxint = pow(2, 53);
  var max_so_far = -maxint - 1;
  int max_ending_here = 0;

  for (var i = 0; i < size; i++) {
    max_ending_here = max_ending_here + a[i];
    if (max_so_far < max_ending_here) {
      max_so_far = max_ending_here;
    }
    if (max_ending_here < 0) {
      max_ending_here = 0;
    }
  }
  return max_so_far;
}

List<int> pushZerosToEnd(List<int> arr) {
  int count = 0; //count of zero elements

  // Traverse the array. If element encountered is
  // non-zero, then replace the element at index 'count'
  // with this element
  for (int i = 0; i < arr.length; i++) {
    if (arr[i] != 0) {
      arr[count++] = arr[i]; //here count is incremented

    }
  }
  // Now all non-zero elements have been shifted to
  // front and 'count' is set as index of first 0.
  // Make all elements 0 from count to end.
  while (count < arr.length) {
    arr[count++] = 0;
  }
  return arr;
}

containsDuplicate(List<int> arr) {
  //creates an empty hashset
  List<int> myset = [];

  for (int i = 0; i < arr.length; i++) {
    // If already present n hash, then we found
    // a duplicate within k distance
    if (myset.contains(arr[i])) {
      return true;
    }
    //add this item to hashset
    myset.add(arr[i]);
  }
  return false;

  /*if (arr.isEmpty) return false;

  arr.sort();
  for (int i = 0; i < arr.length; i++) {
    if (arr[i + 1] == arr[i]) {
      return true;
    }
  }
  return false;*/
}

main() {
  print(containsCommonItem(['a', null, 'e'], ['b', null, 'd']));
  //print(hasPairWithSum([1, 2, 4, 4], 8));
  //print(containsDuplicate([1, 2, 3, 1]));
  //print(pushZerosToEnd([1, 9, 8, 4, 0, 0, 2, 7, 0, 6, 0, 9]));
  //print(maxSubArray([-2, 1, -3, 4, -1, 2, 1, -5, 4]));
  //print(twoSumInArrays([3, 2, 4], 6));
  //mergeArrays([0, 3, 4, 31], [4, 3, 5, 7]);

  //reverse('Hi myy name is Isaac Eze');
  //reverse2('Hi myy name is Isaac Eze');
  /*MyArray myArray = MyArray();
  myArray.push('hi');
  myArray.push('how');
  myArray.push('are');
  myArray.push('you');
  print(myArray.length);
  myArray.pop();
  print(myArray.length);
  print(myArray.get(2));*/
  /*Wizard wizard = Wizard('Shelly', 'Healer');
  Wizard wizard1 = Wizard('Eze', 'Dark Magic');
  wizard.introduce();
  wizard1.play();*/
  //arrayTypes();
  //'hdhdhd'.length;
  //printAllNumbersThenAllPairSums([1, 2, 3, 4, 5]);
}
