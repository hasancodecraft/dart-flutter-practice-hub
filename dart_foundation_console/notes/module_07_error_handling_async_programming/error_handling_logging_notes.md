# Module 07 - Error Handling & Logging

## Topics Covered

* try-catch
* finally
* throw
* Exception
* Custom exception
* catch(error, stackTrace)
* on SpecificException catch
* Multiple custom exceptions
* e.message
* stackTrace
* First exception stops the try block

## Files Practiced

* error_handling_logging.dart
* error_handling_logging_another_way.dart
* practice_atm_withdraw_system.dart

## Error Handling

Error handling is used to handle risky code safely.

Basic structure:

```dart
try {
  // risky code
} catch (error) {
  // handle error
} finally {
  // always run
}
```

`try` contains code that may throw an error.

`catch` handles the error.

`finally` always runs, whether an error happens or not.

## Exception

`Exception` is used to represent errors.

We can create our own custom exception by implementing `Exception`.

Example:

```dart
class InsufficientFundsException implements Exception {
  InsufficientFundsException(this.message);

  String message;
}
```

Here, `message` stores the error message.

## throw

`throw` is used to manually send an exception.

Example:

```dart
throw InsufficientFundsException('Not enough balance');
```

This creates an `InsufficientFundsException` object and stores the message inside it.

After `throw`, the method stops and control goes to the matching `catch` block.

## catch(error, stackTrace)

Example:

```dart
catch (error, stackTrace) {
  if (error is InsufficientFundsException) {
    print(error.message);
  }
}
```

`error` receives the thrown exception object.

`stackTrace` shows where the error happened.

`error is InsufficientFundsException` checks if the thrown error is that specific custom exception type.

## e.message

When an exception class has a `message` field, we can read it in catch.

Example:

```dart
on InsufficientFundsException catch (e) {
  print(e.message);
}
```

Here, `e` is the caught exception object.

`e.message` prints the message passed during `throw`.

## finally

`finally` always runs.

Example:

```dart
finally {
  print('Transaction complete');
}
```

This is useful for cleanup or final messages.

## on SpecificException catch

Another way to handle a specific error type:

```dart
on InsufficientFundsException catch (_, stackTrace) {
  print("Looks like you don't have enough money in your account");
}
```

`on InsufficientFundsException` means this block runs only when that specific exception is thrown.

`_` means the value is ignored because it is not used.

## General catch

After specific `on` blocks, we can use a general catch.

Example:

```dart
catch (error, _) {
  print('An unexpected error occurred');
}
```

This handles unexpected errors.

## One Try Block Stops at First Exception

In one `try` block, only the first thrown exception is handled.

Example:

```dart
try {
  account.withdraw(500);
  print(10 ~/ 0);
}
```

If `account.withdraw(500)` throws an exception, the next line will not run.

So if we want to test multiple risky codes, we should use separate try-catch blocks.

## Bank Balance Practice

In `error_handling_logging.dart`, I practiced:

* custom `InsufficientFundsException`
* `BankBalance` class
* `withdraw(double amount)`
* throwing exception if amount is greater than balance
* handling error with `catch(error, stackTrace)`
* checking error type using `if (error is InsufficientFundsException)`
* printing `error.message`
* using `finally`

## Another Way Practice

In `error_handling_logging_another_way.dart`, I practiced:

* `on InsufficientFundsException catch`
* catching specific exception directly
* using `_` to ignore unused error object
* using general `catch` for unexpected errors
* using `finally`

## ATM Withdraw Practice

In `practice_atm_withdraw_system.dart`, I practiced two custom exceptions:

```dart
InvalidAmountException
InsufficientBalanceException
```

Logic:

* If amount is 0 or negative, throw `InvalidAmountException`.
* If amount is greater than balance, throw `InsufficientBalanceException`.
* Otherwise, withdraw successfully and update balance.

Example:

```dart
if (amount <= 0) {
  throw InvalidAmountException('Invalid amount. Please enter a positive amount.');
} else if (amount > balance) {
  throw InsufficientBalanceException('Not enough balance.');
}
```

## Important Understanding

* `throw` sends an exception object.
* `catch` receives the thrown exception object.
* Custom exception can store a message.
* Constructor stores the message in the exception object.
* `e.message` reads the message from the exception.
* `on ExceptionType catch` directly handles a specific exception type.
* `_` means the value is ignored.
* `stackTrace` helps find where the error happened.
* `finally` always runs.
* A try block stops when the first exception is thrown.

## Problems Faced

* I was confused about where the manual error message is stored.
* I learned that the message is stored inside the custom exception object.
* I was confused about how `catch(error, stackTrace)` gets the error value.
* I learned that Dart automatically sends the thrown exception object to `catch`.
* I was confused about `error is InsufficientFundsException`.
* I learned that it checks the type of the caught error object.
* I was confused about `on InsufficientFundsException catch(e)`.
* I learned that it only runs for that specific exception type.
* I was confused if two errors inside one try block can both run.
* I learned that the first thrown exception stops the try block.

## Things Practiced

* Created custom exception classes.
* Used constructor to store error message.
* Used `throw` to send custom errors.
* Used `try-catch-finally`.
* Used `catch(error, stackTrace)`.
* Used `on SpecificException catch`.
* Used multiple custom exceptions.
* Used `e.message`.
* Used `_` to ignore unused values.
* Practiced ATM withdraw validation.

## Need to Revise

* try-catch-finally
* throw
* custom exception
* implements Exception
* message field
* catch(error, stackTrace)
* on SpecificException catch
* e.message
* stackTrace
* finally
* first exception stops try block
* separate try-catch for multiple risky codes