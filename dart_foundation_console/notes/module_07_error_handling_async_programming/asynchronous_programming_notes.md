# Module 07 - Class 03: Asynchronous Programming

## Topics Covered

* Asynchronous programming
* Future
* async
* await
* Future.delayed()
* Direct Future return
* Future chaining
* then
* catchError
* whenComplete
* Future.wait()
* Stream
* async*
* yield
* listen
* onDone

## Files Practiced

* future_async_await.dart
* future_async_await_practice.dart
* future_delayed_practice.dart
* future_chaining_then_catch_when_complete.dart
* future_chaining_practice.dart
* future_wait_multiple_tasks.dart
* stream.dart
* stream_count_numbers_practice.dart

## What is Asynchronous Programming?

Asynchronous programming means a task may finish later.

Some tasks need time to complete, such as:

* API call
* Firebase login
* File download
* Database read/write
* Timer
* Image loading

Dart uses Future and Stream to handle asynchronous work.

## Future

A Future represents one value that will come later.

Memory:

Future = one value later

Example:

Future<int> means an int value will come later.

A Future can complete in two ways:

* with a value
* with an error

Important:

Future return পাওয়া মানে actual value পাওয়া না.
Future হলো later result এর object/token.

## Why Future is Important

Future is important because real apps do many tasks that do not finish immediately.

Example:

Login request takes time.
API response takes time.
File download takes time.

Without Future/async, the app could freeze while waiting.

Future helps the app continue running and handle the result later.

## async

async makes a function asynchronous.

It allows await inside the function.

Example:

Future<int> getNumber() async {
return 7;
}

Because the function is async, Dart returns the value as a Future.

Memory:

async = needed when await is used inside a function

## await

await waits for a Future to complete and gives the actual value.

Memory:

Future<int> -> await -> int
Future<String> -> await -> String
Future<bool> -> await -> bool
Future<double> -> await -> double

Example:

int result = await Future.delayed(Duration(seconds: 1), () => 42);

Meaning:

Wait 1 second.
Get 42.
Store 42 in result.

Important:

Future.delayed() says value will come later.
await waits until that value comes.

## Future.delayed()

Future.delayed() creates a Future that completes after a delay.

Example:

await Future.delayed(Duration(seconds: 5));

This waits for 5 seconds.

Example with value:

int result = await Future.delayed(Duration(seconds: 1), () => 42);

This waits 1 second, then gives 42.

## future_async_await.dart

This file practiced basic Future, async, and await.

Main idea:

* Print starting message
* Wait for lucky number
* Print lucky number

Flow:

* main starts
* Calculating message prints
* getLuckyNumber() is called
* await waits for the Future result
* getLuckyNumber waits 5 seconds
* returns 7
* main receives 7
* lucky number prints

Important learning:

async is needed when await is used inside a function.
await waits for Future result before running the next line.

## future_async_await_practice.dart

This file practiced a download simulation.

Main idea:

* Download started
* Wait 4 seconds
* Return File downloaded successfully
* Print download status

This helped me understand delayed Future<String> result.

## Direct Future Return

A function can return a Future directly without async.

Example:

Future<String> prepareOrder() {
return Future.delayed(Duration(seconds: 3), () {
return 'Burger is ready';
});
}

Here async is not needed because there is no await inside the function.

Important:

async is needed only when await is used inside that function.

## future_delayed_practice.dart

This file practiced direct Future return.

Main idea:

* prepareOrder() directly returns Future.delayed()
* main waits using await
* order status prints after delay

Important learning:

Future.delayed() can be used as wait + result.

## Future Chaining

Future chaining means handling a Future without await.

Basic structure:

futureFunction(input)
.then((value) {
// success work
})
.catchError((error) {
// error work
})
.whenComplete(() {
// final work
});

Meaning:

then = success
catchError = error
whenComplete = always at the end

## then

then runs only when the Future completes successfully.

Example:

.then((result) => print(result))

