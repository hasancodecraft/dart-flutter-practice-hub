// Static members belong to the class itself, not to individual objects.
// Static variables and methods are accessed using the class name.
// Static data is shared by all objects of the class.
// We should not access static members through an object or instance.

import 'static_debug.dart';

void main(){
  Car hasanCar = Car(name: 'Toyota', model: 'Corolla', year: 2018);

  print('total cars: ${Car.totalCars}');
  Car.updateTotalCars();
  print(hasanCar.name);
  print('Total updated cars: ${Car.totalCars}\n');


  Car hossainCar = Car(name: 'Toyota', model: 'Corolla', year: 2018);

  print('total cars: ${Car.totalCars}');
  Car.updateTotalCars();
  print(hossainCar.name);
  print('Total updated cars: ${Car.totalCars}');
}
 