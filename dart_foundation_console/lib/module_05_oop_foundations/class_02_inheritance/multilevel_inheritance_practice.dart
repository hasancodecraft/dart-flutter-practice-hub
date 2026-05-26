class Person{
  Person({required this.name, required this.age});
 
  String name;
  int age;

  void displayPersonInfo(){
    print('Name: $name\nAge: $age');
  }
}

class Student extends Person{
  Student({
    required super.name, 
    required super.age, 
    required this.studentId
    });

  String studentId;

  void displayStudentInfo(){
    super.displayPersonInfo();
    print('Student ID: $studentId');
  }
}

class CseStudent extends Student{
  CseStudent({
    required super.name, 
    required super.age, 
    required super.studentId, 
    required this.programmingLanguage
    });

  String programmingLanguage;

  void displayCseStudentInfo(){
    super.displayStudentInfo();
    print('Programming Language: $programmingLanguage');
}}

void main(){
  CseStudent cseStudent = CseStudent(
    name: 'Hasan', 
    age: 25, 
    studentId: 'asdas15515', 
    programmingLanguage: 'C++'
    );
    
  cseStudent.displayCseStudentInfo();
}

