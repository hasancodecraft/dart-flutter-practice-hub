# Module 16: Local Database

## Class 2: SQLite Data Manipulation — Code Flow Notes

This note explains how the Class 2 code works from the app screen to the SQLite database and back to the UI.

---

## 1. Project Structure

```text
class_02_data_manipulation/
├── db/
│   └── task_database.dart
├── models/
│   └── task_models.dart
└── ui/
    └── task_home.dart
```

| Folder | Work |
|---|---|
| `ui` | Shows the screen and receives user input |
| `models` | Defines the structure of one task |
| `db` | Opens SQLite and performs database operations |

```text
UI
↓
Model
↓
Database
```

---

## 2. Full App Flow

When the app starts:

```text
MaterialApp starts
    ↓
initialRoute opens "/homeTask"
    ↓
Flutter creates HomeTask
    ↓
initState() runs
    ↓
refreshTask() reads saved tasks
    ↓
TaskDatabase.getTask() queries SQLite
    ↓
Database Maps become TaskModel objects
    ↓
tasks list receives the objects
    ↓
setState() rebuilds the page
    ↓
ListView displays the tasks
```

When the user adds a task:

```text
User enters text
    ↓
User presses the + button
    ↓
addTask() runs
    ↓
TaskModel object is created
    ↓
toMap() converts it into a Map
    ↓
insertTask() saves the Map in SQLite
    ↓
refreshTask() reads all tasks again
    ↓
setState() rebuilds the page
    ↓
The new task appears in ListView
```

---

## 3. App Route Flow

Inside `app.dart`:

```dart
initialRoute: '/homeTask',
```

This tells Flutter which page should open first.

The route is registered here:

```dart
"/homeTask": (context) => HomeTask(),
```

Flow:

```text
MaterialApp
    ↓
"/homeTask"
    ↓
HomeTask()
```

---

## 4. TaskModel

File:

```text
models/task_models.dart
```

`TaskModel` represents one task.

```dart
TaskModel(
  id: 1,
  title: "Learn SQLite",
  isDoine: false,
)
```

It contains:

```dart
final int? id;
final String title;
final bool isDoine;
```

### `id`

```dart
final int? id;
```

The ID identifies one database row.

It is nullable because a new task has no ID before SQLite inserts it. SQLite creates the ID automatically using `AUTOINCREMENT`.

### `title`

```dart
final String title;
```

Stores the visible task text.

### `isDoine`

```dart
final bool isDoine;
```

Stores task completion status in Dart.

```text
false → incomplete
true  → complete
```

---

## 5. Why `toMap()` Is Used

SQLite cannot directly store a custom Dart object like `TaskModel`.

So the object is converted into a Map:

```dart
Map<String, dynamic> toMap(){
  return{
    "id": id,
    "title": title,
    "isDone": isDoine ? 1 : 0,
  };
}
```

Flow:

```text
TaskModel object
    ↓
toMap()
    ↓
Map<String, dynamic>
    ↓
SQLite
```

Example:

```dart
TaskModel(
  title: "Learn SQLite",
  isDoine: false,
)
```

becomes:

```dart
{
  "id": null,
  "title": "Learn SQLite",
  "isDone": 0,
}
```

The Map keys must match the table column names:

```text
id
title
isDone
```

---

## 6. Boolean Conversion

Dart uses:

```text
true
false
```

SQLite stores this value as:

```text
1
0
```

This line converts Dart `bool` to SQLite `int`:

```dart
"isDone": isDoine ? 1 : 0,
```

```text
true  → 1
false → 0
```

---

## 7. Why `formMap()` Is Used

SQLite returns each row as a Map.

The app converts that Map back into a `TaskModel`:

```dart
factory TaskModel.formMap(Map<String, dynamic> map){
  return TaskModel(
    id: map["id"],
    title: map["title"],
    isDoine: map["isDone"] == 1,
  );
}
```

Flow:

```text
SQLite row
    ↓
Map<String, dynamic>
    ↓
formMap()
    ↓
TaskModel object
```

Example database Map:

```dart
{
  "id": 1,
  "title": "Learn SQLite",
  "isDone": 0,
}
```

After conversion:

