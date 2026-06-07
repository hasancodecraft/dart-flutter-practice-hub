// ? / nullable means data may be absent or null.

import 'dart:io';

void main(){
  int? a = null ;  // allowed because of ?

  stdout.write('Enter your name: ');
  String? name = stdin.readLineSync();

  int? age;


if(name != null && name.isNotEmpty){
  age = 30;
} else {
  print('Name is null or empty, cannot assign age');
}


print("$name's age is ${age!.toString()}"); // ! = forcefully treating nullable value as non-null
}
