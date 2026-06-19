void main(){
  check(location: 'Nil');
  check2('Hasan');
  (()=> print("Ok"))();
}

void check({String? name, int id = 1573, required String? location }){
  print('Checking...');
  print('Checking... \nname: $name \nid: $id \n location: $location');

}
void check2( String? name, [int id = 1573, String? location ]){
  print('Checking... \nname: $name \nid: $id \n location: $location');

}