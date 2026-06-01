class Thermostar{
  Thermostar(double temprature){
    celsius = temprature;
  }

  double _temprature = 0 ;

  double get celsius{
    return _temprature;
  }

  double get fahrenheit{
    return _temprature * 9 / 5 + 32;
  }

  set celsius (double temp){
    if(temp >= -30 && temp <= 50 ){
      _temprature = temp;
    } else{
      throw Exception("Warning: Temprature out of range");
    }
  }
}
