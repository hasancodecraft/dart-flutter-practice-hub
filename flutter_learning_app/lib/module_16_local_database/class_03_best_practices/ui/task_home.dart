import 'package:flutter/material.dart';

import 'package:module_09_flutter_basics/module_16_local_database/class_03_best_practices/db/task_database.dart';
import 'package:module_09_flutter_basics/module_16_local_database/class_03_best_practices/models/task_models.dart';

class HomeTaskClass3 extends StatefulWidget {
  const HomeTaskClass3({super.key});

  @override
  State<HomeTaskClass3> createState() => _HomeTaskClass3State();
}

class _HomeTaskClass3State extends State<HomeTaskClass3> {
  List<TaskModelClass3> tasks = [];
  

  TextEditingController taskController = TextEditingController();

  @override
  void initState(){
    super.initState();

    refreshTask();
  }

  Future<void> refreshTask() async{
    tasks=  await TaskDatabaseClass3.getTask();

    setState(() {
    });

  }

  Future<void> addTask() async{
    await TaskDatabaseClass3.insertTask(TaskModelClass3(title: taskController.text, isDone: false));

    await refreshTask();

    taskController.clear();
  }

  // Deletes the selected task by its database id, then reloads the list.
  Future<void> deleteTask(int id) async{
    await TaskDatabaseClass3.deleteTask(id);

    await refreshTask();

    taskController.clear();
  }
  // Creates an updated copy of the selected task with the opposite status.
  // The same id is kept so updateTask() changes the existing row.
  Future<void> toggleTaskStatus(TaskModelClass3 task) async{
    await TaskDatabaseClass3.updateTask(
      // ! changes false to true and true to false.
      TaskModelClass3(title: task.title, isDone: !task.isDone, id: task.id)
    );
    await refreshTask();

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

                Expanded(
                  child: TextFormField(
                    controller: taskController,
                    decoration: InputDecoration(
                      hintText: "Enter Task",
                      border: OutlineInputBorder(),
                    ) ,

                  ),
                ),

                IconButton(
                  onPressed: (){
                    addTask();
                  }, 
                  icon: Icon(Icons.add))

              ],

            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index){
                final task = tasks[index];

                return Card(
                  child: ListTile(
                    leading: Checkbox(
                      // The checkbox displays the status saved in this task object.
                      value: task.isDone,

                      onChanged: (_) =>{
                        // Tapping the checkbox updates the status in SQLite.
                        toggleTaskStatus(task)
                      }),

                    title: Text(task.title, style: TextStyle(
                      // Completed tasks use grey text.
                      color: task.isDone ? Colors.grey : Colors.black,
                      // A completed task gets a line through its title.
                      decoration: task.isDone? TextDecoration.lineThrough : null
                    ),),

                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(onPressed: (){}, icon: Icon(Icons.edit), color: Colors.orange,),

                        IconButton(onPressed: (){
                          // The database supplies the id after insertion, so ! uses it as non-null.
                          deleteTask(task.id!);
                        }, icon: Icon(Icons.delete), color: Colors.red,)
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
