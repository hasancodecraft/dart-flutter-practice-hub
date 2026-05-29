# Module 05 - Class 03: Abstraction, Interface and Polymorphism

## Topics Covered

* Abstraction
* Abstract class
* Abstract method
* Concrete method
* extends
* implements
* Interface
* Method overriding
* Polymorphism
* Runtime polymorphism
* Common parent type
* `super`
* `is`
* `as`
* Payment system practice

## What is Abstraction?

Abstraction means hiding complex implementation details and showing only the necessary structure.

In Dart, abstraction is done using an abstract class.

Example:

abstract class Account {
void deposit();
num withdraw();
}

Here, Account gives a common structure.

But it does not tell exactly how deposit() or withdraw() will work.

Child classes must implement those methods.

## Abstract Class

An abstract class is a class that cannot be used to create an object directly.

Example:

abstract class Account {
void deposit();
}

We cannot do this:

Account account = Account();

Because Account is abstract.

## Abstract Method

An abstract method has no body.

Example:

void deposit();

num withdraw();

These methods must be implemented in child classes.

In my code, deposit() and withdraw() were abstract methods.

## Concrete Method

A concrete method has a body.

Example:

void greetings() {
print('Hello, $userName');
}

If a child class extends the parent class, it can use the concrete method without writing it again.

In my abstraction.dart file, SavingsAccount used the greetings() method from Account.

## extends

extends is used for inheritance.

Example:

class SavingsAccount extends Account

Meaning:

SavingsAccount is a child class of Account.

Using extends:

* Child class can access parent class properties.
* Child class can use parent concrete methods.
* Child class must implement abstract methods.
* Child class can override parent methods.

## implements

implements is used to follow a contract/interface.

Example:

class FixedDepositAccount implements Account

Meaning:

FixedDepositAccount must implement everything from Account.

Important:

If a class uses implements, it must implement all methods and properties.

Even concrete methods from the parent class must be written again.

## extends vs implements

extends means child class inherits code from parent class.

implements means child class follows a contract and writes everything itself.

Example:

class SavingsAccount extends Account

SavingsAccount can use parent concrete method greetings().

Example:

class FixedDepositAccount implements Account

FixedDepositAccount must write userName, deposit(), withdraw(), and greetings() again.

## Interface in Dart

Dart does not use a separate interface keyword.

A class or abstract class can work as an interface.

Example:

abstract class Refund {
void refund();
}

Then another class can implement it:

class Bkash extends PaymentMethod implements Refund

Meaning:

Bkash is a PaymentMethod and also supports refund.

## Abstraction Practice File

File name:

abstraction.dart

In this file, I practiced:

* abstract class Account
* String userName
* abstract method deposit()
* abstract method withdraw()
* concrete method greetings()
* SavingsAccount extends Account
* CheckingAccount extends Account
* FixedDepositAccount implements Account

Important learning:

SavingsAccount and CheckingAccount used extends.

So they could access parent concrete method greetings().

FixedDepositAccount used implements.

So it had to implement greetings() again.

## What is Polymorphism?

Polymorphism means many forms.

Simple meaning:

Same parent type can hold different child class objects.

Same method name can behave differently depending on the actual object.

Example:

Account account1 = SavingsAccount(userName: 'Hasan');

Account account2 = CheckingAccount(userName: 'Rakib');

Account account3 = FixedDepositAccount(userName: 'Karim');

Here, the variable type is Account.

But the actual objects are:

* SavingsAccount
* CheckingAccount
* FixedDepositAccount

## Runtime Polymorphism

Dart supports runtime polymorphism.

Runtime polymorphism means Dart decides which method to run at runtime based on the actual object.

Example:

Account account = SavingsAccount(userName: 'Hasan');

account.deposit();

Here, the variable type is Account.

But the actual object is SavingsAccount.

So Dart runs the deposit() method of SavingsAccount.

## Polymorphism Practice File

File name:

polymorphism.dart

In this file, I practiced:

* abstract class Account
* SavingsAccount extends Account
* CheckingAccount extends Account
* FixedDepositAccount implements Account
* Account type variable holding different child objects
* Same method call with different behavior

Example:

Account account1 = SavingsAccount(userName: 'Hasan');

Account account2 = CheckingAccount(userName: 'Rakib');

Account account3 = FixedDepositAccount(userName: 'Karim');

account1.deposit();

account2.deposit();

account3.deposit();

Important:

The same deposit() method was called.

But the output was different because the actual object was different.

## num Example of Polymorphism

I also practiced a simple type example:

int a = 5;

double b = 6.0;

num x = a;

num y = b;

Here, num is a common parent type.

int and double values can be stored in num type variables.

This is a simple example of using a common type for different value types.

## Payment System Practice

File name:

payment_system_practice.dart

In this practice, I used abstraction, inheritance, interface, and polymorphism together.

Payment methods:

* Bkash
* Nagad
* Card
* Cash

Common parent class:

PaymentMethod

Child classes:

* Bkash extends PaymentMethod
* Nagad extends PaymentMethod
* Card extends PaymentMethod
* Cash extends PaymentMethod

Refund interface:

Refund

Refund supported classes:

* Bkash implements Refund
* Card implements Refund

Refund not supported:

* Nagad
* Cash

## PaymentMethod Abstract Class

PaymentMethod was an abstract class.

It had common properties:

String name

String type

double amount

double total

double charge

double rate

