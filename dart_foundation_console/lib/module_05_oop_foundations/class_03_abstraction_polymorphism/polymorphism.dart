//polymorphism
// Poly - (onek) morph - (rup) ism - (bohu rupita)
// Polymorphism allows objects of different classes to be treated as objects of a common superclass.
//compile time polymorphism not possible
//Runtime polymorphism is possible

abstract class Account {
  Account({required this.userName});

  String userName;

  void deposit();
  num withdraw();
}

class SavingsAccount extends Account {
  SavingsAccount({required super.userName});

  @override
  void deposit() {
    print('$userName deposited money in Savings Account');
  }

  @override
  num withdraw() {
    print('$userName withdrew money from Savings Account');
    return 0;
  }
}

class CheckingAccount extends Account {
  CheckingAccount({required super.userName});

  @override
  void deposit() {
    print('$userName deposited money in Checking Account');
  }

  @override
  num withdraw() {
    print('$userName withdrew money from Checking Account');
    return 0;
  }
}

class FixedDepositAccount implements Account {
  FixedDepositAccount({required this.userName});

  @override
  String userName;

  @override
  void deposit() {
    print('$userName deposited money in Fixed Deposit Account');
  }

  @override
  num withdraw() {
    print('$userName cannot withdraw before maturity');
    return 0;
  }
}

void main() {
  Account account1 = SavingsAccount(userName: 'Hasan');
  Account account2 = CheckingAccount(userName: 'Rakib');
  Account account3 = FixedDepositAccount(userName: 'Karim');

  account1.deposit();
  account2.deposit();
  account3.deposit();

  int a = 5;
  double b = 6.0;

  num x = a;
  num y = b; 

}
