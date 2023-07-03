import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_list_app/router/app_router_config.dart';
import 'package:task_list_app/scaffold_nested_nav.dart';

import 'package:task_list_app/pages/not_found_page.dart';
import 'package:task_list_app/pages/projects/_view/projects_page.dart';
import 'package:task_list_app/pages/tasks/_view/tasks_page.dart';
import 'package:task_list_app/pages/teams/_view/teams_page.dart';

// private navigators
final _rootNavigationKey = GlobalKey<NavigatorState>();

final _shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shellKey');

final goRouterProvider = Provider(
  (ref) => GoRouter(
    initialLocation: '${PAGE.TASKS.url}/1',
    navigatorKey: _rootNavigationKey,
    routes: <RouteBase>[
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) => ScaffoldWithNestedNavigation(
          child: child,
        ),
        routes: [
          GoRoute(
            name: PAGE.TASKS.name,
            path: '${PAGE.TASKS.url}/:id',
            pageBuilder: (context, state) {
              return NoTransitionPage(
                child: TasksPage(
                  selectedTaskId: int.parse(state.pathParameters['id'] ?? '1'),
                ),
              );
            },
          ),
          GoRoute(
            name: PAGE.PROJECTS.name,
            path: '${PAGE.PROJECTS.url}/:id',
            pageBuilder: (context, state) {
              return NoTransitionPage(
                child: ProjectsPage(
                  selectedProjectId:
                      int.parse(state.pathParameters['id'] ?? '1'),
                ),
              );
            },
          ),
          GoRoute(
            name: PAGE.TEAMS.name,
            path: '${PAGE.TEAMS.url}/:id',
            pageBuilder: (context, state) {
              return NoTransitionPage(
                child: TeamsPage(
                  selectedTeamId: int.parse(state.pathParameters['id'] ?? '1'),
                ),
              );
            },
          ),
        ],
      ),
    ],
    errorPageBuilder: (context, state) => const NoTransitionPage(
      child: NotFoundPage(),
    ),
  ),
);
