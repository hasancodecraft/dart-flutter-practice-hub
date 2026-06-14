// 1. .then(), .catchError(), and .whenComplete() are registered as callbacks in memory.
// 2. Because there is no await, main() does not wait for the Future result.
// 3. main() continues and finishes all remaining synchronous code.
// 4. main() exits the call stack, but the program stays alive because Future callbacks are pending.
// 5. Event Loop (outside main) handles the completed Future.
// 6. Dart verifies the result → success or error.
// 7. Dart executes the correct stored callback.
// 8. If success, .then() runs.
// 9. If error, .catchError() runs.
// 10. .whenComplete() always runs at the end.


//    (The program stays ALIVE because the Event Loop manager is still running 
//    in the background, waiting to pick up and execute the stored callbacks!)


/* 
// Future chaining basic structure: 
futureFunction(input)
    .then((value) {
       // Runs when the Future completes successfully.
    })
    .catchError((error) {
      // Runs when the Future completes with an error.
    })
    .whenComplete(() {
      // Runs at the end, whether the Future succeeds or fails.
    });
*/


Future<int> parseData(String data) async{
  if (data.isEmpty) throw Exception('Data is empty');
  return data.length;
}

void main(){
print('Starting operation...');
  parseData("Hasan") // Registers the callbacks (.then(), .catchError(), and .whenComplete()); they will run later when the Future completes.
      .then((length) => print('Length: $length')) // Runs only if the Future completes successfully.
      .catchError((e) => print('Error caught: $e')) // Runs if the Future completes with an error.
      .whenComplete(() => print('Operation finished regardless of outcome')); // Runs always after Future completes. 

print('This prints BEFORE the Future result because we did not await above');
}