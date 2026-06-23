void main(){
  print('Checking username...');
  checkUsername('Hasan')
  .then((result)=> print(result))
  .catchError((e) => print('The Error !! -> $e'))
  .whenComplete(() => print('Username checking finished'));
print('Without await, this prints before the Future result');
}

Future<String> checkUsername(String username) async{
  await Future.delayed(Duration(seconds: 2));
  if(username.isEmpty){
    throw Exception('Username is empty');
  }
  return 'Username accepted: $username';
}