class TaskModel {
  String id;
  String title;
  String desc;
  int date;
  String time;
  bool isDone;
  TaskModel({
    this.id = "",
    required this.title,
    required this.time,
    required this.desc,
    required this.date,
    required this.isDone,
  });

  factory TaskModel.fromjson(Map<String,dynamic> json){
    return TaskModel(
      id: json['id'],
        title: json["title"],
        desc: json["desc"],
        date: json["date"],
        time: json["time"],
        isDone: json["isdone"]);
  }

  Map<String,dynamic>tojson(){
    return {
      "id":id,
      "title":title,
      "desc":desc,
      "date":date,
      "isdone":isDone,
      "time":time
    };
    }
}
