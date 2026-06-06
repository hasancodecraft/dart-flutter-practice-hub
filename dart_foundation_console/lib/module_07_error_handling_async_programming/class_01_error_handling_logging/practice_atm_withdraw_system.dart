class InvalidAmountException implements Exception{
  InvalidAmountException(this.message);
  String message;
}

class InsufficientBalanceException implements Exception{
  InsufficientBalanceException(this.message);
  String message;
}
class ATMAccount{
  double balance = 200.0;

  void withdraw(double amount){
    if(amount <= 0){
      throw InvalidAmountException('Invalid amount. Please enter a positive amount.');
    } else if(amount > balance){
        throw InsufficientBalanceException('Not enough balance.');
    } else {
      balance -= amount;
      print('Withdraw $amount successful. Remaining balance: $balance');
    }
  }
}

void main(){
  ATMAccount account = ATMAccount();
  try{
  account.withdraw(500);
  } on InvalidAmountException catch(e){
    print(e.message);
  } on InsufficientBalanceException catch(e){
    print(e.message);
  } catch(e, stackTrace){
  print("Something went wrong");
  print("StackTrace: $stackTrace");
  } finally{
  print('done');
 }
}