It also had:

bool pay()

void chargeCalculate();

pay() checked if the amount was valid or invalid.

chargeCalculate() was abstract, so every payment class had to implement it.

## bool pay()

pay() returned true or false.

Example:

bool pay() {
if (amount <= 0) {
print('Invalid payment amount');
return false;
} else {
print('Valid payment amount');
return true;
}
}

Meaning:

If amount is 0 or negative, payment is invalid.

If amount is valid, payment can continue.

In main(), I used:

if (payment.pay()) {
payment.chargeCalculate();
}

This means chargeCalculate() will run only if pay() returns true.

## chargeCalculate()

chargeCalculate() calculated charge and final payable amount.

Charge rules:

Bkash charge = 1.5%

Nagad charge = 1%

Card charge = 2%

Cash charge = 0%

Example for Bkash:

rate = 0.015;

charge = amount * rate;

total = amount + charge;

For amount 10000:

Charge = 150

Final payable = 10150

## Polymorphism in Payment System

I used a common parent type list:

List<PaymentMethod> payments = [
Bkash(name: 'Hasan', type: 'Bkash', amount: 10000),
Nagad(name: 'Hossain', type: 'Nagad', amount: 10000),
Card(name: 'Abdullah', type: 'Card', amount: 10000),
Cash(name: 'Jon', type: 'Cash', amount: 0),
];

Here, the list type is PaymentMethod.

But inside the list, there are different child class objects.

This is polymorphism.

Same method call:

payment.chargeCalculate();

But different classes calculate charge differently.

## Refund Interface

Refund was an abstract class used as an interface.

Example:

abstract class Refund {
void refund();
}

Bkash and Card implemented Refund.

Example:

class Bkash extends PaymentMethod implements Refund

class Card extends PaymentMethod implements Refund

So Bkash and Card had to write the refund() method.

Nagad and Cash did not implement Refund.

So they do not have refund().

## is Operator

is is used to check the type of an object.

Example:

if (payment is Refund)

Meaning:

Check if this payment object supports Refund.

In my code:

if (payment is Refund) {
(payment as Refund).refund();
}

Bkash implements Refund, so this condition is true.

Card implements Refund, so this condition is true.

Nagad and Cash do not implement Refund, so they are skipped.

## as Operator

as is used for casting.

Example:

(payment as Refund).refund();

Meaning:

Treat payment as Refund type and call the refund() method.

I used this after checking:

if (payment is Refund)

So the casting was safe.

## Use of super

super is used to access the parent class constructor, method, or property.

Most important use in this class:

Bkash({required super.name, required super.type, required super.amount});

Meaning:

The values received by Bkash constructor are passed to the parent PaymentMethod constructor.

Long version:

Bkash({
required String name,
required String type,
required double amount,
}) : super(name: name, type: type, amount: amount);

Short version:

Bkash({required super.name, required super.type, required super.amount});

Both do the same work.

## When to Use super

Use super when passing values to the parent constructor.

Example:

Bkash({required super.name, required super.type, required super.amount});

Use super when calling a parent method.

Example:

super.display();

Use super when explicitly accessing a parent property.

Example:

super.rate = 0.0;

But in my current code, writing rate = 0.0 is enough because rate is inherited from the parent class.

## Important Understanding

* Abstract class cannot be used to create an object directly.
* Abstract method has no body.
* Abstract method must be implemented by child classes.
* Concrete method has a body.
* extends allows child class to inherit parent code.
* implements forces child class to implement all required properties and methods.
* Dart can use abstract class as an interface.
* Polymorphism means same parent type can hold different child objects.
* Runtime polymorphism means actual object decides which method will run.
* List<PaymentMethod> can store Bkash, Nagad, Card, and Cash objects.
* is checks object type.
* as casts an object to another type.
* super is mainly used to call parent constructor, method, or property.

## Problems Faced

* I was confused about polymorphism.
* I learned that polymorphism means using a common parent type for different child objects.
* I was confused why Dart knows which method to call.
* I learned that Dart checks the actual object at runtime.
* I was confused about extends vs implements.
* I learned that extends inherits code, but implements only follows a contract.
* I was confused about why refund() could not be called directly from PaymentMethod.
* I learned that PaymentMethod does not have refund(), so I need to check payment is Refund first.
* I was confused about is.
* I learned that is checks if an object belongs to a type/class/interface.
* I was confused about as.
* I learned that as casts payment to Refund type before calling refund().
* I was confused about super.rate and rate.
* I learned that both can work if rate is inherited, but rate is cleaner unless I specifically need parent access.
* I was confused about constructor super.
* I learned that required super.name sends the value to the parent constructor.

## Things Practiced

* Created abstract class.
* Created abstract methods.
* Created concrete method.
* Used extends.
* Used implements.
* Used method overriding.
* Used parent constructor forwarding with super.
* Used common parent type variables.
* Used List<PaymentMethod> for polymorphism.
* Used bool return from pay().
* Used if(payment.pay()) before charge calculation.
* Used is to check Refund support.
* Used as to call refund().
* Built a payment system practice with Bkash, Nagad, Card, and Cash.

## Need to Revise

* Abstraction
* Abstract class
* Abstract method
* Concrete method
* extends
* implements
* Interface
* Method overriding
* Polymorphism
* Runtime polymorphism
* Common parent type list
* bool return from method
* super constructor
* is operator
* as casting
* Payment system practice
