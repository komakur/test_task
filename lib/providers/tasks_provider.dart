import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_list_app/model/task/task.dart';
import 'package:task_list_app/service/network_service.dart';

final tasksNotifierProvider =
    StateNotifierProvider<TasksNotifier, AsyncValue<List<Task>>>((ref) {
  final networkService = ref.read(networkServiceProvider);
  return TasksNotifier(networkService);
});

class TasksNotifier extends StateNotifier<AsyncValue<List<Task>>> {
  TasksNotifier(this._service) : super(const AsyncLoading()) {
    getTasks();
  }

  final NetworkService _service;

  Future<void> getTasks() async {
    state = await _service.getTasks();
  }
}
