// ?? is used to give a backup/default value when a nullable variable becomes null.
// ?? checks the left value. If it is null, it uses the right value.
void main(){
  String? input = null;
  String username = input ?? 'Guest';
  print("Hello, $username");
}