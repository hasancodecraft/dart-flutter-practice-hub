// object = data + action
// Encapsulation -> Protection, Flexibility, Simplification (hide complexity)
// In Dart, private members are library-private.
// They can be accessed inside the same file/library.
// Getter = read
// Setter = write

import 'debug.dart';
void main(){
  final myObject = MyClass('Hasan');

  myObject.userName = 'Hasan';
  print(myObject.bankBalance); 
  myObject.bankBalance = 100;
  print(myObject.bankBalance);
}