void main(){
  print(test1('Hasan',null, 3.25));
  print(test2(cgpa: 3.5, name: 'Hasan',location: 'Dhaka'));
  test3('Hasan', 'CSE', 'Dhaka');
}

String test1(String? name, String? department, double cgpa){
  return 'I am $name, I studied at $department, my CGPA was $cgpa';
}

String test2({required String name, 
String? department, 
String? location, 
required double cgpa,
}){
  if (location != null && department != null){
      return 'I am $name, I studied at $department, my CGPA was $cgpa, I live in $location.';
  } else if (department != null){
      return 'I am $name, I studied at $department, my CGPA was $cgpa.';
  } else if (location != null){
      return 'I am $name, my CGPA was $cgpa, I live in $location.';
  } else{
     return 'I am $name, my CGPA was $cgpa ...';
  }}

  void test3(String name, String? department, String? location, [double? cgpa]){
    if(cgpa != null){
     print('I am $name, I studied at $department, my CGPA was $cgpa, I live in $location.......');
     return;
  }

     print('I am $name, I studied at $department, I live in $location.......'); 
  }


