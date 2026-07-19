// TaskModel represents one task inside the app.
// One TaskModel object matches one row from the SQLite "tasks" table.
class TaskModel {
  // The database gives every saved task a unique ID.
  // int? is used because a new task does not have an ID before SQLite inserts it.
  // After insertion, AUTOINCREMENT creates the ID automatically.
  final int ? id;

  // The visible task text.
  final String title;

  // Stores the task completion state inside Dart as true or false.
  final bool isDoine;

  // "required" makes sure title and isDoine are provided
  // whenever a TaskModel object is created.
  // id is optional because SQLite can generate it.
  TaskModel({this.id, required this.title, required this.isDoine});

  // Converts a TaskModel object into a Map.
  // sqflite uses a Map where each key matches a database column name.
  //
  // Flow:
  // TaskModel object -> Map -> SQLite table
  Map<String, dynamic> toMap(){
    return{
      // The keys "id", "title", and "isDone"
      // must match the column names in the tasks table.
      "id": id,
      "title": title,

      // SQLite stores this boolean value as an integer.
      // true becomes 1 and false becomes 0.
      "isDone": isDoine ? 1 : 0,

    };
  }

  // A factory constructor can return a new TaskModel object
  // after converting one database row from Map format.
  //
  // sqflite returns queried rows as Maps:
  // Database Map -> TaskModel object
  //
  // This conversion lets the UI use task.title and task.isDoine
  // instead of working directly with map keys everywhere.
  factory TaskModel.formMap(Map<String, dynamic>map){
    return TaskModel(
      // Reads each value using the matching database column key.
      id: map["id"],
      title: map["title"],

      // SQLite returns 0 or 1.
      // The comparison converts it back into a Dart bool.
      // 1 -> true, anything else -> false.
      isDoine: map["isDone"] == 1
      );
  }
}
