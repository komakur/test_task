// ignore_for_file: constant_identifier_names

enum PAGE {
  TASKS,
  PROJECTS,
  TEAMS,
}

extension PageExtension on PAGE {
  String get url {
    switch (this) {
      case PAGE.TASKS:
        return '/tasks';
      case PAGE.PROJECTS:
        return '/projects';
      case PAGE.TEAMS:
        return '/teams';
      default:
        return '/not_found';
    }
  }

  String get name {
    switch (this) {
      case PAGE.TASKS:
        return 'tasks';
      case PAGE.PROJECTS:
        return 'projects';
      case PAGE.TEAMS:
        return 'teams';
      default:
        return 'not_found';
    }
  }
}
