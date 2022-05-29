int counter = 0;
inception() {
  print(counter);
  if (counter > 3) {
    return 'done';
  }
  counter++;
  return inception();
}

findFactorialRecursive(int number) {
  print(number);
  print('*');

  if (number == 2) {
    return 2;
  }
  return number * findFactorialRecursive(number - 1);
}

findFactorialIterative(int number) {
  int answer = number;

  print(number);
  print('*');
  for (int i = number - 1; i >= 2; i--) {
    print(i);
    print('*');
    if (number == 2) {
      return 2;
    }
    answer = answer * i;
  }
  return answer;
}

fibonacciIterative(int number) {
  List<int> arr = [0, 1];

  for (int i = 2; i <= number; i++) {
    arr.add(arr[i - 2] + arr[i - 1]);
  }
  return arr[number];
}

fibonacciRecursive(int number) {
  if (number < 2) {
    return number;
  }
  return fibonacciRecursive(number - 1) + fibonacciRecursive(number - 2);
}

reverseStringIterative(String str) {
  List<String> arrStr = str.split('');
  List<String> reversedArr = [];

  addToArray(List<String> arr) {
    if (arr.isNotEmpty) {
      reversedArr.add(arr.removeLast());
      addToArray(arr);
    }
    return;
  }

  addToArray(arrStr);
  return reversedArr.join('');
}

reverseStringRecursive(String str) {
  if (str == '') {
    return '';
  } else {
    return reverseStringRecursive(str.substring(1)) + str.(0);
  }
}

void main() {
  print(reverseStringRecursive('eze isaac'));
  //print(reverseStringIterative('eze isaac'));
  //print(fibonacciRecursive(8));
  //print(fibonacciIterative(8));
  //print(findFactorialIterative(10));
  //print(findFactorialRecursive(10));
  //print(inception());
}
