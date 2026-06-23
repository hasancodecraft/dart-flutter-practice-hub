Future<void> main() async{
  print('Order placed...');

  String orderStatus = await prepareOrder();

  print("Order Status: $orderStatus");
}

Future<String> prepareOrder() {
  return Future.delayed(Duration(seconds: 3), // First argument: delay duration
  () {
    return 'Burger is ready';
    }, // Second argument: anonymous function that runs after the delay
  );
}