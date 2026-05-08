void main(){

  //Growable List
  List<String> pip = ['Hasan','Hossain','Abdullah']; 
  pip.add('King');
  print(pip);
  print("Output: ${pip.contains('King')}");
  
  //Fixed length List
  List<int> numbers = List.filled(5, 2); 
  numbers[1] = 55;
  print(numbers);

  //Nested list
  List<List> all = [
    ['Hasan', 1573, 3.5],
    ['Hossain', 9999, 4.00],
    ['Abdullah', 99999, 4.00]
  ];
  print("${all[0][0]} ${all[1][0]} ${all[2][0]}");

  for (int i = 0; i<pip.length; i++ ){
    print(pip[i]);
  }

  List<int> numbList = [1,2,3,4,5,6]; 
  for(int numberz in numbList){
    print(numberz);
  }

  numbList.forEach((nmm) => print(nmm));

}