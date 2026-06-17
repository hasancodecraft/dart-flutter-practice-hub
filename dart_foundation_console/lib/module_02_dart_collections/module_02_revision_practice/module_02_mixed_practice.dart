import 'package:dart_foundation_console/module_05_oop_foundations/class_01_classes_objects/classes_objects_practice.dart';

void main(){
  List<String> growableNames = ['Hasan', 'Hossain'];
  print(growableNames);

for(int i = 0; i< growableNames.length; i++){
  print(growableNames[i]);
} 
print("---");
for(String names in growableNames ){
  print(names);
}
print("---");
growableNames.forEach((value) => print(value));

List<List<int>> tungtung = [
  [1,2,3], [4,5,6], [7,8,9],
  [5,6,4], [1,2,9], [8,9,6],
  [7,9,6], [8,5,7], [5,7,3],
  ];
print(tungtung[0][2]);
tungtung.add([4,5]);
print(tungtung);
tungtung.addAll([[1],[1]]);
print(tungtung);
tungtung.removeAt(10);
print(tungtung);
tungtung.insert(1, [5]);
print(tungtung);
tungtung[0].add(5);
print(tungtung);
tungtung[0].remove(2);
print(tungtung);
tungtung[1].removeAt(0);
print(tungtung);
List<dynamic> ok = List.filled(3, 'k');
print(ok);
print(tungtung[0].contains(1));


/* stdout.write("Your name: ");
String? nameee = stdin.readLineSync();
print('Hey!! $nameee '); */

Set<dynamic>king = {1,2,3,4,5};
king.add(10);
print(king);
print(king.contains(3));

for(int aya in king){
  print(aya);
}
// king[0]= 5;
// print(king);

List<dynamic> listt = king.toList();
print(listt); 

listt[2] = 99;
king = listt.toSet();
print(king);

List<dynamic> uniqueFind = [1,5,8,7,9,6,7,8,2,4,5,6,4,2,1,2,4,1,2,3];
print("Unique values: ${uniqueFind.toSet().toList()}");

Set a = {1,2,3,4,5};
Set b = {4,5,6,7,8,};
Set c = b.difference(a);
print(c);

List<int> numberz = [1,2,3,4,1];
  
var test = numberz.any((element) => element == 1);
print(test);

List test2 = numberz.where((element) => element == 1).toList();
print('Chk: $test2');

Map <int,String> kuku = {
  1: 'One',
  2: 'Two',
  3: 'Three', 
};
print(kuku);
print(kuku.keys);
print(kuku.values);
kuku.addAll({4: 'h'});
print(kuku);
kuku[4] = 'Four';
print(kuku);
kuku.remove(4);
print(kuku);
kuku.removeWhere((key,value) => (key) == 1);
print(kuku);

Map<String, Map<String, dynamic>> nested = {
'Student1': {
  'name': 'Hasan',
  'Id': 1573,
  'cgpa': 3.9,
},

'Student2': {
  'name': 'Hossain',
  'Id': 1579,
  'cgpa': 4.00,
},  
};
print(nested);
print(nested.keys);
print(nested.values);
print(nested['Student1']);
// nested['Student1'] = {'p':1};
print('Msp entries: ${nested.entries}');
nested.remove('Student1');
print(nested);
nested['Student2']?.remove('name');
print(nested);
nested['Student2']?.removeWhere((key, value) => key == 'Id');
print(nested);
print(kuku.entries);

// double imm= nested['Student2']['cgpa'];

Map<String, dynamic> nested2 = {
'Student1': {
  'name': 'Hasan',
  'Id': 1573,
  'cgpa': 3.9,
},
...nested,
'Student1': {...nested}};
print(nested2);
}