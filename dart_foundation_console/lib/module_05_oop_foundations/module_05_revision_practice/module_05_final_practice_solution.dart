
class Person{
  Person({required this.name, required this.age, required this.address});

String  name;
int age;
String address;

void displayInfo(){
  print("Name: $name, Age: $age, Address: $address");
}
}

class Student extends Person{
  Student({
    required super.name, 
    required super.age, 
    required super.address,
    required this.studentId, 
    required this.department, 
    required this.cgpa});

  Student.freshman({
    required super.name,  
    required super.age, 
    required super.address,
    required this.studentId, 
    required this.department, 
    }){}


int  studentId;
String department; 
double cgpa = 0.00;

  @override
  void displayInfo() {
    print(
      "Name: $name, Age: $age, Address: $address, "
      "Student ID: $studentId, Department: $department, CGPA: $cgpa",
    );
 }
}

class CseStudent extends Student{
  CseStudent({
    required super.name, 
    required super.age, 
    required super.address,
    required super.studentId, 
    required super.department, 
    required super.cgpa,
    required this.programmingLanguage});

String programmingLanguage;

  @override
  void displayInfo(){
  print("Name: $name, Age: $age, Address: $address, Student ID: $studentId, Department: $department, CGPA: $cgpa, Programming Language: $programmingLanguage");
  }
}

class Teacher extends Person{
    Teacher({
      required super.name, 
      required super.age, 
      required super.address,
      required this.teacherId,
      required this.subject,
      required this.salary});

  String teacherId;
  String subject; 
  double salary;

  @override
  void displayInfo(){
    if(salary < 0){
      print("Name: $name, Age: $age, Address: $address, Teacher ID: $teacherId, Subject: $subject, salary: Invalid");
      return;
    }
      print("Name: $name, Age: $age, Address: $address, Teacher ID: $teacherId, Subject: $subject, salary: $salary");
    }
}

abstract class PaymentMethod {
  PaymentMethod({required this.userName, required this.amount});
  String userName; 
  double amount;
  bool amountCheck = true;

  void amountValidation(){
    if(amount <= 0){
      amountCheck = false;
    }
  }
  void chargeCalculation();
  void paymentCompletion();
}

class Bkash extends PaymentMethod implements Refund{
  Bkash({
    required super.userName, 
    required super.amount});
  
  @override
  void chargeCalculation(){
    double chargeAmount = amount * 0.015;
    double finalAmount = amount + chargeAmount;
    print("Username: $userName,\nPayment method: Bkash\nOriginal amount: $amount\nCharge Amount: $chargeAmount\nFinal payable amount: $finalAmount");
  }

  @override
  void paymentCompletion(){
    print("Payment Completed ");
    }

  @override
  void refund(){
    print('Refunded Successfully');
  }
} 

class Nagad extends PaymentMethod{
  Nagad({
    required super.userName, 
    required super.amount});

  @override
  void chargeCalculation(){
    double chargeAmount = amount * 0.010;
    double finalAmount = amount + chargeAmount;
    print("Username: $userName,\nPayment method: Nagad\nOriginal amount: $amount\nCharge Amount: $chargeAmount\nFinal payable amount: $finalAmount");
  }

  @override
  void paymentCompletion(){
    print("Payment Completed ");
    }
} 

class Card extends PaymentMethod implements Refund{
  Card({
    required super.userName, 
    required super.amount});

  @override
  void chargeCalculation(){
    double chargeAmount = amount * 0.020;
    double finalAmount = amount + chargeAmount;
    print("Username: $userName,\nPayment method: Card\nOriginal amount: $amount\nCharge Amount: $chargeAmount\nFinal payable amount: $finalAmount");
  }

  @override
  void paymentCompletion(){
    print("Payment Completed ");
    }

  @override
  void refund(){
  print('Refunded Successfully');
}
} 

class Cash extends PaymentMethod{
  Cash({
    required super.userName, 
    required super.amount});


  @override
  void chargeCalculation(){
    double chargeAmount = 0 ;
    double  finalAmount = amount;
    print("Username: $userName,\nPayment method: Cash\nOriginal amount: $amount\nCharge Amount: $chargeAmount\nFinal payable amount: $finalAmount");
  }

  @override
  void paymentCompletion(){
    print("Payment Completed ");
    }
} 

abstract class Refund {
  void refund();
}


void main(){

  List <PaymentMethod> paymentMethods = [
    Bkash(userName: "Hasan", amount: 0),
    Nagad(userName: "Hossain", amount: 20000),
    Card(userName: "Abdullah", amount: 50000),
    Cash(userName: "John", amount: 10000)
  ];
for (PaymentMethod names in paymentMethods ){
  names.amountValidation();
  if(!names.amountCheck){
     print("invalid amount");
  } else{
    names.chargeCalculation();
    names.paymentCompletion();
  }
}

for (PaymentMethod payment in paymentMethods) {
  if (payment is Refund) {
    (payment as Refund).refund();
  }
}
Student student = Student(name: "Hasan", age: 25, address: 'Dhaka', studentId: 1573, department: "CSE", cgpa: 3.5);
CseStudent cseStudent = CseStudent(name: "Hossain", age: 19, address: "Nilphamari", studentId: 1234, department: "Software", cgpa: 3.9, programmingLanguage: "Dart");
Teacher teacher = Teacher(name: "John Banega Don", age: 33, address: "Dhaka", teacherId: "t1287", subject: "CSE", salary: 60000);

student.displayInfo();
cseStudent.displayInfo();
teacher.displayInfo();

Student freshman = Student.freshman(
  name: "Rahim",
  age: 18,
  address: "Dhaka",
  studentId: 1574,
  department: "CSE",
);

freshman.displayInfo();
}