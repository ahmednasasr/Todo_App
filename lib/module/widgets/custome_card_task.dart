import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/main_provider.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/module/screens/edit_screen.dart';

class custome_card_task extends StatelessWidget {
   custome_card_task({super.key,required this.task});
   TaskModel task;

  @override
  Widget build(BuildContext context) {
    return Consumer<mainprovider>(
      builder: (context, provider, child) {
        return  Padding(
          padding: EdgeInsets.all(8.0),
          child: Slidable(
            key: ValueKey("test"),
            startActionPane: ActionPane(
                dismissible: DismissiblePane(onDismissed: () {
                  provider.deleteTask(task.id);
                }),
                motion: ScrollMotion(),
                children: [
                  SlidableAction(
                    onPressed: (context){
                      provider.deleteTask(task.id);
                    },
                    backgroundColor: Colors.red,
                    borderRadius: BorderRadius.circular(20),
                    icon: Icons.delete,
                    label: "Delete",
                  ),
                  SlidableAction(
                    onPressed: (context){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditScreen(task: task),
                        ),
                      );
                      },
                    backgroundColor: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    icon: Icons.edit,
                    label: "Edit",
                  ),
                ]),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Container(
                height: 120,
                width: 400,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      SizedBox(width: 10,),
                      Container(
                        width: 5,
                        height: 60,
                        color: Colors.blue,
                      ),
                      SizedBox(width: 10,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            task.title
                            ,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: task.isDone?Colors.green:Colors.blue),),
                          Text(task.desc,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: task.isDone?Colors.green:Colors.blue),),
                          SizedBox(height: 5,),
                          Row(
                            children: [
                              Icon(Icons.av_timer),
                              Text(task.time,style: TextStyle(color: Colors.black),),
                            ],
                          )
                        ],
                      ),
                      Spacer(),
                      InkWell(
                        onTap: (){
                          provider.Isdone(task);
                        },
                        child:
                        task.isDone? Text("Done..!",style: TextStyle(fontSize:30,color: Colors.green),)
                            : Container(
                          color: Colors.blue,
                          width: 50,
                          height: 30,
                          child:Icon(Icons.check,color: Colors.white,),
                        )
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
