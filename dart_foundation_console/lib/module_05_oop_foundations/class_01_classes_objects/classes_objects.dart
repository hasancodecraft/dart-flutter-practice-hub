// Class and object
// Instance
// Constructor: default and named
// this keyword  
// this keyword refers to the current object of a class.

// Class is a blueprint/template.
// Object is the real thing created from a class.
// Instance means an object created from a class.

/*
class <Class name>{
  //constructor

  //properties
  //methods
} 
*/

// Constructor helps to create and initialize an object.

class House {

  //constructor
  //default constructor
  House(this.name, this.address, this.color);

  final String name;
  final String address;
  final String color;
}

void main(){
  //object 
  final myHouse = House('Hasan', 'Dhaka', 'Black'); 
  final anotherHouse = House('Hossain', 'Dhaka', 'Red');

  print(myHouse.name);
  print(myHouse.address);
  print(myHouse.color);
}

