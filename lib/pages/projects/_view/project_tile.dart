import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:task_list_app/model/project/project.dart';
import 'package:task_list_app/router/app_router_config.dart';

class ProjectTile extends StatelessWidget {
  const ProjectTile({
    super.key,
    required this.project,
    required this.valueNotifier,
  });

  final Project project;
  final ValueNotifier<int>? valueNotifier;

  void goToItsRoute(BuildContext context, int id) {
    valueNotifier?.value = id;
    context.goNamed(PAGE.PROJECTS.name, pathParameters: {'id': id.toString()});
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: valueNotifier!,
      builder: (context, value, child) => ListTile(
        title: Text(
          '${project.title}',
          style: TextStyle(
              fontWeight:
                  project.id == value.toString() ? FontWeight.bold : null),
        ),
        trailing: Text(DateFormat('dd/MM,HH:mm').format(project.dateTime!)),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        tileColor: Colors.grey.shade200,
        onTap: () {
          goToItsRoute(context, int.parse(project.id!));
        },
      ),
    );
  }
}
