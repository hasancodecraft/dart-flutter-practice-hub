
void main(){
  for(int i = 0; i<7; i++){
    print(fibonacci(i));
  }

  //Anonymous Functions
  (() => print('Hasan..'))();

  var name2 = ((){ 
  return'Hasan..';});

  print('Name: ${name2()}');

  print(checkFun(check));

  print('Number: ${numbers(5)}');
}

int fibonacci(int n){
  if(n <= 1) return n;
  return fibonacci(n-1) + fibonacci(n-2);
  }

String check () => 'i am ok';

String checkFun (String Function() doubleCheck){
  return doubleCheck();
}

int numbers(int value){
  if(value <= 1)  return value;

  print("Numbers: $value");
  return numbers(value - 1);
}