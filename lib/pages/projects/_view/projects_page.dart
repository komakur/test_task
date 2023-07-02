import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_list_app/common/app_style.dart';
import 'package:task_list_app/localization/app_translations_delegate.dart';
import 'package:task_list_app/pages/projects/_view/project_details.dart';
import 'package:task_list_app/pages/projects/_view/project_tile.dart';
import 'package:task_list_app/providers/projects_provider.dart';

class ProjectsPage extends ConsumerStatefulWidget {
  const ProjectsPage({
    Key? key,
    required this.selectedProjectId,
  }) : super(key: key);
  final int? selectedProjectId;

  @override
  ConsumerState<ProjectsPage> createState() => _ProjectsPageState();
}

class _ProjectsPageState extends ConsumerState<ProjectsPage> {
  late final ValueNotifier<int> valueNotifier;

  @override
  void initState() {
    super.initState();
    valueNotifier = ValueNotifier<int>(
        widget.selectedProjectId ?? widget.selectedProjectId!);
  }

  @override
  Widget build(BuildContext context) {
    final projects = ref.watch(projectsNotifierProvider);
    return projects.when(
      data: (projects) => Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppLocalization.of(context)
                        .getTranslatedValue('projects')
                        .toString(),
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const Divider(thickness: 2, color: AppStyle.darkBlue),
                  Expanded(
                    child: ListView.separated(
                      itemCount: projects.length,
                      itemBuilder: (context, index) => ProjectTile(
                        project: projects[index],
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
            const VerticalDivider(
              thickness: 2,
              color: Colors.grey,
            ),
            Expanded(
              child: ProjectsDetails(
                  project: widget.selectedProjectId == null
                      ? null
                      : projects.firstWhere((element) =>
                          element.id == widget.selectedProjectId.toString())),
            )
          ],
        ),
      ),
      loading: () => const CircularProgressIndicator(),
      error: (error, stackTrace) => Text(error.toString()),
    );
  }
}
