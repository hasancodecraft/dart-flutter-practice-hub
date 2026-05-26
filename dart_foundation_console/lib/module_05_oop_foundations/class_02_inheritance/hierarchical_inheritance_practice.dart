//University Person Management System
class Person{
  Person({required this.name, required this.age, required this.address});
  String name;
  int age;
  String address;

void displayInfo(){
  print("Name: $name\nAge: $age\nAddress: $address");
}
}

class Student extends Person{
  Student({required super.name, required super.age, required super.address, required this.studentId, required this.department, required this.cgpa});
  String studentId;
  String department;
  double cgpa;
@override
  void displayInfo(){
    super.displayInfo();
    print('Student ID: $studentId\nDepartment: $department\nCGPA: $cgpa\n');
    
  }
}

class Teacher extends Person{
  Teacher({required String name, required int age, required String address,
  required this.teacherId, 
  required this.subject, 
  required this.salary}): 
  super(name:name, age:age, address:address);

  String teacherId;
  String subject;
  int salary;

@override
void displayInfo(){
  super.displayInfo();
  print('Teacher ID: $teacherId\nSubject: $subject\nSalary: $salary\n');
}}

void main(){

  Student student = Student(name: 'Hasan', age: 25, address: 'Dhaka', studentId: '1573', department: 'CSE', cgpa: 3.25);
  student.displayInfo();

  Teacher teacher = Teacher(name:"Abdul Karim", age: 50, address: 'Uttara, Dhaka', teacherId: 'sads554', subject: 'CSE', salary: 500000);
  teacher.displayInfo();
}