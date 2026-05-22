//Positional parameters
//Named parameters
//Optional parameters


void main(){
  showUserDetails('Hasan', 22, 'Bangladeshi');
  showUserDetails2(age:23, nationality:'Bangladeshi');
  showUserDetails3(name: 'Hasan', nationality: 'Bangladeshi',age: 24);
  showUserDetails4(age: 20);
  greetings('Md','Hasan');

}
// Positional parameters are passed by position/order(best for single parameter).
void showUserDetails(String name, int age, String nationality){ //Positional Parameter
  print("$name is a $age years old $nationality");
}

//Dart supports SOUND NULL SAFETY
//Default
//Must have value - required
// Value may exist or may not exist.


//Default
//Named parameters
void showUserDetails2({String name = 'Hasan', int age = 20, String nationality = 'Bangladeshi'}){ // Named parameters have labels.
  print("$name is $age years old and $nationality");
}

//Must have value - required
void showUserDetails3({required String name, required  int age, required String nationality}){
  print("$name is $age years old and $nationality");
}

// Null safety
void showUserDetails4({String? name, int? age, String? nationality}){
  print("$name is $age years old and $nationality.");
}

// break    → stops the whole loop
// continue → skips only the current iteration and moves to the next one(used for loops)
// return   → stops the function 

//Optional positional parameters
void greetings(String fname, [String? lname] ){ // Required positional parameters come first, optional positional parameters come last.
  if(lname != null){
  print("Hello $fname $lname");
  return;} // Early return

  print("Hello $fname!");
}