import 'dart:io';

late String customerName;

class InvalidNameException implements Exception {
  InvalidNameException(this.message);
  final String message;

  @override
  String toString() {
    return message;
  }
}

class InvalidOrderAmountException implements Exception {
  InvalidOrderAmountException(this.message);
  final String message;

  @override
  String toString() {
    return message;
  }
}

class InsufficientBalanceException implements Exception {
  InsufficientBalanceException(this.message);
  final String message;

  @override
  String toString() {
    return message;
  }
}

Future<void> main() async {
  bool paymentSuccessful = false;
  late String finalEmail;
  String? nameInput;
  String? emailInput;
  String? balanceInput;
  String? orderAmountInput;

  try {
    stdout.write("Enter Your User Name: ");
    nameInput = stdin.readLineSync();
    if (nameInput == null || nameInput.trim().isEmpty) {
      throw InvalidNameException("Name cannot be empty");
    }

    stdout.write("Enter Your Email: ");
    emailInput = stdin.readLineSync();

    if (emailInput == null || emailInput.trim().isEmpty) {
      finalEmail = "Email not provided";
    } else {
      finalEmail = emailInput.trim();
    }
    customerName = nameInput.trim();

    stdout.write("Enter Your User Balance: ");
    balanceInput = stdin.readLineSync();
    double? finalBalanceInput = double.tryParse(balanceInput ?? "");

    if (finalBalanceInput == null || finalBalanceInput <= 0) {
      throw InsufficientBalanceException("Invalid balance");
    }

    stdout.write("Enter order amount: ");
    orderAmountInput = stdin.readLineSync();
    double? finalOrderAmountInput = double.tryParse(orderAmountInput ?? "");
    if (finalOrderAmountInput == null) {
      throw InvalidOrderAmountException("Invalid order amount format");
    }

    double remainingBalance = processPayment(
      balance: finalBalanceInput,
      orderAmount: finalOrderAmountInput,
    );

    print("Payment successful");
    print("Remaining balance: $remainingBalance");

    paymentSuccessful = true;
  } on InvalidNameException catch (e) {
    print(e.message);
  } on InvalidOrderAmountException catch (e) {
    print(e.message);
  } on InsufficientBalanceException catch (e) {
    print(e.message);
  } catch (e, stackTrace) {
    print("Unknown error: $e");
    print("Stack trace: $stackTrace");
  } finally {
    print("Payment validation finished");
  }
  if (!paymentSuccessful) {
    return;
  }

  print("Preparing your order...");
  print(await prepareOrder(customerName));

  verifyEmail(finalEmail)
      .then((message) => print(message))
      .catchError((e) {
        print("Email verification failed: $e");
      })
      .whenComplete(() => print("Email verification finished"));
  print('Other main function work continues...');

  print("Sequential tasks:");

  await confirmPayment();
  await cookFood();
  await arrangeDelivery();

  print("Concurrent tasks:");

  await Future.wait([confirmPayment(), cookFood(), arrangeDelivery()]);
  orderStatusStream().listen(
    (data) => print(data),
    onDone: () => print("Order tracking completed"),
  );
}

double processPayment({required double balance, required double orderAmount}) {
  if (orderAmount <= 0) {
    throw InvalidOrderAmountException("Order amount must be greater than zero");
  }
  if (orderAmount > balance) {
    throw InsufficientBalanceException("Insufficient balance");
  }
  return balance - orderAmount;
}

Future<String> prepareOrder(String customerName) async {
  await Future.delayed(Duration(seconds: 2));
  return 'Order is ready for $customerName';
}

Future<String> verifyEmail(String email) async {
  await Future.delayed(Duration(seconds: 2));
  if (email == "Email not provided") {
    throw Exception("Email not provided");
  }
  return "Email verified: $email";
}

Future<void> confirmPayment() async {
  print("Confirm payment started");
  String result = await Future.delayed(
    Duration(seconds: 1),
    () => "Payment confirmed after 1 second",
  );
  print(result);
}

Future<void> cookFood() async {
  print("Cook food started");
  String result = await Future.delayed(
    Duration(seconds: 2),
    () => "Food cooked after 2 seconds",
  );
  print(result);
}

Future<void> arrangeDelivery() async {
  print("Arrange delivery started");
  String result = await Future.delayed(
    Duration(seconds: 1),
    () => "Delivery arranged after 1 second",
  );
  print(result);
}

Stream<String> orderStatusStream() async* {
  List<String> statuses = [
    "Order received",
    "Payment confirmed",
    "Food is being prepared",
    "Food is ready",
    "Out for delivery",
    "Delivered",
  ];
  for (int i = 0; i < statuses.length; i++) {
    await Future.delayed(Duration(seconds: 1));
    yield statuses[i];
  }
}
