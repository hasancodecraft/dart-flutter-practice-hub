// is-a relationship = inheritance
// has-a relationship = composition
// mixin = code reuse without normal inheritance
// mixin is used in child class with 'with'
// If two mixins have the same method, the last mixin wins 

mixin flyable{
  void fly() =>  print('I am flying1');
}

mixin flyable2{
  void fly() =>  print('I am flying2');
}

class Animal{}

class Duck extends Animal with flyable, flyable2{}

void main(){
  var donald = Duck();
  donald.fly();
}