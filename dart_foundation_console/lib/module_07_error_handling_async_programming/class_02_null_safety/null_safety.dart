// ? means nullable. The data may be absent or null.
// String name = ""; Empty string has a value, so it is not null, but it is empty.
// null means absence of value/ kichui nai
// '!' forcefully treats a nullable value as non-null. If the value is null, an error will occur.
import 'dart:io';

void main() {
  int? a = null ;  // allowed because of ?

  stdout.write('Enter your name: ');
  String? name = stdin.readLineSync();

  int? age;

// checking name e value ache kina and name empty kina
if(name != null && name.isNotEmpty){
  age = 30;
} else {
  print('Name is null or empty, cannot assign age');
}


print("$name's age is ${age!.toString()}"); // ! forcefully treats a nullable value as non-null. If age is null, this will cause a runtime error.
}
