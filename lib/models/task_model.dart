class TaskModel {
  String id;
  String title;
  String desc;
  int time;
  bool isDone;
  TaskModel({
    this.id = "",
    required this.title,
    required this.desc,
    required this.time,
    required this.isDone,
  });

  factory TaskModel.fromjson(Map<String,dynamic> json){
    return TaskModel(
      id: json['id'],
        title: json["title"],
        desc: json["desc"],
        time: json["time"],
        isDone: json["isdone"]);
  }

  Map<String,dynamic>tojson(){
    return {
      "id":id,
      "title":title,
      "desc":desc,
      "time":time,
      "isdone":isDone
    };
    }
}
