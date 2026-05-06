## concatenation

  String name = firstString + SecondString;
  String name = firstString +" "+ SecondString;


## Type Inference with `var`

    `var` is used when we want Dart to automatically detect the variable type from the first assigned value.

    Example:

    var age = 23;      // int
    var cgpa = 3.5;    // double
    var name = 'Hasan'; // String

## Dynamic Type in Dart

    `dynamic` is used when a variable can store different types of values.

    Example:

    dynamic value = 10;
    value = 20.5;
    value = "Hasan";
    value = true;

    Here, the same variable can store `int`, `double`, `String`, and `bool`.

    **Important:**  
    `dynamic` allows changing the type after initialization.

    Example:

    dynamic test = 100;
    test = "Passed"; // allowed

    But `var` does not allow changing the type after initialization.

    **Important:**
    - `dynamic` is flexible.
    - But it is less safe than fixed types.
    - Use `dynamic` mainly for JSON/API data or unknown values.
    - Avoid using `dynamic` when the type is already known.

    
## final and const

    final and const are used when a variable value should not be changed.

### final

    final value can be assigned at runtime, but cannot be changed later.

    Runtime means the value is decided while the program is running.

    Example:

    final currentTime = DateTime.now();
    final name = "Hasan";

    Use final when the value may come from user input, API, database, or current time.

### const

    const value must be fixed at compile time, and cannot be changed later.

    Compile time means the value is already known before the program runs.

    Example:

    const pi = 3.1416;
    const appName = "Flutter App";

    Use const when the value is fixed and already known before the program runs.

### Simple Difference
 
    * final = value fixed at runtime
    * const = value fixed at compile time
