abstract class PaymentMethod {
  PaymentMethod({required this.name, required this.type, required this.amount});
  String name, type;
  double amount;
  double total = 0 ;
  double charge = 0 ;
  double rate = 0;
 
  bool pay(){
    if(amount <= 0){
      print('Invalid payment amount\n');
      return false;
      } else {
          print('Valid payment amount\n');
          return true;
  }
}
  void chargeCalculate();
}

class Bkash extends PaymentMethod implements Refund{
  Bkash({required super.name, required super.type, required super.amount});

  @override
  void chargeCalculate(){
      rate = 0.015;
      charge = amount * rate;
      total = amount + charge ; 
      print('User: $name\nMethod: $type\nAmount: $amount\nCharge: $charge\nFinal Payable: $total\n$type payment completed\n');
  }
  @override
  void refund() {
  print('Bkash refund completed for $name\n');
 } 
}

class Nagad extends PaymentMethod{
  Nagad({required super.name, required super.type, required super.amount});

 @override
  void chargeCalculate(){
      rate = 0.010;
      charge = amount * rate;
      total = amount + charge ; 
      print('User: $name\nMethod: $type\nAmount: $amount\nCharge: $charge\nFinal Payable: $total\n$type payment completed\n');
  }
}
 
class Card extends PaymentMethod implements Refund{
  Card({required super.name, required super.type, required super.amount});

  @override
  void chargeCalculate(){
      rate = 0.020;
      charge = amount * rate;
      total = amount + charge ; 
      print('User: $name\nMethod: $type\nAmount: $amount\nCharge: $charge\nFinal Payable: $total\n$type payment completed\n');
  }
  @override
  void refund() {
  print('Card refund completed for $name\n');
 }
}
 
class Cash extends PaymentMethod{
  Cash({required super.name, required super.type, required super.amount});

  @override
  void chargeCalculate(){
      rate = 0.0;
      total = amount + charge ; 
      print('User: $name\nMethod: $type\nAmount: $amount\nCharge: $charge\nFinal Payable: $total\n$type payment completed\n');
  }
}

abstract class Refund {
  void refund();
}

void main(){

  List<PaymentMethod> payments =[
    Bkash(name: 'Hasan', type: 'Bkash', amount: 10000),
    Nagad(name: 'Hossain', type: 'Nagad', amount: 10000),
    Card(name: 'Abdullah', type: 'Card', amount: 10000),
    Cash(name: 'Jon', type: 'Cash', amount: 0)];
  
  for(PaymentMethod payment in payments){
    if(payment.pay()){
    payment.chargeCalculate();}
  }

  for (PaymentMethod payment in payments) {
    if (payment is Refund) {
      // payment k Refund type hisebe treat kore refund method call kora hocche
      (payment as Refund).refund();
  }
 }
}

