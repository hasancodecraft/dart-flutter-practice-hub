// is a relationship =  inharitance 
// has-a relationship = composition
// mixin = reusable behavior
// has a / object has a somting - use composition -> mixin
// mixin is used in a class by using 'with'
// mixin helps to reuse code without normal inheritance

mixin flyable{
  void fly() =>  print('I am flying');
}

class Animal{}

class Duck extends Animal with flyable{
}

void main(){
  var donald = Duck();
  donald.fly();
}