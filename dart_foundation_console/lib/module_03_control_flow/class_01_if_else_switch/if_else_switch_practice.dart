import 'dart:io';

void main(){
String name = 'Hasan';
int age1 = 24;

String name2 = 'hossain';
int age2 = 18;

if(name == "Hasan"){
  if(age1 >= 18){
    print("Hasan is an adult person");
  }
  else{
    print("Hasan is not an adult person");
  }}
  else if(name2 == "Hossain"){
    if(age2 >= 18){
    print("Hossain is an adult person");
  }
  else{
    print("Hossain is not an adult person");
  }}
  else{
    print("Invalid input");
  }

  //
    stdout.write("Your CGPA: ");
  String? input = stdin.readLineSync();

  double? cgpa = double.tryParse(input ?? "");
  // Basic input parsing, but risky if user gives wrong input
  //double cgpa = double.parse(input!);

  if (cgpa == null) {
    print("Invalid input. Please enter a number.");
    return;
  }

  switch(cgpa){
    case <= 4 &&  >=3.5  : 
      print("Excellent(${cgpa.toStringAsFixed(2)})");
    case < 3.5 && >=3:
      print("Good(${cgpa.toStringAsFixed(2)})");
    case >=2 && <3 :
      print("Need to improve(${cgpa.toStringAsFixed(2)})");
    case >4 || < 0:
       print("Invalid CGPA(${cgpa.toStringAsFixed(2)})");
    default:
       print("Talk to your course teacher(${cgpa.toStringAsFixed(2)})");
  }
  
  var check = switch(cgpa){
    <= 4 &&  >=3.5  => "Excellent" ,
    < 3.5 && >=3 =>"Good",
    >=2 && <3 => "Need to improve",
    >4 || < 0 => "Invalid input",
    _=> "Talk to your course teacher",
  };
  print("$check... result is : ${cgpa.toStringAsFixed(2)}");
  
  }
