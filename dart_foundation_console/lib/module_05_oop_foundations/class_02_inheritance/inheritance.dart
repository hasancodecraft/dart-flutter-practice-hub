// constructor is a special type of function
// Constructor helps to create an object from a class template.

// Inheritance
// Parent -> Super Class
// Child -> Sub Class

class ParentClass{
  ParentClass({required this.name});

  String name;
  String hairColor = 'Black';
  String eyeColor = 'Brown';
  String height = "5'8";

void display(){
  print("name: $name");
  print('Hair color: $hairColor');
  print('Eye color: $eyeColor');
  print('Height: $height');
}}

class ChildClass extends ParentClass{
    // ChildClass({required String name}): super (name: name);
    ChildClass({required super.name});
  
  @override
  void display(){
    super.height = "6'0";
    super.display();
  }
}

void main(){
  ParentClass parent = ParentClass(name: 'Taherul');
  parent.display();

  ChildClass child = ChildClass(name: 'Hasan');
  child.display();
}