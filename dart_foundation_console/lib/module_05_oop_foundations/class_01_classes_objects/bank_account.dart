class SavingsAccount{
  //constructor
  //default constructor
  SavingsAccount({required this.customerName, required this.fund});

  //Named constructor
  SavingsAccount.foreign({
    required this.customerName,
    required this.hasPassport,
    required this.fund,
  });
  

  final String customerName;
  int fund;
  bool hasPassport = false;

  void displayFund(){
    print('$customerName\'s fund: $fund');
}

void withdrawMoney(int amount){
  if(amount > fund){
    print('Not enough fund');
  } else {
    fund -= amount;
    print('$customerName\'s fund after withdrawal: $fund');
  }
}
}

void main(){

  final hasanAccount = SavingsAccount(customerName: 'Hasan',fund: 1000000);
  hasanAccount.displayFund();
  hasanAccount.withdrawMoney(1000);

  final jhonAccount = SavingsAccount.foreign(
    customerName: 'Jhon Banega Don', 
    fund: 50000, 
    hasPassport: true
  );
  
  jhonAccount.displayFund();
}
