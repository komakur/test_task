import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:task_list_app/model/task/task.dart';
import 'package:task_list_app/router/app_router_config.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    super.key,
    required this.task,
    required this.valueNotifier,
  });

  final Task task;
  final ValueNotifier<int>? valueNotifier;

  void goToItsRoute(BuildContext context, int id) {
    valueNotifier?.value = id;
    context.goNamed(PAGE.TASKS.name, pathParameters: {'id': id.toString()});
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: valueNotifier!,
      builder: (context, value, child) => ListTile(
        title: Text(
          '${task.title}',
          style: TextStyle(
              fontWeight: task.id == value.toString() ? FontWeight.bold : null),
        ),
        trailing: Text(DateFormat('dd/MM,HH:mm').format(task.dateTime!)),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        tileColor: Colors.grey.shade200,
        onTap: () {
          goToItsRoute(context, int.parse(task.id!));
        },
      ),
    );
  }
}
