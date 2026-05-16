void main(){
  List<int> numbers = [10,20,30,40,50];

  //Basic for loop
  for(int i = 0; i <numbers.length; i++){
    print("Number[${i+1}]: ${numbers[i]}");
  }

  // Calculate grades
  List<int> markList = [85, 90, 78, 92, 88];
  List<String> gradeList = [];

  for (int mark in markList){
    String temporaryGrade;

    if(mark >= 90){
      temporaryGrade = 'A';
      } else if (mark >= 80){
        temporaryGrade = 'B';
      } else if (mark >= 70){
        temporaryGrade = 'C';
      } else if (mark >= 60){
        temporaryGrade = 'D';
      } else{
        temporaryGrade = 'F';
      }

      print("Marks: $mark, Grade: $temporaryGrade");
      gradeList.add(temporaryGrade);
      }

  print('Grades: $gradeList');

  //While loop

 // While loop is useful when we don't know the exact number of repetitions
  /* while(condition){
    // code to be executed
    // update condition
    } */

   int batteryLevel = 5;
   bool isCharging = false;
   
   while(batteryLevel > 0){
      print('Battery: $batteryLevel% - Still running...');

      if(batteryLevel == 3 && !isCharging){
        print("Battery low. Starting to charge...");
        batteryLevel += 4;
        isCharging = true;
      }
      else if(batteryLevel == 1 ){
      print('Battery: 0% - Shutting down...');
      }

    batteryLevel--;
   }
   
  print("Goodbye");
  
  //Do while
  //First run then check
  int number = 10;

  do {
    print("I am Hasan($number)");
    number++;
  } while (number <5);  //Will not execute more because 11 < 5
  // ${variableName} is used for string interpolation.
  

  // Task 1
  List<int> celsius =[0, 20, 35, -10];
  List<String> finalCelsius = [];
  
  for(int i = 0; i<celsius.length; i++){
    String temp = '${celsius[i]}°C';
    finalCelsius.add(temp);
  }
  // Join() combines all list items into one single String using the given separator.
  String result = finalCelsius.join(' | ');
  print(result);

  }
