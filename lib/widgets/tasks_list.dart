import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:todo_app/models/task_data.dart';
import 'package:todo_app/widgets/task_tile.dart';
import 'package:todo_app/models/task.dart';

class TasksList extends StatelessWidget {
  const TasksList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
        builder: (context, taskData, child){
          return ListView.builder(
              itemBuilder: (context, index){
                final task = taskData.tasks[index];
                return TaskTile(
                    isChecked: task.isDone,
                    taskTitle: task.name,
                    checkboxCallback: (checkBoxState){
                      taskData.updateTask(task);
                    },
                    longPressCallback: (){
                      _onAlertButtonPressed(context,taskData, task);
                    },
                );
              },
            itemCount: taskData.taskCount,
          );
        }
    );
  }
  _onAlertButtonPressed(context,TaskData taskData, Task task) {
    Alert(
      context: context,
      type: AlertType.warning,
      title: 'Delete',
      desc: 'Are you sure you want to delete todo',
      buttons: [
        DialogButton(
          child: Text('No'),
          onPressed: (){
            Navigator.pop(context);
          },
          width: 70,
        ),
        DialogButton(
          child: Text('Yes'),
          onPressed: (){
              taskData.deleteTask(task);
              Navigator.pop(context);
          },
          width: 70,
        )
      ]
    ).show();
  }
}
