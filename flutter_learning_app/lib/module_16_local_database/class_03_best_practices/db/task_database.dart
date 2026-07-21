import 'package:module_09_flutter_basics/module_16_local_database/class_03_best_practices/models/task_models.dart';
import 'package:sqflite/sqflite.dart';

import 'package:path/path.dart' as p;

class TaskDatabaseClass3 {
  static Database? _db;

  static Future<Database> getDB() async{
    if(_db != null) return _db!;

    _db = await openDatabase(
      p.join(await getDatabasesPath(), "task.db"),

      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE tasks(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, isDone INTEGER )"
        );
    },

    version: 2
   );

  return _db!;
  }


  static Future<void> insertTask(TaskModelClass3 taskModel )async {
    final db = await getDB();

    await db.insert("tasks", taskModel.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<List<TaskModelClass3>> getTask() async {
    final db = await getDB();

    final List<Map<String, dynamic>> maps = await db.query("tasks");

    return List.generate(maps.length, (i) => TaskModelClass3.fromMap(maps[i]));

  }

  // Deletes only the row whose id matches the selected task.
  // The ? placeholder receives its value safely from whereArgs.
  static Future<void>deleteTask(int id) async{
    final db =  await getDB();

    // where prevents every row from being deleted.
    db.delete("tasks", where: 'id = ?', whereArgs: [id]);
  }

  // Updates the saved title or completion status of one existing task.
  // The task id identifies which database row must be changed.
  static Future<void>updateTask(TaskModelClass3 task) async{
    final db =  await getDB();

    // toMap() provides the new values, while whereArgs selects the matching id.
    db.update("tasks", task.toMap(), where: "id = ?", whereArgs: [task.id]);
  }

}

