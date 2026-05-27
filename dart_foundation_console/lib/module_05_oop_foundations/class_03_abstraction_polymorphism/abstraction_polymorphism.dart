//Abstraction - complex jinish lukano
//Poly - (onek) morph - (rup) ism - (bohu rupita)

//Abstraction
//we cant create object of it
//no body for abstruct method
//body chara method k onno class a must be initialize kora lgbe(abstrust method)
//body soho method abstruct class a thaklo child class a impliment na krle error debe nah(Concrite Method)
// we can access from parent class variable and concrite method
abstract class Account {
  void deposit(); // abstract method
  num withdraw(); // abstract method
}

class SavingsAccount extends Account {
  // implement
  @override
  void deposit() {}

  @override
  num withdraw() {
    return 0;
  }
}

class CheckingAccount extends Account {
  // implement
  @override
  void deposit() {}

  @override
  num withdraw() {
    return 0;
  }
}

class FixedDepositAccount extends Account {
  // implement
  @override
  void deposit() {}

  @override
  num withdraw() {
    return 0;
  }
}