import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/main_provider.dart';
import '../../models/task_model.dart';

class EditScreen extends StatelessWidget {
  static const String routename = "editScreen";
  final TaskModel task;

  const EditScreen({super.key, required this.task});


  @override
  Widget build(BuildContext context) {
    return Consumer<mainprovider>(
      builder: (context, provider, child) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: Theme.of(context).primaryColor,
            body: SingleChildScrollView(
              child: Stack(
                children: [
                  Container(
                    height: 180,
                    width: double.infinity,
                    color: Colors.blue,
                  ),
                  Column(
                    children: [
                      Padding(
                        padding:
                        const EdgeInsets.only(top: 50, left: 20, right: 20),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Edit".tr(),
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color:
                                  Theme.of(context).textTheme.bodyMedium?.color,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Container(
                            width: 400,
                            height: 700,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24),
                              ),
                              elevation: 24,
                              margin: EdgeInsets.symmetric(
                                  vertical: 64, horizontal: 24),
                              child: Padding(
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    Text(
                                      "Edit Task",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.color,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    TextField(
                                      controller: provider.titleController,
                                      decoration: InputDecoration(
                                          hintText: "This is title",
                                          hintStyle: TextStyle(
                                            color: Theme.of(context).textTheme.bodyMedium?.color,
                                          )),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    TextField(
                                      controller: provider.desController,
                                      decoration: InputDecoration(
                                          hintText: "Task details",
                                          hintStyle: TextStyle(
                                            color: Theme.of(context).textTheme.bodyMedium?.color,
                                          )),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      "Select time",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Theme.of(context).textTheme.bodyMedium?.color,
                                      ),
                                    ),
                                    SizedBox(height: 10,),
                                    InkWell(
                                      onTap: (){
                                        showTimePicker(
                                                context: context,
                                                initialTime: provider.time)
                                            .then(
                                          (value) {
                                            provider.setTime(value!);
                                          },
                                        );
                                      },
                                      child: Text(
                                          "${provider.time.hour}:${provider.time.minute}",
                                          style: TextStyle(
                                            color: Theme.of(context).textTheme.bodyMedium?.color,
                                          )
                                      ),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        provider.updateTask(task);
                                        Navigator.pop(context);
                                      },
                                      child: Text("Save Changes"),
                                    )

                                  ],
                                ),
                              ),
                            ),
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
