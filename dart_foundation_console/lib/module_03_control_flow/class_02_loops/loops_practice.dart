void main(){
  /// Task 1

  List<int> celsius = [0, 20, 35, -10];
  List<String> finalCelsius = [];
  
  for(int i = 0; i<celsius.length; i++){
    String temp = '${celsius[i]}°C';
    finalCelsius.add(temp);
  }
  // join() combines all list items into one single String using the given separator.
  String result = finalCelsius.join(' | ');
  print(result);

  /// Task 2
  
  List<int> priceList = [10, 50, 100, 200];
  List<String> finalPrice =[];

  for(int i = 0; i<priceList.length; i++ ){
    double discount = priceList[i]/2;
    String tag = "\$${discount.toStringAsFixed(2)}";
    finalPrice.add(tag);
  }

  print(finalPrice);

  //Task 3

  List<double> measurements = [1.1234, 5.8999, 10.0001, 3.4]; 
  List<String> measurementsFinal = [];

  for(int i = 0; i<measurements.length; i++){
    String cut = measurements[i].toStringAsFixed(2); // Converts double to String with 2 digits after decimal 
    //For double value: double cleanedValue = double.parse(measurements[i].toStringAsFixed(2));

    measurementsFinal.add(cut);
  }

  print(measurementsFinal);

  //While loop
  int num = 5;

  while(num >= 0){
    print(num);
    num--;
  }
  
  int check = 4;
  do{
    print("Heyy ($check)");
    check--;
  } while (check > -1);
}