```dart
TaskModel(
  id: 1,
  title: "Learn SQLite",
  isDoine: false,
)
```

This line converts SQLite integer back to Dart boolean:

```dart
isDoine: map["isDone"] == 1
```

```text
1 → true
0 → false
```

---

## 8. Why a Factory Constructor Is Used

```dart
factory TaskModel.formMap(...)
```

The factory constructor receives external data and returns a new `TaskModel`.

Here, the external data is one database Map.

```text
Database Map
    ↓
Read id, title, isDone
    ↓
Create TaskModel
    ↓
Return TaskModel
```

---

## 9. TaskDatabase Helper Class

File:

```text
db/task_database.dart
```

This class keeps all SQLite work in one place.

The UI only calls:

```dart
TaskDatabase.insertTask(...)
TaskDatabase.getTask()
```

The UI does not need to know:

- How the database opens
- Where the database file is stored
- How the table is created
- How rows are inserted
- How rows are queried

---

## 10. Why `static Database? _db` Is Used

```dart
static Database? _db;
```

This variable stores the opened database connection.

At first:

```text
_db = null
```

After the database opens:

```text
_db = task.db connection
```

`static` keeps one shared database connection for the class.

This prevents the app from opening the same database again for every operation.

---

## 11. Database Opening Flow

```dart
static Future<Database> getDB() async{
  if(_db != null) return _db!;

  _db = await openDatabase(...);

  return _db!;
}
```

Flow:

```text
getDB() is called
    ↓
Is _db already available?
    ↓
Yes → return the existing database
No  → open or create task.db
    ↓
Save the connection in _db
    ↓
Return it
```

This line:

```dart
if(_db != null) return _db!;
```

means:

```text
If the database is already open,
return it instead of opening it again.
```

The `!` tells Dart that `_db` is not null there.

---

## 12. Database File Path

```dart
p.join(await getDatabasesPath(), "task.db")
```

### `getDatabasesPath()`

Gets the correct database folder for the device.

### `p.join()`

Combines the folder path and database file name safely.

```text
Database folder
    +
task.db
    ↓
Full database path
```

The path package is imported with an alias:

```dart
import 'package:path/path.dart' as p;
```

So the code can use:

```dart
p.join(...)
```

---

## 13. Creating the Table

```dart
onCreate: (db, version) {
  return db.execute(
    "CREATE TABLE tasks(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, isDone INTEGER )"
  );
},
```

`onCreate` runs only when the database is created for the first time.

| Column | Type | Work |
|---|---|---|
| `id` | INTEGER | Unique task ID |
| `title` | TEXT | Task title |
| `isDone` | INTEGER | Stores 0 or 1 |

### `PRIMARY KEY`

Makes each ID unique.

### `AUTOINCREMENT`

Creates the next ID automatically.

```text
1
2
3
4
```

---

## 14. Database Version

```dart
version: 2
```

The version helps when the database structure changes later.

Example:

```text
Version 1 → id, title
Version 2 → id, title, isDone
```

A future upgrade usually needs `onUpgrade`.

Changing only the version does not automatically change an old table.

---

## 15. Insert Task Flow

```dart
static Future<void> insertTask(TaskModel taskModel) async {
  final db = await getDB();

  await db.insert(
    "tasks",
    taskModel.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}
```

Flow:

```text
insertTask() receives TaskModel
    ↓
getDB() returns the database
    ↓
toMap() converts the object into a Map
    ↓
db.insert() saves the Map in the tasks table
```

### `ConflictAlgorithm.replace`

If the inserted row conflicts with an existing unique or primary-key value, SQLite replaces the old row.

---

## 16. Get Task Flow

```dart
static Future<List<TaskModel>> getTask() async {
  final db = await getDB();

  final List<Map<String, dynamic>> maps =
      await db.query("tasks");

  return List.generate(
    maps.length,
    (i) => TaskModel.formMap(maps[i]),
  );
}
```

Flow:

```text
getTask() runs
    ↓
getDB() returns the database
    ↓
db.query("tasks") reads all rows
    ↓
SQLite returns List<Map<String, dynamic>>
    ↓
List.generate() visits every Map
    ↓
formMap() converts each Map into TaskModel
    ↓
Returns List<TaskModel>
```

Example database result:

