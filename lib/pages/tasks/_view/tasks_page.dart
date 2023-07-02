import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_list_app/common/app_style.dart';
import 'package:task_list_app/localization/app_translations_delegate.dart';

import 'package:task_list_app/pages/tasks/_view/task_details.dart';
import 'package:task_list_app/pages/tasks/_view/task_tile.dart';
import 'package:task_list_app/providers/tasks_provider.dart';

class TasksPage extends ConsumerStatefulWidget {
  const TasksPage({
    Key? key,
    required this.selectedTaskId,
  }) : super(key: key);

  final int? selectedTaskId;

  @override
  ConsumerState<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends ConsumerState<TasksPage> {
  late final ValueNotifier<int> valueNotifier;

  @override
  void initState() {
    super.initState();
    valueNotifier =
        ValueNotifier<int>(widget.selectedTaskId ?? widget.selectedTaskId!);
  }

  @override
  Widget build(BuildContext context) {
    final tasks = ref.watch(tasksNotifierProvider);
    return tasks.when(
      data: (tasks) => tasks.isEmpty
          ? const Text('No tasks')
          : Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppLocalization.of(context)
                              .getTranslatedValue('tasks')
                              .toString(),
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        const Divider(thickness: 2, color: AppStyle.darkBlue),
                        Expanded(
                          child: ListView.separated(
                            itemCount: tasks.length,
                            itemBuilder: (context, index) => TaskTile(
                              task: tasks[index],
                              valueNotifier: valueNotifier,
                            ),
                            separatorBuilder: (_, __) => const Padding(
                              padding: EdgeInsets.symmetric(vertical: 8.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                const  VerticalDivider(
                    thickness: 2,
                    color: Colors.grey,
                  ),
                  Expanded(
                    child: TaskDetails(
                        task: widget.selectedTaskId == null
                            ? null
                            : tasks.firstWhere((element) =>
                                element.id ==
                                widget.selectedTaskId.toString())),
                  )
                ],
              ),
            ),
      loading: () => const CircularProgressIndicator(),
      error: (error, stackTrace) => Text(error.toString()),
    );
  }
}
