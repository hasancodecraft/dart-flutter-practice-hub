void main(){
  //T - 1 (The Bio Generator)
  print(myInfo('Hasan', 23, 'Bangladesh'));

   //T- 2 (Math Shortener)
  print("Area: ${calculateArea(8.5, 9).toStringAsFixed(2)}");

   //T- 3 (Void Check)
  checkPassport(false);
}

String myInfo (String name,int age,String country) =>
  "My name is $name, I am $age years old, and I am from $country.";

double calculateArea(double width, double height) =>
  width * height;

void checkPassport(bool hasPassport){
  if(hasPassport)
    print("You can travel.");
  else
    print("You need to apply for one.");
}