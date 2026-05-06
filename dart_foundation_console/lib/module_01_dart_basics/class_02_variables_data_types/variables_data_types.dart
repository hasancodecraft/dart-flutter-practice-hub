main(){

  String fname = 'Md';
  String lname = 'Hasan';
  int age = 24;
  double number =20.5; 
  bool islogin = false;

  //concatenation

  String fullname = fname+" "+lname;
  String fullname2 = "$fname $lname";

  print(fullname);
  print("$fname $lname");

  print("name: $fullname age: $age values: $number is Login $islogin");
  print("name: $fullname \nage: $age \nvaluse: $number \nis Login $islogin");

  var test =20.0;
  test = 20.1;
  // test = "pass";// Not allowed because test is inferred as double

  test = 1; //accepted beacuse treated as a double 1.0
  print(test);
  
  dynamic test2 = true;
  print(test2);
  test2 = 30.1;
  print(test2);

  const pi = 3.1416; //compile time
  //pi=10; not accepted
  print(pi);

  final currentTime = DateTime.now(); //runtime
  print(currentTime);
}
