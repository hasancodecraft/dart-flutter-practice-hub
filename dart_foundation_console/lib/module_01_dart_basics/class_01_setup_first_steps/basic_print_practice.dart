main(){
  String name = 'Hasan';
  int age = 23;
  double cg = 3.5;
  bool who = true;
  String check = who ? "am" : "am not"; 

  print("Hey!!! I $check $name.");
  print("I am $age years old.");
  print("My university CG was ${cg.toStringAsFixed(2)}.");
  print("I love flowers.");

}
