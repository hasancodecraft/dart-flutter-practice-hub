# Module 3 - Class 3 Notes: Loop Control and Nested Loop

## What I Learned Today

Today I learned how to control loops and how nested loops work in Dart.

Main topics:

- continue
- break
- nested loop
- outer loop
- inner loop
- multiplication table using nested loop
- comparing two lists using nested loop
- checking present and absent students
- removing duplicate values using contains()

---

## Loop Control

Loop control means controlling how a loop runs.

Sometimes we do not want the loop to run normally from start to end.

Example:

- We may want to skip some values
- We may want to stop the loop at a specific value
- We may want to stop the inner loop after finding a match

For these cases, we use loop control keywords.

Main loop control keywords:

- continue
- break

---

## Continue

continue is used to skip the current loop step and move to the next iteration.

Example idea:

If the value is 3 or 4, skip that value.

In my class code:

if i is 3 or 4, I printed a skipping message and used continue.

Meaning:

When i is 3, the loop skips the rest of the code for that step.  
When i is 4, the same thing happens.  
Then the loop continues from the next value.

Important:

continue does not stop the full loop.  
It only skips the current iteration.

---

## Break

break is used to stop the loop completely.

Example idea:

If the value becomes 8, stop the loop.

In my class code:

When i became 8, I printed a stopping message and used break.

Meaning:

When i is 8, the loop stops.  
No next iteration runs after that.

Important:

break stops the full loop.  
continue only skips one iteration.

---

## Difference Between Continue and Break

continue means skip the current step and continue the loop.

break means stop the loop completely.

Example:

If a loop runs from 1 to 8:

- 3 and 4 can be skipped using continue
- 8 can stop the loop using break

So:

continue = skip one step  
break = stop the loop

---

## Class Code: Continue and Break

I practiced a loop from 1 to 8.

Logic:

- If i is 3 or 4, skip it
- If i is 8, stop the loop
- Otherwise, process the number

Example output idea:

Processing number: 1  
Processing number: 2  
Skipping 3 and 4...  
Skipping 3 and 4...  
Processing number: 5  
Processing number: 6  
Processing number: 7  
Stopping at 8...

Important:

The print after continue does not run for 3 and 4.

The loop stops completely when break runs at 8.

---

## Nested Loop

A nested loop means one loop inside another loop.

The outer loop controls the outside level.  
The inner loop runs inside the outer loop.

Basic idea:

for outer loop:
  for inner loop:
    run code

Important:

For every one time the outer loop runs, the inner loop runs fully.

---

## Outer Loop and Inner Loop

In my class code, I used:

rows = 5  
cols = 3

The outer loop controlled rows.  
The inner loop controlled columns.

Meaning:

- Outer loop runs 5 times
- For each outer loop run, inner loop runs 3 times
- Total inner loop output = 5 x 3 = 15

So nested loop is useful when we need repeated work inside repeated work.

---

## Multiplication Table with Nested Loop

I practiced multiplication using nested loop.

Logic:

result = i * j

Then I printed:

i x j = result

Example output idea:

1 x 1 = 1  
1 x 2 = 2  
1 x 3 = 3  
---  
2 x 1 = 2  
2 x 2 = 4  
2 x 3 = 6  
---

Important:

The outer loop changes the row number.  
The inner loop changes the column number.  
Together they create multiplication results.

---

## Practice: Present and Absent Student Checker

I practiced a nested loop problem where I checked which students were present and which students were absent.

I used two input lists.

allStudentList:

Hasan, Hossain, Abdullah, Hasan, Nimmi, Jeba

presentStudents:

Hasan, Hossain, Abdullah

I created two empty lists:

checkPresent  
checkAbsent

Goal:

- If a student from allStudentList exists in presentStudents, add to checkPresent
- If a student does not exist in presentStudents, add to checkAbsent
- Avoid duplicate names like duplicate Hasan

Expected output:

Checked present students: [Hasan, Hossain, Abdullah]  
Checked absent students: [Nimmi, Jeba]

---

## How the Nested Loop Worked in Practice

Outer loop:

The outer loop takes one student from allStudentList.

Inner loop:

The inner loop checks that student with every student from presentStudents.

Example:

Current student is Hossain.

presentStudents list:

Hasan, Hossain, Abdullah

Check flow:

Hossain == Hasan? No  
Hossain == Hossain? Yes  

So Hossain is present.

After finding a match, the inner loop stops using break.

---

## Why Break Was Needed in Practice Code

When a student matches with a present student, there is no need to check the rest of the presentStudents list.

Example:

If current student is Hasan:

Hasan == Hasan? Yes

After this, checking with Hossain and Abdullah is not needed.

So I used break.

Important:

break stops the inner loop after finding a match.

This saves extra checking and also helps avoid wrong absent logic.

---

## Using contains() to Remove Duplicate Values

I used contains() to check if a value already exists in a list.

