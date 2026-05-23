// Anonymous Functions
// Higher order Functions
// Recursive Functions

void main(){

// Anonymous Functions(Lambda Functions) 
// It has no name and type -(){}
// To call: ${(() {}) ()}
 
// function is a block of code that can be called
// A function has a return type and a name.

// ignore: prefer_function_declarations_over_variables
final userName = () {   // userName becomes function because it store function
  return 'Hasan';};

print("User name: ${userName()}"); // Anonymous Functions

print('User name: ${(() => 'Hasan')()}'); // Anonymous Functions


// Anonymous Functions with collections
var numbers = [1, 2, 3, 4];

numbers.forEach((num1) {
  print('Numbers: $num1');
});

// Higher order Functions
// A higher-order function can take another function as a parameter.
executeTask(printMessage); // printMessage    → passing the function itself
                          // printMessage()  → calling/running the function immediately

// Recursive Function
// A recursive function calls itself inside itself.
print('Factorial of 5 is : ${factorial(5)}');
}

void executeTask (Function task){
  task();
}

void printMessage(){
  print('Task executed successfully');
}

// Recursion goes downward first until it reaches the base case.
// After finding the base case, it returns the result back upward and completes the pending calculations.
int factorial(int n){
  if(n <= 1) return 1;
  return n * factorial(n-1);
}

