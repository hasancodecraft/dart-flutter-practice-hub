void main(){
String firstName = 'Md';
String lastName = 'Hasan';
int age = 22 ;
double cgpa = 3.75899;
bool isPassed = true;
List<int> marks = [80, 98, 75, 69, 88, 96];

print('Name: $firstName $lastName');
String concat = firstName+" "+lastName;

print('name: $concat');
print('Age: $age');
print('CGPA: ${cgpa.toStringAsFixed(2)}');

String check = isPassed ? "Passed" : "Failed";

print('Exam Status: $check');

marks.add(99);
marks.addAll([88,93]);
marks.insert(1, 96);
marks.sort();
marks.remove(69);
List<int> reverseOrder = marks.reversed.toList(); 
marks.removeWhere((value)=> value == 88);

print('\nFinal marks list: $marks');
print('reversed marks list: $reverseOrder');
print('List length: ${marks.length}');

int totalMarks = 0 ; 
for (int value in marks){
  totalMarks += value; 
}
double averageMarks = totalMarks / marks.length;

print('average mark: ${averageMarks.toStringAsFixed(2)}');

if(averageMarks >= 80 && isPassed == true){
  print("Eligible for next module: true");
} else{
  print("Eligible for next module: false");
 }
}