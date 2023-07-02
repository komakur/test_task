import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_list_app/model/project/project.dart';
import 'package:task_list_app/service/network_service.dart';

final projectsNotifierProvider =
    StateNotifierProvider<TasksNotifier, AsyncValue<List<Project>>>((ref) {
  final networkService = ref.read(networkServiceProvider);
  return TasksNotifier(networkService);
});

class TasksNotifier extends StateNotifier<AsyncValue<List<Project>>> {
  TasksNotifier(this._service) : super(const AsyncLoading()) {
    getProjects();
  }

  final NetworkService _service;

  void getProjects() async {
    state = await _service.getProjects();
  }
}
