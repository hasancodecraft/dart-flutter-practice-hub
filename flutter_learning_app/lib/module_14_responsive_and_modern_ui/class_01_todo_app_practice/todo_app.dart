import 'package:flutter/material.dart';

class TodoApp extends StatefulWidget {
  const TodoApp({super.key});

  @override
  State<TodoApp> createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  // Controls the TextField text.
  // We use this to read the typed task and clear the input field.
  TextEditingController taskController = TextEditingController();

  // Stores all task texts.
  List<String> task = [];

  // Stores checkbox status for each task.
  // false = unchecked, true = checked.
  List<bool> isDone  = [];

  void addTask(){
    setState(() {
      // Checks that the TextField is not empty before adding the task.
      if(taskController.text.isNotEmpty ){
         task.add(taskController.text); // Adds typed text to the task list.
         isDone.add(false); // New task starts as unchecked.
         taskController.clear(); // Clears the TextField after adding.
      }
    });
  }
  
  void deleteTask(int index){
    setState(() {
      task.removeAt(index); // Removes the task from the task list.
      isDone.removeAt(index); // Removes the checkbox status of the same task.
    });
  }

  @override
  void dispose() {
    taskController.dispose(); // Cleans the controller from memory when this page is removed.
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TodoApp app"),
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: [
          SizedBox(height: 20,),

          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: taskController, // Connects TextField with taskController.
                  decoration: InputDecoration(
                    hintText: "Add Task",
                    border: OutlineInputBorder()
                  ),
                ),
              ),

              SizedBox(width: 10,),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white
                ),
                onPressed: (){
                  addTask(); // Adds the typed task when button is pressed.
                }, 
                child: Text("Add"),
              )
            ],
          ),

          Expanded(
            child: ListView.builder(
              itemCount: task.length, // Shows list items according to total task count.
              itemBuilder: (context, index){
                return Card(
                  child: ListTile(
                    title: Text(task[index]), // Shows the task text for this index.

                    leading: Checkbox(
                      value: isDone[index], // Shows checked/unchecked status for this task.
                      onChanged: (value) { 
                        setState(() { 
                          isDone[index] = value!; // Updates checkbox status when clicked.
                        });
                      },
                    ),

                    trailing: IconButton(
                      onPressed: (){
                        deleteTask(index); // Deletes the task of this index.
                      },
                      icon: Icon(Icons.delete),
                      color: Colors.red,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}