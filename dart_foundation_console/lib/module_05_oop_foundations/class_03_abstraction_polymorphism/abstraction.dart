// Abstraction - complex jinish lukano
// Poly - (onek) morph - (rup) ism - (bohu rupita)

// Abstract class:
// We cannot create an object of an abstract class.
// Abstract methods do not have a body.
// Abstract methods must be implemented in the child class.
// Concrete methods have a body.
// body chara method k onno class a must be implement kora lgbe(abstract method)
// body soho method abstract class a thaklo child class a implement na krle error debe nah(Concrete Method)
// we can access from parent class variable and Concrete Method

// abstract -> extends
// Interface -> implements

// interface er sokol method r property child class a implement kora lage must
// interface onno file there extends kora jay nah

abstract class Account {
  Account({required this.userName});

  String userName;
  void deposit();
  num withdraw();

  void greetings(){
    print('Hello, $userName');
  }
}

class SavingsAccount extends Account {
  SavingsAccount({required super.userName});

  @override
  void deposit(){
  }

  @override
  num withdraw(){
    return 0;
      }
}

class CheckingAccount extends Account{
  CheckingAccount({required super.userName});
 
 @override
  void deposit(){
  }

  @override
  num withdraw(){
    return 0;
      }
}

class FixedDepositAccount implements Account{
  FixedDepositAccount({required this.userName});

  @override
  String userName;

  @override
  void greetings(){
    print('Hey');
  }

  @override
  void deposit(){}

  @override
  num withdraw(){
    return 0;
      }
}

void main(){

  FixedDepositAccount fixedDepositAccount = 
    FixedDepositAccount(userName: 'Hasan');
  fixedDepositAccount.greetings();

  SavingsAccount savingsAccount = SavingsAccount(userName: 'Hasan');
  savingsAccount.greetings();
}