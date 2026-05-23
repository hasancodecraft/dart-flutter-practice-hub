// Scope:Local vs Global variables

String message = 'Hey.! Global message';
void main(){
  String message = 'Hey! local message';
  print(message);
  anotherFunction();
}

void anotherFunction(){
  print(message);
}