// isNotEmpty checks whether the String has at least one character.
// Pressing only Enter gives an empty string "".
// "" is not null, but it has no character.
// " " is not empty because space is also a character.

import 'dart:io';

late String message;

void main(){
String? name;
String? email;
String? cleanName;

stdout.write('Enter your Name: ');
name = stdin.readLineSync();

stdout.write('Enter your Email: ');
email = stdin.readLineSync();

if(name != null && name.isNotEmpty ){
  cleanName = name;
}

String finalName = cleanName ?? 'Guest';

message = 'Registration completed';

print('Hello, $finalName');

if(email != null && email.isNotEmpty ){
  print("Email: $email");
} else {
  print('Email not provided');
}

print('Registration message: $message');
}