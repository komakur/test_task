import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_list_app/model/team/team.dart';
import 'package:task_list_app/service/network_service.dart';

final teamNotifierProvider =
    StateNotifierProvider<TeamNotifier, AsyncValue<List<Team>>>((ref) {
  final networkService = ref.read(networkServiceProvider);
  return TeamNotifier(networkService);
});

class TeamNotifier extends StateNotifier<AsyncValue<List<Team>>> {
  TeamNotifier(this._service) : super(const AsyncLoading()) {
    getTeams();
  }

  final NetworkService _service;

  Future<void> getTeams() async {
    state = await _service.getTeams();
  }
}