The Future success value comes inside result.

## catchError

catchError runs when the Future completes with an error.

Example:

.catchError((e) => print('Error: $e'))

If an async function throws an error, the Future completes with error.

## whenComplete

whenComplete always runs at the end.

It runs after success or error.

Example:

.whenComplete(() => print('Finished'))

It works like finally.

## future_chaining_then_catch_when_complete.dart

This file practiced:

* then
* catchError
* whenComplete
* callback registration
* without await flow

Main flow:

* main starts
* Starting operation prints
* parseData("Hasan") is called
* callbacks are registered
* main does not wait
* normal print runs first
* Future completes successfully
* then runs
* catchError skips
* whenComplete runs

Important:

then, catchError, and whenComplete do not run immediately.
They are registered as callbacks.
They run later when the Future completes.

## Callback Registration vs Execution

This was an important learning.

Callback registration = Dart saves what should run later.
Callback execution = Dart actually runs the saved callback later.

Example:

then is registered first.
But it runs later only if Future succeeds.

## Without await in main

If there is no await in main, main does not wait for the Future.

Flow:

* Future call starts
* callbacks are registered
* next normal print runs immediately
* Future callback runs later

Memory:

Normal print = immediately
Future callback = later

## Call Stack and Event Loop

When there is no await in main:

* main finishes remaining synchronous lines
* main exits the call stack
* program stays alive because Future callbacks are pending
* Dart handles the completed Future
* correct callback runs

Better wording:

main finishes synchronous lines and exits the call stack.

Do not say:

main exits completely

That can be confusing.

## future_chaining_practice.dart

This file practiced username validation using Future chaining.

Main idea:

* checkUsername waits 2 seconds
* if username is empty, throw error
* if username is not empty, return accepted message
* main handles success/error using chaining

Important:

Future<String> success value is accessed inside then((result) {...})

## Throw inside async function

If an async function throws an error, the Future completes with error.

Example:

if (username.isEmpty) {
throw Exception('Username is empty');
}

Then:

* then skips
* catchError runs
* whenComplete runs

## Future.wait()

Future.wait() runs multiple Future tasks together.

Example:

await Future.wait([
fetchDataInOneSecond(),
fetchDataInTwoSecond(),
fetchDataInThreeSecond(),
]);

Meaning:

All tasks start together.
Future.wait waits until all Futures finish.
Total time depends on the longest Future.

## Sequential await vs Future.wait()

Sequential await:

await fetch1();
await fetch2();
await fetch3();

Meaning:

one by one
total time = sum of all delays

Future.wait:

await Future.wait([
fetch1(),
fetch2(),
fetch3(),
]);

Meaning:

all together
total time = longest delay

## future_wait_multiple_tasks.dart

This file practiced running multiple Future tasks together.

Example:

* 1 second task finishes first
* 2 second task finishes second
* 3 second task finishes last

Important:

Shorter tasks may finish earlier.
Future.wait completes only after all tasks finish.
Total time depends on the longest task.

## Stream

A Stream represents many values over time.

Memory:

Future = one value later
Stream = many values over time

Example:

Future = one API response
Stream = timer ticks, live data, Firebase realtime updates

## Why Stream is Important

Stream is useful when data comes again and again.

Examples:

* Timer tick
* Live chat
* Firebase realtime update
* Location update
* Download progress
* Text input change
* WebSocket messages

## async*

async* is used for Stream functions.

Example:

Stream<int> countSeconds(int max) async* {
yield 1;
}

Memory:

async = Future function
async* = Stream function

Another memory:

Future হলে async
Stream হলে async*
Future এ return
Stream এ yield

## yield

yield sends a value to the Stream listener.

Example:

yield i;

Meaning:

Send current i to the listener.
Then continue the loop.

Important:

yield sends value but does not stop the loop.

## listen

listen receives values from a Stream.

Example:

countSeconds(10).listen((data) {
print(data);
});

Meaning:

