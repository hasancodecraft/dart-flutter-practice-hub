import 'task_debug.dart';

void main(){

  final celsiusCount = Thermostar(49);
  print(celsiusCount.celsius);
  print(celsiusCount.fahrenheit);

  celsiusCount.celsius = 58 ;
}