Example idea:

If checkPresent does not contain the student, then add the student.

Meaning:

contains() checks if a list already has a value.

!contains() means the list does not have that value.

So:

!checkPresent.contains(allStudentList[i])

means:

This student is not already inside checkPresent.

This helped me remove duplicate Hasan.

---

## Duplicate Hasan Problem

In allStudentList, Hasan appears two times.

If I add Hasan every time I find it, then checkPresent may become:

Hasan, Hossain, Abdullah, Hasan

But I wanted each present student only once.

So I used contains() before adding.

Final present list:

Hasan, Hossain, Abdullah

---

## Absent Student Logic

The hardest part was understanding absent logic.

A student is not absent just because the student does not match one item from presentStudents.

Example:

Current student is Hossain.

First comparison:

Hossain != Hasan

This does not mean Hossain is absent.

Because the next comparison is:

Hossain == Hossain

So Hossain is actually present.

Important rule:

A student is absent only if the student does not match any student in the full presentStudents list.

---

## Why Absent Check Should Not Be Too Early

If I add absent inside every mismatch, wrong result can happen.

Example:

Current student is Hossain.

presentStudents:

Hasan, Hossain, Abdullah

First check:

Hossain != Hasan

If I add Hossain to absent here, it is wrong.

Because Hossain matches in the next step.

So absent decision should be made only after checking the full presentStudents list.

---

## Using Last Index for Absent Check

I used this idea:

j == presentStudents.length - 1

Meaning:

We reached the last item of presentStudents list.

If we reach the last item and still no match is found, then the student is absent.

Example:

Current student is Nimmi.

Check flow:

Nimmi == Hasan? No  
Nimmi == Hossain? No  
Nimmi == Abdullah? No  

After the last check, no match was found.

So Nimmi is absent.

---

## Meaning of length - 1

List index starts from 0.

If a list has 3 items, the indexes are:

0, 1, 2

The length is 3.

So the last index is:

length - 1

That means:

3 - 1 = 2

So:

presentStudents.length - 1

means the last index of presentStudents.

---

## Important Mistake 1: Comparing String with List

Wrong idea:

allStudentList[i] == presentStudents

Problem:

allStudentList[i] is one String.  
presentStudents is a full List.

So this comparison is wrong.

Correct idea:

allStudentList[i] == presentStudents[j]

Because presentStudents[j] is one student name from the list.

---

## Important Mistake 2: Using Wrong Index

Wrong idea:

presentStudents[i]

Problem:

i belongs to allStudentList.

allStudentList has more items than presentStudents.

So when i becomes bigger than presentStudents length, it can cause range error.

Correct idea:

presentStudents[j]

Because j belongs to the inner loop and presentStudents list.

---

## Important Mistake 3: Mixing Match Check and Duplicate Check

Wrong idea:

Check match and duplicate in the same condition.

Problem:

If duplicate Hasan comes again, it already exists in checkPresent.

So the duplicate check becomes false.

But Hasan still matched with presentStudents.

If break does not run after match, duplicate Hasan may go to absent logic wrongly.

Better idea:

First check if the student matches.  
Then separately check duplicate before adding.  
After match, always use break.

Important:

Duplicate Hasan is still present, not absent.

---

## Final Practice Logic

For each student in allStudentList:

1. Compare with each student in presentStudents
2. If match found:
   - Add to checkPresent if not already added
   - Stop inner loop using break
3. If last present student is checked and no match found:
   - Add to checkAbsent if not already added

This logic correctly separates present and absent students.

---

## Things I Practiced Today

Today I practiced:

- continue
- break
- skipping values in a loop
- stopping a loop
- nested loop
- outer loop
- inner loop
- multiplication table logic
- comparing two lists using nested loop
- checking present students
- checking absent students
- avoiding duplicate values using contains()
- using break after finding a match
- understanding last index using length - 1

---

## Need to Revise

I need to revise:

- Difference between continue and break
- Nested loop flow
- Outer loop and inner loop index
- Why break is needed after match
- How contains() removes duplicate values
- Why absent check should wait until the last inner loop item
- Meaning of j == presentStudents.length - 1
- Difference between i and j in nested loop

---

## Important Understanding

continue skips one loop step.

break stops the loop.

Nested loop means loop inside another loop.

Outer loop selects one item.

Inner loop checks that item against another list.

contains() checks if a list already has a value.

length - 1 means the last index of a list.

Absent decision should be made only after checking the full present list.

---

## Summary

Today I learned how to control loops using continue and break.

I also learned how nested loops work with outer and inner loops.

In class code, I practiced skipping values, stopping a loop, and creating multiplication output using nested loops.

In practice code, I used nested loops to compare all students with present students. I created separate lists for present and absent students. I also used contains() to avoid duplicate values.

The most important lesson was:

A student is absent only after checking the full presentStudents list and finding no match.