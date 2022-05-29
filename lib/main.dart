const nemo = ['nemo'];

List<String> large = [
  'dory',
  'bruce',
  'marlin',
  'nemo',
  'gill',
  'bloat',
  'nigel'
];

findNemo(List<String> array) {
  Stopwatch stopwatch = Stopwatch();
  var a = stopwatch.start();

  for (var i = 0; i < array.length; i++) {
    print('running');
    if (nemo[i] == 'nemo') {
      print('found nemo');
    }
    break;
  }
  var b = stopwatch.stop();

  print(
      'call to find nemo took ${stopwatch.elapsed.inMicroseconds} microseconds');
}

/*funChallenge(List<String> lar) {
  var a = 10; //0(1)
  a = 50 + 3; //0(1)

  for (var i = 0; i < lar.length; i++) {
    //0(n)
    //a function in a loop takes 0(n)
    var stranger = true; //0(n)
    a++; //0(n)
  }
  return a; //0(1)
}*/

//3 + n + n+n=n
//BIG 0(3 + 4n)
//at the end of the this above gets simplified to 0(n)

main() {
  //funChallenge(large);
  findNemo(large);
  //return 6 * 7;
  //print(6 * 7);
}
