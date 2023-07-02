import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:task_list_app/common/app_style.dart';
import 'package:task_list_app/model/team/team.dart';

class TeamDetails extends StatelessWidget {
  const TeamDetails({super.key, required this.team});

  final Team? team;

  @override
  Widget build(BuildContext context) {
    return team == null
        ? Text(
            'No team selected',
            style: Theme.of(context).textTheme.headlineMedium,
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${team?.title}',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const Divider(
                thickness: 2,
                color: AppStyle.darkBlue,
              ),
              Expanded(
                child: ListView(
                  children: [
                    Text(DateFormat('dd/MM,HH:mm').format(team!.dateTime!)),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Text(team!.description.toString()),
                  ],
                ),
              ),
            ],
          );
  }
}
