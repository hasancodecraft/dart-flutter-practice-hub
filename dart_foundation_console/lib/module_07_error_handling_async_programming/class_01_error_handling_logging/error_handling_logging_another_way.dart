/*try{
  //jei code error hote pare
} catch (error) {
  //error handle korar code
} */

// Error class - Exception
// Exception is a class used to represent errors.
// finally is used for cleanup code and it always runs.
// In one try block, only the first thrown exception is handled.
// After an exception is thrown, the try block stops.

//custom exception 
class InsufficientFundsException implements Exception{
  InsufficientFundsException(this.message);

  String message;
}

class BankBalance{
  double balance = 100.0;
  
  void withdraw(double amount){
    if(amount > balance){
      throw InsufficientFundsException('Not enough balance');
    }
    balance -= amount;
    print('Withdraw \$$amount. Remaining: \$$balance');
  }
}

void main(){
  var account = BankBalance();
  try{
    account.withdraw(500);
    // print(10 ~/ 0); // this will throw an exception
  } on InsufficientFundsException catch (_, stackTrace){ // This block runs only when InsufficientFundsException is thrown.
    print("Looks like you don't have enough money in your account");
    print("Stack trace: $stackTrace");
  } catch (error, _){
   print('An unexpected error occurred');
    }
   finally { 
    print('Transaction complete');}
}