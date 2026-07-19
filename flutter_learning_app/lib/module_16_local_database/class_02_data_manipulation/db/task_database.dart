import 'package:module_09_flutter_basics/module_16_local_database/class_02_data_manipulation/models/task_models.dart';

// sqflite provides SQLite database classes and operations
// such as openDatabase(), insert(), and query().
import 'package:sqflite/sqflite.dart';

// The path package safely joins folder and file names.
// "as p" creates a short alias, so we can write p.join().
import 'package:path/path.dart' as p;

// This helper class keeps all database-related work in one place.
// The UI can call simple methods such as insertTask() and getTask()
// without writing SQL or database-opening code inside widgets.
class TaskDatabase {
  // Stores the opened database connection.
  // It starts as null because the database is not open yet.
  // static makes one shared database reference available to the whole class.
  static Database? _db;

  // Returns the opened database.
  // Database work uses storage, so it is asynchronous and returns Future<Database>.
  static Future<Database> getDB() async{
    // If the database was opened before, return the same connection.
    // This avoids opening the database again for every operation.
    // "!" tells Dart that _db is not null inside this condition.
    if(_db != null) return _db!;

    // openDatabase() opens an existing database file
    // or creates it when the file does not exist.
    _db = await openDatabase(
      // getDatabasesPath() gives the correct database folder for the device.
      // p.join() safely creates the full path to task.db.
      p.join(await getDatabasesPath(), "task.db"),

      // onCreate runs only when this database is created for the first time.
      // It receives the database connection and the current version number.
      onCreate: (db, version) {
        // db.execute() runs a raw SQL command.
        // This command creates the tasks table.
        return db.execute(
          // id: unique number for each row.
          // PRIMARY KEY: uniquely identifies a task.
          // AUTOINCREMENT: SQLite creates the next ID automatically.
          // title TEXT: stores the task title.
          // isDone INTEGER: stores false/true as 0/1.
          "CREATE TABLE tasks(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, isDone INTEGER )"
        );
    },

    // The database version is used when the table structure changes later.
    // A future migration can compare the old and new versions.
    // This code currently has no onUpgrade callback.
    version: 2
   );

  // Returns the database after it has been opened or created.
  return _db!;
  }


  // Inserts one TaskModel into the tasks table.
  static Future<void> insertTask(TaskModel taskModel )async {
    // Makes sure the database is open before inserting.
    final db = await getDB();

    // taskModel.toMap() converts the Dart object into database-ready Map data.
    // conflictAlgorithm.replace means an existing conflicting row is replaced.
    await db.insert("tasks", taskModel.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  // Reads all rows from the tasks table
  // and returns them as a List<TaskModel>.
  static Future<List<TaskModel>> getTask() async {
    // Makes sure the database is open before reading.
    final db = await getDB();

    // db.query("tasks") performs a SELECT query on the tasks table.
    // Each database row is returned as one Map<String, dynamic>.
    final List<Map<String, dynamic>> maps = await db.query("tasks");

    // List.generate creates one TaskModel for every returned Map.
    // maps[i] selects one database row.
    // TaskModel.formMap() converts that row into a TaskModel object.
    return List.generate(maps.length, (i) => TaskModel.formMap(maps[i]));

  }

}
