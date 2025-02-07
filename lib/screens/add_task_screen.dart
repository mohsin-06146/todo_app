import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/task_data.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String newTaskTitle = '';
    return Container(
      padding: EdgeInsets.symmetric(vertical: 40),
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20)
          )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                color: Colors.lightBlueAccent
              ),
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (value){
                newTaskTitle = value;
              },
            ),
            SizedBox(
              height: 20,
            ),
            TextButton(
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.lightBlueAccent)
              ),
              onPressed: (){
                context.read<TaskData>().addTask(newTaskTitle);
                // Provider.of<TaskData>(context).addTask(newTaskTitle);
                Navigator.pop(context);
                },
              child: Text(
                'Add',
                style: TextStyle(
                  color: Colors.white
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}
