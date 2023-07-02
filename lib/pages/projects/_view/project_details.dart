import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:task_list_app/common/app_style.dart';
import 'package:task_list_app/model/project/project.dart';

class ProjectsDetails extends StatelessWidget {
  const ProjectsDetails({super.key, required this.project});

  final Project? project;

  @override
  Widget build(BuildContext context) {
    return project == null
        ? Text(
            'No project selected',
            style: Theme.of(context).textTheme.headlineMedium,
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${project?.title}',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const Divider(
                thickness: 2,
                color: AppStyle.darkBlue,
              ),
              Expanded(
                child: ListView(
                  children: [
                    Text(DateFormat('dd/MM,HH:mm').format(project!.dateTime!)),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Text(project!.description.toString()),
                  ],
                ),
              ),
            ],
          );
  }
}
