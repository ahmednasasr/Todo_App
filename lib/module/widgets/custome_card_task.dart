import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class custome_card_task extends StatelessWidget {
  const custome_card_task({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Slidable(
        key: ValueKey("test"),
        startActionPane: ActionPane(
            dismissible: DismissiblePane(onDismissed: () {}),
            motion: ScrollMotion(),
            children: [
              SlidableAction(
                onPressed: (context){},
                backgroundColor: Colors.red,
                borderRadius: BorderRadius.circular(20),
                icon: Icons.delete,
                label: "Delete",
              ),
              SlidableAction(
                onPressed: (context){},
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
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Play Basket ball",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.blue),),
                      Row(
                        children: [
                          Icon(Icons.av_timer),
                          Text("10:30 am",style: TextStyle(color: Colors.black),),
                        ],
                      )
                    ],
                  ),
                  Spacer(),
                  Container(
                    color: Colors.blue,
                    width: 50,
                    height: 30,
                    child: Icon(Icons.check,color: Colors.white,),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