When Stream sends data, listen receives it.

Memory:

Stream = data sends
listen = data receives

## onDone

onDone runs when the Stream finishes sending all values.

Example:

onDone: () => print('Timer finished!')

Meaning:

Stream er sob data pathano sesh hole onDone run kore.

## stream.dart

This file practiced:

* Stream<int>
* async*
* yield
* listen
* onDone

Main flow:

* Timer Started prints
* countSeconds(10) starts listening
* wait 1 second
* yield 1
* listen receives 1
* prints Tick: 1
* continues until 10
* onDone runs after stream finishes

## stream_count_numbers_practice.dart

This file practiced a small number stream.

Main idea:

* countNumbers(5)
* send 1 to 5
* wait 1 second before each value
* listen prints each number

Expected output:

Counting started...
Number: 1
Number: 2
Number: 3
Number: 4
Number: 5

## Block Body vs Arrow Body

Block body:

.then((value) {
print(value);
})

Inside {}, statements need semicolon.

Arrow body:

.then((value) => print(value))

Here one expression is used, so no inner semicolon is needed.

Memory:

{} block body = statement er seshe ; lage
=> arrow body = single expression, inner ; lage na
whole chain seshe final ; lage

## Newly Learned

* Future return পাওয়া মানে actual value পাওয়া না.
* Future<int> and int are different.
* await Future<int> gives the actual int.
* Future.delayed() says value will come later.
* await waits until that value comes.
* then, catchError, and whenComplete are callbacks.
* Callback registration and callback execution are different.
* Without await, main does not wait.
* Normal print can run before Future callback.
* Future callbacks can keep the program alive.
* Future.wait() runs multiple Futures together.
* Total time in Future.wait() depends on the longest Future.
* Stream gives many values over time.
* async* is for Stream functions.
* yield sends data without stopping the loop.
* listen receives Stream data.
* onDone runs when Stream finishes.

## Problems Faced

* I was confused why await is needed before Future.delayed().
* I thought await converts Future<int> to int.
* I learned better: await waits and gets the actual value.
* I was confused between Future.delayed() and await.
* I learned Future.delayed() creates delayed result, and await waits for it.
* I was confused why then does not run immediately.
* I learned then runs only after Future success.
* I was confused why normal print runs before Future result.
* I learned main does not wait without await.
* I was confused about “main exits completely.”
* I learned main finishes synchronous lines and exits the call stack.
* I was confused about semicolon in arrow function and block function.
* I learned block body needs semicolon, but arrow body does not need inner semicolon.
* I was confused why async* is used instead of async.
* I learned async* allows yield and creates Stream.
* I learned yield does not stop loop.
* I learned listen receives Stream values.

## Things Practiced

* Created Future functions.
* Used async and await.
* Used Future.delayed().
* Returned Future directly from function.
* Used then for success.
* Used catchError for error.
* Used whenComplete for final work.
* Used Future.wait() for multiple tasks.
* Created Stream using async*.
* Sent Stream data using yield.
* Received Stream data using listen.
* Used onDone after Stream completion.
* Practiced Future and Stream problems.

## Need to Revise

* Future vs actual value
* Future<T> vs T
* Why await is needed
* async function behavior
* Direct Future return
* Future.delayed() syntax
* Future chaining
* Callback registration vs execution
* Without await flow
* Future.wait timing
* Future vs Stream
* async vs async*
* return vs yield
* listen
* onDone

## Small Style Reminder

* Keep Dart file comments short and useful.
* Put long explanations in note.md.
* Use Future<void> main() async when await is used in main.
* Use clean spacing in loops and function declarations.
* In listen, print directly. No need to write return print(...).

## Final Memory

Future = one value later
Stream = many values over time

async = Future
async* = Stream

return = Future final value
yield = Stream value one by one

await = wait for Future result
listen = receive Stream values

then = success
catchError = error
whenComplete = always at the end

Future.wait = run multiple Futures together
