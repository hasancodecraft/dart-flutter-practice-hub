class MyClass{
  MyClass(this.userName);

  String userName;

  int _bankBalance = 42;

  int get bankBalance{
    return _bankBalance;
  } 

  void set bankBalance(int value){
    if (value >=0){
      if(userName == 'Hasan'){
        _bankBalance = value;
      } else {
        throw Exception('Only Hasan can set the value');
      }
     } else {
      print('Bank balance cannot be negative');
    }
  }
}