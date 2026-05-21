//Function declaration and invocation

void main(){
// return type - void
// function name = main
// parentheses - ()
// body - {}
// In function creation, input values are parameters.
// When calling a function, input values are arguments.

  //KISS -  Keep It Simple
  //DRY - Don't Repeat Yourself
  //SOLID - Single Responsibility Principle 

  print("Here is a box - Give");
  labelAndStore();

  print("Here is a box 2 - Give");
  labelAndStore();

  //Using a function to return values
  double result=add(7.5, 8); //argument
  print('The addition is: ${result.toStringAsFixed(2)}');

  print(greetings('Hasan'));
}
void labelAndStore(){
  print("Take this box");
  print("Label it\nStore it");
}

 double add(double first, double second){ //parameter
  return first + second ;
}

//Arrow function 
//work for single line expression
String greetings(String name) => "Hey $name!";
