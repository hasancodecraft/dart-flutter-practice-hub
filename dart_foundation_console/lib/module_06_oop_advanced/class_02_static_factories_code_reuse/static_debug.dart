class Car{
  Car({required this.name, required this.model, required this.year});
  
  String name, model;
  int year;

  static int totalCars = 100;

  static void updateTotalCars(){
    totalCars -= 1;
  }
}