import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:task_list_app/model/team/team.dart';
import 'package:task_list_app/router/app_router_config.dart';

class TeamTile extends StatelessWidget {
  const TeamTile({
    super.key,
    required this.team,
    required this.valueNotifier,
  });

  final Team team;
  final ValueNotifier<int>? valueNotifier;

  void goToItsRoute(BuildContext context, int id) {
    valueNotifier?.value = id;
    context.goNamed(PAGE.TEAMS.name, pathParameters: {'id': id.toString()});
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: valueNotifier!,
      builder: (context, value, child) => ListTile(
        title: Text(
          '${team.title}',
          style: TextStyle(
              fontWeight: team.id == value.toString() ? FontWeight.bold : null),
        ),
        trailing: Text(DateFormat('dd/MM,HH:mm').format(team.dateTime!)),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        tileColor: Colors.grey.shade200,
        onTap: () {
          goToItsRoute(context, int.parse(team.id!));
        },
      ),
    );
  }
}
