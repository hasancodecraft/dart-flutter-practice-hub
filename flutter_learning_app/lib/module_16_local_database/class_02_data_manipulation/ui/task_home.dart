import 'package:flutter/material.dart';

// Imports the database helper so this page can insert and read tasks.
import 'package:module_09_flutter_basics/module_16_local_database/class_02_data_manipulation/db/task_database.dart';

// Imports TaskModel so database rows can be used as task objects in the UI.
import 'package:module_09_flutter_basics/module_16_local_database/class_02_data_manipulation/models/task_models.dart';

class HomeTask extends StatefulWidget {
  const HomeTask({super.key});

  @override
  State<HomeTask> createState() => _HomeTaskState();
}

class _HomeTaskState extends State<HomeTask> {
  // Stores the task objects loaded from the local database.
  // The ListView uses this list to display all saved tasks.
  List<TaskModel> tasks = [];

  // Controls the TextFormField.
  // It lets the app read the entered text and clear the field after insertion.
  TextEditingController taskController = TextEditingController();

  @override
  void initState(){
    super.initState();

    // initState runs once when this State object is created.
    // refreshTask() loads existing database tasks when the page first opens.
    refreshTask();
  }

  // Reads the latest tasks from SQLite and refreshes the visible list.
  // Future<void> is used because database reading is asynchronous.
  Future<void> refreshTask() async{
    // await pauses this function until getTask() returns all saved tasks.
    tasks=  await TaskDatabase.getTask();

    // setState notifies Flutter that the data has changed.
    // Flutter then rebuilds this page, so ListView shows the updated tasks.
    // The assignment is above setState, but this empty setState still triggers the rebuild.
    setState(() {
    });

  }

  // Creates a new TaskModel, saves it in SQLite,
  // reloads the list, and clears the input field.
  Future<void> addTask() async{
    // taskController.text reads the current TextFormField value.
    // A new task starts as incomplete, so isDoine is false.
    await TaskDatabase.insertTask(TaskModel(title: taskController.text, isDoine: false));

    // Reads the database again after insertion.
    // This makes the newly saved task appear in the ListView.
    await refreshTask();

    // Removes the old text from the input field after saving.
    taskController.clear();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Task with DB"),
        backgroundColor: Colors.deepOrange,
      ),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [

                // Inside this Row, Expanded gives the TextFormField
                // all remaining horizontal space beside the add button.
                Expanded(
                  child: TextFormField(
                    // Connects the field with taskController
                    // so the app can read and clear its text.
                    controller: taskController,
                    decoration: InputDecoration(
                      hintText: "Enter Task",
                      border: OutlineInputBorder(),
                    ) ,

                  ),
                ),

                IconButton(
                  onPressed: (){
                    // Starts the asynchronous insert-and-refresh flow.
                    addTask();
                  }, 
                  icon: Icon(Icons.add))

              ],

            ),
          ),

          // Inside the outer Column, Expanded gives the ListView
          // the remaining vertical space below the input Row.
          // It prevents the scrollable ListView from receiving unlimited height.
          Expanded(
            child: ListView.builder(
              // The builder creates exactly one item for each loaded task.
              itemCount: tasks.length,
              itemBuilder: (context, index){
                // Gets the current TaskModel once,
                // so the code below can use task.title and task.isDoine clearly.
                final task = tasks[index];

                return Card(
                  child: ListTile(
                    leading: Checkbox(
                      // Shows the saved completion state of this task.
                      value: task.isDoine,

                      // "_" means the callback value is currently unused.
                      // This callback does not update the database yet,
                      // so the checkbox is not functional in the current code.
                      onChanged: (_) =>{}),

                    // Displays the title from the current TaskModel.
                    title: Text(task.title),

                    // The trailing area contains both edit and delete buttons.
                    trailing: Row(
                      // min keeps this Row only as wide as its buttons.
                      // Without it, the Row may try to take the full available width.
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // The edit callback is empty, so it currently shows only the icon.
                        IconButton(onPressed: (){}, icon: Icon(Icons.edit), color: Colors.orange,),

                        // The delete callback is empty, so it currently shows only the icon.
                        IconButton(onPressed: (){}, icon: Icon(Icons.delete), color: Colors.red,)
                      ],
                    ),
                  ),
                );
              }
              ),
          )
        ],

      ),
    );
  }
}