```dart
[
  {
    "id": 1,
    "title": "Learn SQLite",
    "isDone": 0,
  },
  {
    "id": 2,
    "title": "Build Todo App",
    "isDone": 1,
  },
]
```

After conversion:

```dart
[
  TaskModel(
    id: 1,
    title: "Learn SQLite",
    isDoine: false,
  ),
  TaskModel(
    id: 2,
    title: "Build Todo App",
    isDoine: true,
  ),
]
```

---

## 17. Why `List.generate()` Is Used

```dart
List.generate(
  maps.length,
  (i) => TaskModel.formMap(maps[i]),
)
```

If SQLite returns 5 Maps, it runs 5 times.

```text
maps[0] → TaskModel
maps[1] → TaskModel
maps[2] → TaskModel
maps[3] → TaskModel
maps[4] → TaskModel
```

The final result is:

```text
List<TaskModel>
```

---

## 18. HomeTask State

File:

```text
ui/task_home.dart
```

The screen uses `StatefulWidget` because the visible list changes.

```dart
List<TaskModel> tasks = [];
```

This list stores the tasks currently shown by the UI.

At first:

```text
tasks = []
```

After database reading:

```text
tasks = [TaskModel, TaskModel, ...]
```

---

## 19. Page Opening Flow

```dart
@override
void initState(){
  super.initState();
  refreshTask();
}
```

`initState()` runs once when the page is created.

It calls `refreshTask()` so saved tasks appear immediately.

```text
HomeTask opens
    ↓
initState() runs
    ↓
refreshTask() runs
    ↓
Saved tasks are loaded
    ↓
UI displays them
```

---

## 20. Refresh Task Flow

```dart
Future<void> refreshTask() async{
  tasks = await TaskDatabase.getTask();

  setState(() {
  });
}
```

Flow:

```text
refreshTask() starts
    ↓
getTask() reads SQLite
    ↓
Returns List<TaskModel>
    ↓
tasks receives the latest list
    ↓
setState() rebuilds the page
    ↓
ListView displays the latest tasks
```

### Why `setState()` Is Used

Changing `tasks` alone does not redraw the UI.

`setState()` tells Flutter:

```text
The data changed.
Rebuild this widget.
```

Flutter then runs `build()` again.

---

## 21. Add Task Flow

```dart
Future<void> addTask() async{
  await TaskDatabase.insertTask(
    TaskModel(
      title: taskController.text,
      isDoine: false,
    ),
  );

  await refreshTask();

  taskController.clear();
}
```

Flow:

```text
Read TextFormField text
    ↓
Create TaskModel
    ↓
Save it in SQLite
    ↓
Read all tasks again
    ↓
Update tasks list
    ↓
Rebuild UI
    ↓
Clear TextFormField
```

---

## 22. Add Button Flow

```dart
IconButton(
  onPressed: (){
    addTask();
  },
  icon: Icon(Icons.add),
)
```

```text
User presses +
    ↓
onPressed runs
    ↓
addTask() runs
    ↓
Task is saved
    ↓
List is refreshed
```

---

## 23. TextEditingController

```dart
TextEditingController taskController =
    TextEditingController();
```

The controller is connected to the field:

```dart
controller: taskController,
```

It is used to:

```dart
taskController.text
```

Read the entered value.

```dart
taskController.clear()
```

Clear the field after saving.

---

## 24. ListView Flow

```dart
ListView.builder(
  itemCount: tasks.length,
  itemBuilder: (context, index){
    final task = tasks[index];
  },
)
```

### `itemCount`

```dart
itemCount: tasks.length
```

Controls how many list items are created.

### `index`

Selects one task at a time:

```dart
final task = tasks[index];
```

Then:

```dart
title: Text(task.title)
```

shows that task title.

---

## 25. Checkbox Flow

```dart
Checkbox(
  value: task.isDoine,
  onChanged: (_) => {},
)
```

The checkbox reads the saved value from:

```dart
task.isDoine
```

The callback is empty, so it does not update the database yet.

Current behavior:

```text
Checkbox state is displayed
Checkbox state is not changed
```

---

## 26. Edit and Delete Buttons

```dart
IconButton(
  onPressed: (){},
  icon: Icon(Icons.edit),
)
```

