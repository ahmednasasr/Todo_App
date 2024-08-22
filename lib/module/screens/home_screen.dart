import 'package:flutter/material.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/main_provider.dart';
import 'package:todo_app/models/task_model.dart';

import '../widgets/custome_card_task.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<mainprovider>(
      builder: (context, provider, child) {
        return Scaffold(
          body: Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: 180,
                    width: double.infinity,
                    color: Colors.blue,
                  ),
                  Positioned(
                    top: 50,
                    left: 50,
                    child: Text(
                      "To Do List",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).textTheme.bodyMedium?.color,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 80,
                    left: 0,
                    right: 0,
                    child: EasyDateTimeLine(
                      initialDate: DateTime.now(),
                      onDateChange: (selectedDate) {
                        provider.setdatepicker(selectedDate);
                      },
                      dayProps: const EasyDayProps(
                        todayHighlightColor: Colors.blue,
                        inactiveDayStyle: DayStyle(
                            decoration: BoxDecoration(
                                color: Colors.white
                            )
                        ),
                        activeDayStyle: DayStyle(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.blue,
                                Colors.white,
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 80,),
              FutureBuilder(
                future: provider.getTasks() , builder: (context, snapshot) {
                if(snapshot.connectionState==ConnectionState.waiting){
                  return const Center(child: CircularProgressIndicator(),);
                }else if(snapshot.hasError){
                   return Text("has Error");
                }else{
                  List<TaskModel> tasks =snapshot.data!.docs.map((e)=> e.data()).toList();
                  return Expanded(
                    child: ListView.builder(
                      itemCount: tasks.length,
                      itemBuilder: (context, index) {
                      return custome_card_task(task: tasks[index],);
                    },
                    ),
                  );
                }
              },
              )

            ],
          ),
        );
      },
    );
  }
}

