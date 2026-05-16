# Module 3 - Class 2 Notes: Loops in Dart

## What is a Loop?

A loop is used to repeat a block of code multiple times.

Normally, code runs line by line from top to bottom. But sometimes we need to repeat the same task again and again.

Example:

- Print numbers from 1 to 10
- Print every item from a list
- Calculate grades from multiple marks
- Run a countdown
- Keep running a process while a condition is true

For these repeated tasks, we use loops.

Main loop topics:

- for loop
- for-in loop
- while loop
- do-while loop

---

## For Loop

A for loop is useful when we know how many times we want to repeat something.

Basic structure:

for initialization, condition, and update.

Example idea:

Start from index 0.  
Run until index is less than list length.  
Increase index by 1 each time.

I used for loop to print all numbers from a list.

Important:

List index starts from 0.

So if a list has 5 items, the indexes are:

0, 1, 2, 3, 4

---

## For Loop with List

I practiced this list:

List of numbers: 10, 20, 30, 40, 50

Using for loop, I printed each number with its position.

Example output idea:

Number[1]: 10  
Number[2]: 20  
Number[3]: 30  

Important:

i is used as index.

numbers[i] means the value at index i.

i + 1 is used when we want to show human-friendly position starting from 1.

---

## For-In Loop

A for-in loop is used when we only need the item value from a list.

It is simpler than normal for loop when index is not needed.

Example idea:

For each mark in markList, calculate grade.

I used for-in loop to calculate grades from a list of marks.

---

## Grade Calculation with Loop

I practiced grade calculation using a list of marks.

Marks list:

85, 90, 78, 92, 88

For each mark:

- 90 or above = A
- 80 or above = B
- 70 or above = C
- 60 or above = D
- Otherwise = F

Then I stored every grade inside a new list.

Important:

A temporary variable can be used inside loop to store the result for each item.

Example idea:

temporaryGrade stores the grade for the current mark.

After calculating, I added the grade to gradeList.

---

## While Loop

A while loop is useful when we do not know the exact number of repetitions.

It keeps running as long as the condition is true.

Basic idea:

while condition is true, run the code.

Important:

In while loop, we must update the condition inside the loop.  
Otherwise, the loop can become an infinite loop.

---

## Battery Example with While Loop

I practiced a phone battery lifecycle example.

Starting battery level was 5.

The loop kept running while battery level was greater than 0.

Each time, battery level decreased by 1.

When battery level became 3, the phone started charging and battery level increased.

Important:

A boolean variable like isCharging can be used to track state.

Example idea:

isCharging = false means phone is not charging.  
isCharging = true means phone started charging.

This helped me understand how condition and state can work inside a loop.

---

## Infinite Loop

An infinite loop happens when a loop condition never becomes false.

Example idea:

If batteryLevel never decreases, the loop may never stop.

To stop a running infinite loop in VS Code terminal:

Ctrl + C

Important:

Always update loop condition carefully.

---

## Do-While Loop

A do-while loop first runs the code, then checks the condition.

This means do-while loop runs at least one time, even if the condition is false.

Example idea:

number = 10

The code prints once.  
Then it checks if number is less than 5.  
Since the condition is false, it stops.

Important:

do-while is useful when we want the code to run at least once.

---

## Practice Task 1: Celsius Formatting

I practiced converting a list of Celsius values into formatted text.

Input:

0, 20, 35, -10

Output idea:

0°C | 20°C | 35°C | -10°C

I learned:

- How to loop through a list
- How to create a new string from each value
- How to add formatted values to a new list
- How to use join()

---

## join()

join() combines all list items into one single String using the given separator.

Example idea:

If list has:

0°C, 20°C, 35°C, -10°C

Then join(' | ') makes:

0°C | 20°C | 35°C | -10°C

Important:

join() does not replace comma.  
When we print a list directly, Dart shows comma automatically.  
join() creates a new single String using the separator we provide.

Common examples:

join(' | ') adds pipe between items.  
join(' ') adds space between items.  
join(', ') adds comma between items.  
join() or join('') adds nothing between items.

---

## Practice Task 2: Bulk Discount

I practiced calculating 50% discount from a list of prices.

Prices:

10, 50, 100, 200

For each price:

discount = price / 2

Then I added dollar sign and formatted the value with two decimal places.

Example output:

$5.00  
$25.00  
$50.00  
$100.00  

Important:

To print dollar sign in Dart string, we write:

\$ 

Because $ is normally used for string interpolation.

---

## Practice Task 3: Data Cleaner

I practiced formatting decimal numbers to exactly two digits after decimal point.

Input:

1.1234, 5.8999, 10.0001, 3.4

Output:

1.12, 5.90, 10.00, 3.40

I used:

toStringAsFixed(2)

Important:

toStringAsFixed(2) converts a double value into a String with 2 digits after decimal point.

It is useful for display formatting.

If I need the result as double again, I can use double.parse(), but then extra zeros like 5.90 may show as 5.9.

So for display output, List<String> is better.

---

## Countdown with While Loop

I practiced a countdown using while loop.

Starting value was 5.

The loop continued while the number was greater than or equal to 0.

Each time, I printed the number and decreased it by 1.

Important:

while (num >= 0) means:

Run the loop while num is 0 or greater than 0.

---

## Countdown with Do-While Loop

I also practiced countdown using do-while loop.

Starting value was 4.

The loop printed the value first, then decreased it.

The condition checked if the value was greater than -1.

This printed:

4, 3, 2, 1, 0

Important:

do-while runs first, then checks condition.

---

## Things I Practiced Today

Today I practiced:

- Basic for loop
- Looping through a list using index
- for-in loop
- Grade calculation from a list
- Adding values to a new list
- while loop
- Battery lifecycle example
- Boolean state inside loop
- Infinite loop idea
- Stopping terminal using Ctrl + C
- do-while loop
- Celsius formatting
- join()
- 50% discount calculation
- Dollar sign in String
- toStringAsFixed(2)
- Countdown using while and do-while

---

## Important Mistakes I Learned

while (num == 0) will not run if num starts from 5.

If I want to run from 5 to 0, I should use:

while (num >= 0)

In a while loop, I must update the condition.  
Otherwise, it can become an infinite loop.

toStringAsFixed(2) returns String, not double.

join() creates a single String from list items.

\$ is used when I want to print the dollar sign.

---

## Summary

Loops help us repeat code.

For loop is good when we know how many times the loop should run.  
For-in loop is good when we only need list item values.  
While loop is good when repetition depends on a condition.  
Do-while loop runs at least once before checking the condition.

Today I learned how to use loops with lists, conditions, formatting, and simple real-life examples.