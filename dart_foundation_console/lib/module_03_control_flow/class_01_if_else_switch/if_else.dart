void main(){
  bool isNewInstall = true;

  //if-else => if -> else if -> else 
  if(isNewInstall){ // Always boolean value check
    print("Onboarding Screen");
    print("Login Screen");
  }
  else{
    print("login Screen");
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
}