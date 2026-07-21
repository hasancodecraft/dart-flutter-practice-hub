class TaskModelClass3 {
  final int ? id;

  final String title;

  final bool isDone;

  TaskModelClass3({this.id, required this.title, required this.isDone});

  Map<String, dynamic> toMap(){
    return{
      "id": id,
      "title": title,

      "isDone": isDone ? 1 : 0,

    };
  }

  factory TaskModelClass3.fromMap(Map<String, dynamic>map){
    return TaskModelClass3(
      id: map["id"],
      title: map["title"],

      isDone: map["isDone"] == 1
      );
  }
}
