// Composition means one class has objects of other classes.
// It represents HAS-A relationship.
// Example: Car HAS-A Engine and Car HAS-A Tires.

// Component 1
class Engine{
  Engine(this.type);
  String type;

  void start() => print('$type Engine starting...');
}

// Component 2
class Tires{
  Tires(this.size);
  int size;

void showTireInfo() {
  print('Tire size is $size inches.');
} 
} 

// Composition Class
class Car{
  Car(this.model, this.engine, this.tires);
  String model;
  
// Composition: Car HAS-A Engine and HAS-A Tires.
  Engine engine;
  Tires tires;

  void startCar(){
    print('Checking system for $model');
    engine.start();
    tires.showTireInfo();
  }
}


void main(){
  var v8 = Engine('V8');
  var offRoadTires = Tires(22);

  // Constructing object via composition
  var myCar = Car('Monster Truck', v8, offRoadTires);

  myCar.startCar();
}