import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_list_app/common/app_style.dart';
import 'package:task_list_app/localization/app_translations_delegate.dart';
import 'package:task_list_app/pages/teams/_view/team_details.dart';
import 'package:task_list_app/pages/teams/_view/team_tile.dart';
import 'package:task_list_app/providers/team_provider.dart';

class TeamsPage extends ConsumerStatefulWidget {
  const TeamsPage({Key? key, required this.selectedTeamId}) : super(key: key);

  final int? selectedTeamId;

  @override
  ConsumerState<TeamsPage> createState() => _TeamsPageState();
}

class _TeamsPageState extends ConsumerState<TeamsPage> {
  late final ValueNotifier<int> valueNotifier;

  @override
  void initState() {
    super.initState();

    valueNotifier =
        ValueNotifier<int>(widget.selectedTeamId ?? widget.selectedTeamId!);
  }

  @override
  Widget build(BuildContext context) {
    final teams = ref.watch(teamNotifierProvider);
    return teams.when(
      data: (teams) => teams.isEmpty
          ? const Text('No Teams')
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
                              .getTranslatedValue('teams')
                              .toString(),
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        const Divider(thickness: 2, color: AppStyle.darkBlue),
                        Expanded(
                          child: ListView.separated(
                            itemCount: teams.length,
                            itemBuilder: (context, index) => TeamTile(
                              team: teams[index],
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
                    child: TeamDetails(
                        team: widget.selectedTeamId == null
                            ? null
                            : teams.firstWhere((element) =>
                                element.id ==
                                widget.selectedTeamId.toString())),
                  )
                ],
              ),
            ),
      loading: () => const CircularProgressIndicator(),
      error: (error, stackTrace) => Text(error.toString()),
    );
  }
}
