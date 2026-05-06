main(){
  String fname = "Mr";
  String lastname = "Hasan";
  double count = 5.0;
  bool check = true;
  var fullname = "Md Hasan";
  dynamic amount = 100;
  const SunRisesFromTheEast = true;
  final time = DateTime.now() ;
  String concat = fname +" " + lastname +".";

  
  print("Hello , I am $concat");
  print("Also you can call me $fname $lastname.");
  print("How many flower did i count ??\n->Ah its $count flowers in total.");
  print("Its $SunRisesFromTheEast that Sun rise from the East.");
  // SunRisesFromTheEast = false; //wrong (changing the constant value isn't possible) 
  print("Ummm today is $time.");
  // time=10;
  print("so what i told before ?\n->i am $fullname.");
  fullname = "Mr Hasan";
  print("Also you can call me $fullname.");
  print("i am $amount now.");
  amount = "fine";
  print("Ah my bad . i am $amount now.");








}