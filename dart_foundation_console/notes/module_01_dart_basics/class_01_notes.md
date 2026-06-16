## Why we need main() function?
    main() is the entry point of a Dart program. When we run a Dart file, execution starts from the main() function.

## Variables type:

     1.int 
     2.String 
     3.Bool 
     4.Duble
     5.num(int and double);

## Same Line Output:

    `stdout.write()` prints output on the same line because it does not automatically add a new line. 
    
    `print()` prints output and then moves to the next line.

    stdout.write(greeting);
    stdout.write("!!!"); -> Hey!!!


## Difference between $name and ${cg.toStringAsFixed(2)}:

    `$variable` is used for simple variables inside a String. 
    
    `${expression}` is used for method calls, calculations, or complex expressions.


## Fixed Digits After Decimal Point

**Method:** `toStringAsFixed()`

`toStringAsFixed(2)` is used to show 2 digits after the decimal point.

**Example:**

double cg = 3.5;
String formattedCg = cg.toStringAsFixed(2);

print(formattedCg);