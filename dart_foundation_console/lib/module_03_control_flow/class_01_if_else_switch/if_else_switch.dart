void main(){
  bool isNewInstall = true;

  //if-else => if -> else if -> else 
  // For multiple conditions and variables
  if(isNewInstall){ // Always boolean value check
    print("Onboarding Screen");
    print("Login Screen");
  }
  else{
    print("Login Screen");
  }

  int mark = 58;

  if (mark >= 90){
    print("Grade: A");
  } else if (mark >= 80){
    print("Grade: B");
  } else if (mark >= 70){
    print("Grade: C");
  } else if (mark >= 60){
    print("Grade: D");
  } else if (mark >=30 && mark <=59){
    print("Grade: E");
  } else{
    print("Grade: F");
  }

  //switch case 
  // If one variable has multiple possible values, we can use switch-case.
  String command  = 'Close';

  switch(command){
    case 'Open':
      print('Opening system');
      break;
    case 'Close':
      print("Shutting down");
      break;
    default:
      print('Unknown Command');
  }

  //pattern matching
  //switch expression
  int age = 50;

  String ageCheck = switch (age){
    > 50 => 'Older People',
    >= 18 && <= 50 => 'Adult',
    _=> 'Not Adult'
  };
  print(ageCheck);
}