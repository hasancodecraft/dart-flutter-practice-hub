void main(){

  //Continue
  //Break
  for (int i = 1; i<= 8; i++){
    if(i == 3 || i == 4 ){
      print("Skipping 3 and 4...");
      continue;
    }

    if(i == 8 ){
      print("Stopping at 8...");
      break;
    }

    print('Processing number: $i');
  }

  //Nested loop
  int rows = 5; //Outer loop limit
  int cols = 3; //Inner loop limit

  //Outer loop (Rows)
  for (int i = 1; i<= rows; i++){
    //Inner Loop (columns)
    for (int j = 1; j<= cols; j++){
      int result = i * j ;
      print("$i x $j = $result");
    }

  print("---");
  }
}