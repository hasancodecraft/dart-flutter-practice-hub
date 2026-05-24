
class Student{
  Student({required this.name, required this.studentID, required this.gpa});
String name;
String studentID;
double gpa = 0.00;

  Student.freshman({
    required this.name, required this.studentID});
void printStudentinfo(){
  print('Name: $name');
  print('Student ID: $studentID');
  if(gpa != null) {
  print('GPA: $gpa');}
}
}

main(){

  final starStudent = Student(name: 'Hasan', studentID: '024222adasd', gpa: 3.5 );
  final fresherman = Student.freshman(name: 'Hossain', studentID: '025asdasdd');
  starStudent.printStudentinfo();
  fresherman.printStudentinfo();

}