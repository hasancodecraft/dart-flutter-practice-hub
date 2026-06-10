// Asynchronous means a task may finish later, and Future represents that later result.
// Future is an object that represents a delayed computation.
// It has two states: uncompleted (pending) and completed (with a value or an error).
// A Future can complete with a value or with an error.
// To make an asynchronous function, add async after ().
// If the function returns a value later, use Future<T> as the return type.
// Inside an async function, await is used to wait for a Future result.
// async makes this function asynchronous, allows await inside it, and returns the final result as a Future.
void main() async {
  print('Calculating your lucky number...');

  int luckyNumber = await getLuckyNumber();
  
  print("Your lucky number is : $luckyNumber");
}

Future<int> getLuckyNumber() async {
  await Future.delayed(Duration(seconds: 5));
  return 7;
  } 