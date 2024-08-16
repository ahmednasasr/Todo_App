import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/main_provider.dart';

class addtaskwidget extends StatelessWidget {

  const addtaskwidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<mainprovider>(
      builder: (context, provider, child) {
        return  Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                Text("Add New Task"),
                TextField(
                  controller: provider.titleController,
                  decoration: InputDecoration(
                      hintText: "Title "
                  ),
                ),
                SizedBox(height: 20,),
                TextField(
                  controller: provider.desController,
                  decoration: InputDecoration(
                      hintText: "desc "
                  ),
                ),
                SizedBox(height: 20,),
                Text("Selected date",style: TextStyle(color: Colors.black),),
                InkWell(
                  onTap: (){
                    showDatePicker(context: context, firstDate: DateTime.now(), lastDate: DateTime.now().add(Duration(days: 365))).then((onValue){
                      provider.setdatepicker(onValue!);
                    });
                  },
                  child: Text(style: TextStyle(color: Colors.black),provider.selectedatepicker.toString().substring(0,10)),
                ),
                ElevatedButton(onPressed: (){
                  provider.addTask();
                  Navigator.pop(context);
                }, child: Text("Add Task"))
              ],
            ),
        );
      },
    );
  }
}
