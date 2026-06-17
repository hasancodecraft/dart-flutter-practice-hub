import 'dart:io';

void main(){
 stdout.write('Enter your name: ');
 String? name = stdin.readLineSync();
 print('Hey! $name');

 List<String> enrolledCourses = ['Dart', 'Flutter'];
 enrolledCourses.add('Firebase');
 enrolledCourses.remove('Dart');
 print(enrolledCourses.contains('Flutter'));
 print(enrolledCourses);

 List<int> markList = List.filled(3,0);
 markList[0] = 88;
 markList[1] = 89;
 markList[2] = 85;
 print(markList);
// More marks cannot be added because this fixed-length list has size 3.
print('---');
for(int i = 0; i<enrolledCourses.length; i++){
  print('$i: ${enrolledCourses[i]}');
}
print('---');
for( String courseName in enrolledCourses){
  print(courseName);
}
print('---');
enrolledCourses.forEach((courseName)=> print(courseName));
print('---');

List<List> courseScores = [['Bangla',90],['English',95],['Math',99]]; 
print(courseScores[0][1]);

List<String> skillOriginal = ['Data Analysis','SEO','Graphic Design','SEO','Digital Marketing'];
print(skillOriginal);
List<String> skillUnique = skillOriginal.toSet().toList();
print(skillUnique);

Set<String> frontendSkills = {'HTML', 'CSS', 'JavaScript', 'Flutter', 'Dart'};
Set<String> backendSkills = {'Dart', 'Firebase', 'Node.js', 'MongoDB', 'REST API'};

print('---');
print(frontendSkills);
print(backendSkills);
print(frontendSkills.union(backendSkills));
print(frontendSkills.intersection(backendSkills));
print(frontendSkills.difference(backendSkills));

print(skillUnique.contains('SEO'));
List <String> fSkills = skillOriginal.where((skill)=> skill.startsWith('D')).toList();
print(fSkills);

Map<String, dynamic> studentProfile1 = {
  'name': 'Hasan',
  'age': 25,
  'isActive': true,
  'cgpa': 3.9,
  'courses': enrolledCourses,
  'skills': skillUnique,
  'marks': markList,

  'contactInformation':{
    'email': 'hasabshsa@gmail.com',
    'phone': '01752181815616655',
  }
};
print(studentProfile1);
print(studentProfile1.keys);
print(studentProfile1.values);
print(studentProfile1.entries);
print(studentProfile1['contactInformation']['email']);

Map<String, dynamic> address = {
  'city': "Dhaka",
  'country': 'Bangladesh',
  'zip': 1000,
};

Map<String, dynamic> studentProfile2 = {
  'name': 'Hossain',
  'age': 20,
  'isActive': true,
  'cgpa': 3.8,
  'courses': 'EEE',
  'skills': ' hardware design',
  'marks': 99,

  'contactInformation':{
    'email': 'hassinbshsa@gmail.com',
    'phone': '01752181616655',},

  ...address,

  'addressInfo': {...address},
  };

print(studentProfile2);

bool isAdmin = true;
Map<String, dynamic> adminInfo = {
  'role': 'admin',
  'permission': ['read', 'write', 'delete'],
};

Map<String, dynamic> finalProfile = {
  ...studentProfile2,
  if (isAdmin) 'adminDetails': adminInfo,
};

print(finalProfile);
}