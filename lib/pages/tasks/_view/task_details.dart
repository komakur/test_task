import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:task_list_app/common/app_style.dart';
import 'package:task_list_app/model/task/task.dart';

class TaskDetails extends StatelessWidget {
  const TaskDetails({super.key, required this.task});

  final Task? task;

  @override
  Widget build(BuildContext context) {
    return task == null
        ? Text(
            'No task selected',
            style: Theme.of(context).textTheme.headlineMedium,
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${task?.title}',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
           const   Divider(
                thickness: 2,
                color: AppStyle.darkBlue,
              ),
              Expanded(
                child: ListView(
                  children: [
                    Text(DateFormat('dd/MM,HH:mm').format(task!.dateTime!)),
                   const SizedBox(
                      height: 10.0,
                    ),
                    Text(task!.description.toString()),
                  ],
                ),
              ),
            ],
          );
  }
}
