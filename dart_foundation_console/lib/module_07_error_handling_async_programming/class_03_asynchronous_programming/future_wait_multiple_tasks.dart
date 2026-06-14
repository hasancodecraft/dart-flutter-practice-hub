// Future.wait() runs multiple Future tasks together.
// It waits until all Futures are completed.
// Total time depends on the longest Future, not the sum of all Futures.
// Shorter tasks may finish earlier, but Future.wait completes only after the longest task finishes.
 
 Future<void> main() async {
  await Future.wait([
   fetchDataInTwoSecond(),
   fetchDataInOneSecond(),
   fetchDataInThreeSecond()]);
 }

 Future<void> fetchDataInTwoSecond() async {
  print('Fetching data in two seconds...');
   int result = await Future.delayed(Duration(seconds: 2),() => 42); // Use await to wait for 2 seconds, then get the value.
   print(result); 
 }
  Future<void> fetchDataInOneSecond() async {
  print('Fetching data in one second...');

   int result = await Future.delayed(Duration(seconds: 1),() => 84);
   print(result); 
  
 }
  Future<void> fetchDataInThreeSecond() async {
  print('Fetching data in three seconds...');

   int result = await Future.delayed(Duration(seconds: 3),() => 126);
   print(result); 
 }