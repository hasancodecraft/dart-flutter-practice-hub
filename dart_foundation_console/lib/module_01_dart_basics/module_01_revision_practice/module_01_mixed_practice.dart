void main(){

// class = 1
bool numm = true;
double y  = 5.5555;
print(y.toStringAsFixed(4));
String ok = numm ? 'done' : 'not done';
print(ok);
 
// class = 2
const int pi = 5; //compile time
final int yi = 2; //runtime

var name = 'Hasan';
dynamic name2 = 'Hossain';
name2 = 2;
name2 = true;

final time = DateTime.now();
print(name);
print(name2);
print(time);
var dub = 20.0;
dub = 1;
print(dub);

List<dynamic> nm = [1,8,9,6,3,9,5,3];
nm[0]=2;
print(nm);
nm.removeAt(3);
print(nm);
nm.removeLast();
print(nm);
nm.removeWhere((value)=>value == 9);
print(nm);
nm.sort();
print(nm);
nm.reversed;
List<dynamic> kk = nm.reversed.toList();
nm = kk;
print(nm);
nm.add(8);
nm.remove(8);
print(nm);
}