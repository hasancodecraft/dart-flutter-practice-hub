Stream<int> countNumbers(int max) async* {
  for (int i =1 ; i<= max; i++) {
    await Future.delayed(Duration(seconds: 1));
    yield i;
  }
}

void main(){
  print('Counting started...');

  countNumbers(5).listen((data) => print('Number: $data'));
}