// 'late' is used for deferred initialization.
// It is used when we want to assign the value of a variable later.
// Another condition is that the value can't be null.
late String name;

void main(){
  name = 'Flutter';
  print(name);
}