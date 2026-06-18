import 'dart:io';

void main(){
  stdout.write('Enter your name: ');
  String? name = stdin.readLineSync();
  stdout.write('Enter your CGPA: ');
  String? cgpa = stdin.readLineSync();
  double? cgpaFinal = double.tryParse(cgpa ?? '');

if(name == null || name.trim().isEmpty){
  print('Hey! Guest Student');
} else{
  print('Hey! ${name.trim()}');
}

  if(cgpaFinal == null){
    print("Invalid input");
    return;
  }
  switch(cgpaFinal){

    case < 0 || > 4:
    print('Invalid CGPA');

    case <= 4.00 && > 3.5: 
      print('Excellent');

  case <= 3.5 && > 3:
    print("Good");

  case <= 3 && > 2.00:
    print('Need to improve');

   default :
    print('Poor');
}

List<int> marks = [85, 90, -5, 78, 101, 60, 40];
List<String> marksFinal = [];

for (int i = 0; i<marks.length; i++){
  if(marks[i] < 0 ){
    continue;
  } else if(marks[i] > 100){
    print("Warning! Invalid mark: ${marks[i]}");
    break;
  } else {
  marksFinal.add(
  switch (marks[i]) {
    >= 90 => 'A',
    >= 80 => 'B',
    >= 70 => 'C',
    >= 60 => 'D',
    >= 40 => 'E',
    _ => 'F',
  },
);
  }}
print("Final grades are: ${marksFinal.join(' | ')}");

int check = 3;
while(check > 0){
  print(check);
  check --;
}

int p = 1;
do{
  print('System check completed');
  p --;
} while(p > 0);
List <String> allStudents = ['Hasan', 'Hossain', 'Abdullah', 'Hasan', 'Nimmi', 'Jeba'];
List <String> presentStudents = ['Hasan', 'Abdullah', 'Jeba'];
List <String> absent = [];
for(int i = 0; i<presentStudents.length; i++){
  for(int j = 0 ; j<allStudents.length; j++){
    if(presentStudents[i] != allStudents[j] && !presentStudents.contains(allStudents[j])){
      if(!absent.contains(allStudents[j])){
        absent.add(allStudents[j]);}
    }
  }
}
print("All Students: ${allStudents.toSet().toList()}");
print("Present Students:$presentStudents");
print("Absent Students:$absent");
}

/* List<String> allStudents = ['Hasan', 'Hossain', 'Abdullah', 'Hasan', 'Nimmi', 'Jeba'];
List<String> presentStudents = ['Hasan', 'Abdullah', 'Jeba'];

List<String> checkedPresent = [];
List<String> absent = [];

for (int i = 0; i < allStudents.length; i++) {
  String student = allStudents[i];
  bool isPresent = false;

  for (int j = 0; j < presentStudents.length; j++) {
    if (student == presentStudents[j]) {
      isPresent = true;
      break;
    }
  }

  if (isPresent) {
    if (!checkedPresent.contains(student)) {
      checkedPresent.add(student);
    }
  } else {
    if (!absent.contains(student)) {
      absent.add(student);
    }
  }
}

print("All Students: ${allStudents.toSet().toList()}");
print("Present Students: $checkedPresent");
print("Absent Students: $absent"); */