```dart
IconButton(
  onPressed: (){},
  icon: Icon(Icons.delete),
)
```

Their callbacks are empty.

```text
Add    → working
Read   → working
Update → not added yet
Delete → not added yet
```

---

## 27. Why `Expanded` Is Used Around TextFormField

The TextFormField and add button are inside a `Row`.

```dart
Expanded(
  child: TextFormField(...)
)
```

`Expanded` gives the TextFormField the remaining horizontal space.

```text
Row width
- Add button width
= TextFormField width
```

---

## 28. Why `Expanded` Is Used Around ListView

The ListView is inside a `Column`.

```dart
Expanded(
  child: ListView.builder(...)
)
```

A ListView needs limited height.

`Expanded` gives it the remaining space below the input Row.

Without this, Flutter may report an unbounded-height error.

---

## 29. Why `MainAxisSize.min` Is Used

```dart
trailing: Row(
  mainAxisSize: MainAxisSize.min,
)
```

It makes the trailing Row use only the width needed by the edit and delete buttons.

---

## 30. Why `async` and `await` Are Used

Database operations take time.

Examples:

- Opening the database
- Inserting data
- Reading data

So they return `Future`.

```dart
Future<void> addTask() async
```

`await` makes one step wait for the previous step.

```dart
await TaskDatabase.insertTask(...);
await refreshTask();
```

Correct order:

```text
First save the task
Then read the updated list
```

Without waiting, refresh could run before insertion finishes.

---

## 31. Complete Add Example

Suppose the user enters:

```text
Learn SQLite
```

Then presses `+`.

### Step 1: UI Reads the Text

```dart
taskController.text
```

returns:

```text
Learn SQLite
```

### Step 2: TaskModel Is Created

```dart
TaskModel(
  title: "Learn SQLite",
  isDoine: false,
)
```

### Step 3: `toMap()` Runs

```dart
{
  "id": null,
  "title": "Learn SQLite",
  "isDone": 0,
}
```

### Step 4: SQLite Saves the Row

```text
id = 1
title = Learn SQLite
isDone = 0
```

### Step 5: `getTask()` Reads the Row

```dart
{
  "id": 1,
  "title": "Learn SQLite",
  "isDone": 0,
}
```

### Step 6: `formMap()` Converts It

```dart
TaskModel(
  id: 1,
  title: "Learn SQLite",
  isDoine: false,
)
```

### Step 7: `tasks` List Is Updated

```dart
tasks = [
  TaskModel(
    id: 1,
    title: "Learn SQLite",
    isDoine: false,
  ),
];
```

### Step 8: `setState()` Rebuilds the UI

The ListView displays:

```text
☐ Learn SQLite
```

---

## 32. Important Key Matching Rule

These names must match exactly.

### SQLite Table

```text
id
title
isDone
```

### `toMap()`

```dart
"id"
"title"
"isDone"
```

### `formMap()`

```dart
map["id"]
map["title"]
map["isDone"]
```

A wrong key can return `null`.

Example:

```text
Table column → title
Map key      → taskTitle
```

---

## 33. Current Limitations

The current code still has these incomplete parts:

- Empty tasks can be inserted
- Checkbox does not update
- Edit button has no action
- Delete button has no action
- Controller `dispose()` is not added yet

These do not stop the current Add and Read flow.

---

## 34. Quick Revision

```text
TaskModel
→ Represents one task

toMap()
→ TaskModel object to database Map

formMap()
→ Database Map to TaskModel object

TaskDatabase
→ Controls SQLite work

getDB()
→ Opens or returns the database

insertTask()
→ Saves one task

getTask()
→ Reads all tasks

refreshTask()
→ Loads tasks and rebuilds UI

setState()
→ Tells Flutter to rebuild after data changes
```

---

## 35. One-Line Full Flow

```text
TextFormField
→ TaskModel
→ toMap()
→ insertTask()
→ SQLite
→ getTask()
→ formMap()
→ List<TaskModel>
→ setState()
→ ListView
```

---

## 36. Spelling Notes

Current names work because they are used consistently.

Clearer spellings would be:

```text
isDoine → isDone
formMap → fromMap
```

Renaming them requires changing every related file together.
