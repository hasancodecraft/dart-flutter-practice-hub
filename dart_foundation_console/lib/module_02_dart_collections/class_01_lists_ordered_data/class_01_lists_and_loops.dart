void main() {
  // Growable List
  // This list can grow or shrink.
  List<String> growableNames = ['Hasan', 'Hossain'];

  growableNames.add('Abdullah');
  growableNames.remove('Hasan');

  print('Growable List: $growableNames');

  // Fixed-Length List
  // This list has a fixed size.
  List<int> fixedNumbers = List.filled(3, 0);

  fixedNumbers[0] = 10;
  fixedNumbers[1] = 20;
  fixedNumbers[2] = 30;

  print('Fixed-Length List: $fixedNumbers');

  // fixedNumbers.add(40); // Error: Cannot add to a fixed-length list

  // Ordered List
  List<String> nameList = ['a', 'b', 'c'];

  // Raw / vanilla for loop
  // Use when we need index control.
  for (int i = 0; i < nameList.length; i++) {
    print(nameList[i]);
  }

  // for-in loop
  // Use when we only need each item value.
  for (String singleName in nameList) {
    print(singleName);
  }

  // forEach loop
  // Use when we want to perform a simple action for each item.
  nameList.forEach((singleName) => print(singleName));

  // Nested List
  List<List<String>> nestedNames = [
    ['a', 'b', 'c'],
    ['d', 'e', 'f'],
    ['g', 'h', 'i'],
  ];

  print('Nested List value for [0][1]: ${nestedNames[0][1]}');
}