import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoye_app/models/task_data.dart';

class AddTaskScreen extends StatelessWidget {
  // AddTaskScreen(this.addTaskCallback);
  //
  // final Function addTaskCallback;

  @override
  Widget build(BuildContext context) {
    String newTaskTitle;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.lightBlueAccent,
                fontWeight: FontWeight.w500,
              ),
            ),
            TextField(
                autofocus: true,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(width: 5.0, color: Colors.lightBlueAccent),
                  ),
                ),
                onChanged: (value) {
                  newTaskTitle = value;
                }),
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: FlatButton(
                onPressed: () {
                  // addTaskCallback(newTaskTitle);
                  if (newTaskTitle != null) {
                    Provider.of<TaskData>(context, listen: false)
                        .addTask(newTaskTitle);
                  }
                  Navigator.pop(context);
                },
                child: Text(
                  'Add',
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
                height: 50.0,
                color: Colors.lightBlueAccent,
              ),
            )
          ],
        ),
      ),
    );
  }
}
