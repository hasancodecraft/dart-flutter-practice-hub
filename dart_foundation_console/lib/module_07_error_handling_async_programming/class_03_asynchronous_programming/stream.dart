// Future = one value later
// Stream = many values over time
// stream represents a sequence of values delivered over time.
// async* is used for Stream functions.
// It allows us to use yield and send multiple values over time.

Stream<int> countSeconds(int max) async* {
  for(int i = 1; i<= max; i++){
    await Future.delayed(Duration(seconds: 1));
    yield i; // yield sends the current value to the listener without stopping the loop.
  }
}

void main(){
  print('Timer Started..');
  
  countSeconds(10).listen( // listen() receives each value from the Stream when it arrives.
    (data) => print('Tick: $data'),
    onDone: () => print('Timer finished!')); // onDone runs when the Stream finishes sending all values.
    // Basic line: countSeconds(10).listen((data) => print('Tick: $data')); 
}