
class Vehicle{
  Vehicle({required this.make, required this.model});
  
  String make;
  String model;

  void drive(){
    print("Drive the $make $model.");
  }
}

class Car extends Vehicle{
  Car({required super.make, required super.model});
  
  int numberOfDoors = 4;

  @override
  void drive(){
    super.drive();
    print('The car has $numberOfDoors doors.');
  }
}

main(){
 final myCar = Car(make: 'Toyota', model: 'Corolla');
 myCar.drive();
}