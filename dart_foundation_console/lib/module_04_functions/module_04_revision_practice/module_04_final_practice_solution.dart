String appName = 'Global';


String studentBio(String name, int age, [String country = "Bangladesh"]) {
  return 'name: $name\nAge: $age\nCountry: $country'; 
}
double scholarshipScoreCalculate({required double cgpa  , required double percentage}){
  return cgpa * 20 + percentage * 0.2;
}

String greeting(String name) => "Welcome, $name!";

void scholarshipProcessingComplete() {
  print('scholarship processing completed!!!');
}

void studentInfo(
  String name,
  String department,
  double cgpa,
) {
  print('Name: $name, Department: $department, CGPA: $cgpa');
}

void info({required String name, required String email, required double cgpa, String? phoneNumber}){
  if(phoneNumber == null || phoneNumber.isEmpty){
    print("Phone not provided");
    print('Student name: $name\nEmail: $email\nCGPA: $cgpa');

    return;
  }
  print('Student name: $name\nEmail: $email\nCGPA: $cgpa\nPhone: $phoneNumber');
}

void greeting2(String firstName, [String? lastName]){
  if(lastName == null ||lastName.isEmpty){
    print('Hello, $firstName');
    return;
  }
    print('Hello, $firstName $lastName');
  }

  String validation ({required double cgpa, required double attendance }){
    if(!(cgpa >=0 && cgpa <= 4)){
      return 'invalid CGPA : $cgpa';
    }
    if (!(attendance >= 0 && attendance <= 100)) {
      return 'Invalid attendance: $attendance';
  }
    return 'CGPA: $cgpa, Attendance: $attendance ';
  }

  void anonymousFunctionPrint () {
    List<int> marks = [85, 72, 90, 45, 66];
    ((){
      marks.forEach((value)=> print('Mark: $value'));
    })();
  }

  double higherOrder(double numm, double Function(double) fun){

    return fun(numm);
  }

  double cal (double nummm){
    return 2*nummm;
  }

  void recursiveCountdown(int n){
    if(n <= 0){
      print('Done');
      return; }
    if(n > 0 ){
      print(n);
    }
  recursiveCountdown(n-1);
  }
  String global(){
    return appName;
  }

void main(){
  String appName = 'local';
  print(greeting("Hasan"));
  print(studentBio("Hasan", 25));
  studentInfo('Hasan', 'CSE', 3.9);
  info(name: "Hasan", email: 'erererer@email.com', cgpa: 3.9);
  print(scholarshipScoreCalculate(cgpa: 3.8, percentage: 88.9));
  print(validation(cgpa: 3.8, attendance: 104));
  anonymousFunctionPrint();
  print(appName);
  recursiveCountdown(5);
  print(global());
  scholarshipProcessingComplete();
  print("---");
  print('Named function result: ${higherOrder(17, cal)}');
  print(
  'Anonymous function result: '
  '${higherOrder(17, (value) => value + 10)}',);
  greeting2("Hasan");
  }