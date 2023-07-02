import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_list_app/model/project/project.dart';
import 'package:task_list_app/model/task/task.dart';
import 'package:task_list_app/model/team/team.dart';

final networkServiceProvider = Provider<NetworkService>((ref) {
  return NetworkService();
});

// added other Models just to demonstate that it's working

class NetworkService {
  NetworkService();

  Future<AsyncValue<List<Task>>> getTasks() async {
    final now = DateTime.now();
    return AsyncData([
      Task(
        id: '1',
        title: 'Read emails from mailbox',
        dateTime: now,
        description:
            'Donec vitae interdum enim, id cursus arcu. Morbi consequat fermentum mi vel accumsan. Vestibulum suscipit ipsum a mauris molestie, et rutrum massa venenatis. Aliquam et ornare lorem. Phasellus tincidunt viverra nibh, eu pellentesque mauris lobortis at. Praesent tempus neque id ultrices tempus. Interdum et malesuada fames ac ante ipsum primis in faucibus. Mauris molestie, neque a faucibus vestibulum, est est tempus massa, ac cursus ante mauris sit amet neque. Donec dictum, libero eu sodales ultricies, lacus nulla finibus dolor, at dapibus nunc arcu id massa. Proin vitae augue dignissim libero convallis tristique. Etiam pretium, urna non porta dapibus, dui libero molestie velit, et facilisis quam mi vitae dolor. Nunc porttitor turpis eget ipsum condimentum rhoncus. Fusce eleifend diam vel facilisis pretium.',
      ),
      Task(
        id: '2',
        title: 'Check latest news on Flutter',
        dateTime: now,
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus at odio est. Sed ut porttitor elit. Aenean eu elementum nisl. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Sed vel enim eget leo sodales convallis eget in turpis. Phasellus a nulla nibh. Maecenas faucibus, sem faucibus gravida faucibus, odio elit vulputate ante, quis porta neque est sed urna. Cras tortor lectus, accumsan vel rhoncus eget, bibendum quis dolor.',
      ),
      Task(
        id: '3',
        title: 'Have a call with Flutter team',
        dateTime: now,
        description:
            'Lorem  dolor sit amet, feugiat nisi. Sed blandit dolor id turpis facilisis congue sed a sapien. Aenean rhoncus, velit semper lobortis sagittis, tortor augue vestibulum dolor, sed interdum massa risus elementum massa. Duis semper nec enim nec ultricies. Vestibulum consequat viverra nisi, non fringilla nunc elementum vel. Etiam eget dui laoreet, interdum purus eget, rhoncus mauris',
      ),
      Task(
        id: '4',
        title: 'Work on application performance',
        dateTime: now,
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer placerat viverra est et dapibus. Praesent tincidunt sollicitudin convallis. Sed ut nibh ullamcorper, mollis lacus vitae, feugiat nisi. Sed blandit dolor id turpis facilisis congue sed a sapien. Aenean rhoncus, velit semper lobortis sagittis, tortor augue vestibulum dolor, sed interdum massa risus elementum massa. Duis semper nec enim nec ultricies. Vestibulum consequat viverra nisi, non fringilla nunc elementum vel. Etiam eget dui laoreet, interdum purus eget, rhoncus mauris',
      ),
      Task(
        id: '5',
        title: 'Plan work for next week',
        dateTime: now,
        description:
            'Praesent enim quam, aliquam vitae rhoncus quis, placerat sit amet lectus. Curabitur at erat ac lacus bibendum egestas sodales vel metus. Duis dictum, dolor at faucibus dignissim, ipsum ipsum facilisis nulla, facilisis finibus dolor lacus in turpis. Proin posuere bibendum est, quis aliquet nibh convallis non. Integer at orci consequat, posuere tortor et, tincidunt leo. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Suspendisse eleifend, elit eget consectetur feugiat, enim risus efficitur elit, id iaculis ex enim imperdiet risus. Mauris eros massa, rhoncus at elementum ac, facilisis vitae sapien. Vestibulum aliquam finibus lorem, id sollicitudin odio. Quisque porttitor eros eu mauris eleifend, at tempor ipsum lobortis. Aenean ut dignissim elit, vel porta erat. Phasellus quis tellus ac tortor molestie condimentum.',
      ),
      Task(
        id: '6',
        title: 'Order lunch',
        dateTime: now,
        description:
            'Praesent enim quam, aliquam vitae rhoncus quis, placerat sit amet lectus. Curabitur at erat ac lacus bibendum egestas sodales vel metus. Duis dictum, dolor at faucibus dignissim, ipsum ipsum facilisis nulla, facilisis finibus dolor lacus in turpis. Proin posuere bibendum est, quis aliquet nibh convallis non. Integer at orci consequat, posuere tortor et, tincidunt leo. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Suspendisse eleifend, elit eget consectetur feugiat, enim risus efficitur elit, id iaculis ex enim imperdiet risus. Mauris eros massa, rhoncus at elementum ac, facilisis vitae sapien. Vestibulum aliquam finibus lorem, id sollicitudin odio. Quisque porttitor eros eu mauris eleifend, at tempor ipsum lobortis. Aenean ut dignissim elit, vel porta erat. Phasellus quis tellus ac tortor molestie condimentum.',
      ),
      Task(
        id: '7',
        title: 'Create an invoice for last month',
        dateTime: now,
        description:
            'Praesent enim quam, aliquam vitae rhoncus quis, placerat sit amet lectus. Curabitur at erat ac lacus bibendum egestas sodales vel metus. Duis dictum, dolor at faucibus dignissim, ipsum ipsum facilisis nulla, facilisis finibus dolor lacus in turpis. Proin posuere bibendum est, quis aliquet nibh convallis non. Integer at orci consequat, posuere tortor et, tincidunt leo. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Suspendisse eleifend, elit eget consectetur feugiat, enim risus efficitur elit, id iaculis ex enim imperdiet risus. Mauris eros massa, rhoncus at elementum ac, facilisis vitae sapien. Vestibulum aliquam finibus lorem, id sollicitudin odio. Quisque porttitor eros eu mauris eleifend, at tempor ipsum lobortis. Aenean ut dignissim elit, vel porta erat. Phasellus quis tellus ac tortor molestie condimentum.',
      ),
    ]);
  }

  Future<AsyncValue<List<Project>>> getProjects() async {
    final now = DateTime.now();
    return AsyncData([
      Project(
        id: '1',
        title: 'Main Project',
        dateTime: now,
        description:
            'Proin libero erat, placerat sed consectetur ac, sagittis in sapien. Praesent lacinia nisl turpis, vel blandit ligula aliquet tempus. Sed vel eros et nisi aliquet dignissim nec in dui. Morbi arcu urna, faucibus et lacinia vel, efficitur vel leo. Sed gravida nisi tristique ultricies condimentum. Fusce venenatis blandit luctus. Ut vehicula nisl lorem, sed scelerisque elit consequat id. Morbi interdum, erat in malesuada lacinia, velit urna fermentum risus, in ornare diam nisl at mi. Nulla facilisi. Donec consectetur dictum augue, in sodales ante luctus vitae. Pellentesque augue ante, molestie tincidunt erat id, tempor convallis dolor. Vestibulum eleifend, nunc eget iaculis pretium, metus lacus semper diam, et malesuada ipsum augue eu velit.',
      ),
      Project(
        id: '2',
        title: 'Test Project',
        dateTime: now,
        description:
            'Nullam venenatis nibh sed tempor sodales. Aenean porta, nunc et placerat sollicitudin, massa arcu vehicula neque, id ornare quam dui vel metus. Vestibulum lectus tellus, hendrerit et venenatis nec, mollis laoreet mi. Nullam iaculis auctor nibh ac maximus. Fusce semper pellentesque ipsum, a scelerisque ante condimentum ac. Sed vel pharetra orci. Nulla consequat interdum commodo. Nullam elementum purus lacus.',
      ),
      Project(
        id: '3',
        title: 'Important Project',
        dateTime: now,
        description:
            'Etiam a purus enim. Cras vulputate dictum felis, ut pretium urna malesuada sed. Proin nec quam consectetur, auctor dolor eu, placerat orci. Maecenas pretium mi quis accumsan interdum. Aliquam sapien tellus, fringilla eu augue a, posuere condimentum tortor. Nunc ligula erat, scelerisque in ullamcorper a, viverra at turpis. Nulla tincidunt nibh consequat tortor efficitur, sed tristique lectus molestie.',
      ),
    ]);
  }

  Future<AsyncValue<List<Team>>> getTeams() async {
    final now = DateTime.now();
    return AsyncData([
      Team(
        id: '1',
        title: 'First Team',
        dateTime: now,
        description:
            'Nullam venenatis nibh sed tempor sodales. Aenean porta, nunc et placerat sollicitudin, massa arcu vehicula neque, id ornare quam dui vel metus. Vestibulum lectus tellus, hendrerit et venenatis nec, mollis laoreet mi. Nullam iaculis auctor nibh ac maximus. Fusce semper pellentesque ipsum, a scelerisque ante condimentum ac. Sed vel pharetra orci. Nulla consequat interdum commodo. Nullam elementum purus lacus.',
      ),
      Team(
        id: '2',
        title: 'Art Team',
        dateTime: now,
        description:
            'Praesent enim quam, aliquam vitae rhoncus quis, placerat sit amet lectus. Curabitur at erat ac lacus bibendum egestas sodales vel metus. Duis dictum, dolor at faucibus dignissim, ipsum ipsum facilisis nulla, facilisis finibus dolor lacus in turpis. Proin posuere bibendum est, quis aliquet nibh convallis non. Integer at orci consequat, posuere tortor et, tincidunt leo. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Suspendisse eleifend, elit eget consectetur feugiat, enim risus efficitur elit, id iaculis ex enim imperdiet risus. Mauris eros massa, rhoncus at elementum ac, facilisis vitae sapien. Vestibulum aliquam finibus lorem, id sollicitudin odio. Quisque porttitor eros eu mauris eleifend, at tempor ipsum lobortis. Aenean ut dignissim elit, vel porta erat. Phasellus quis tellus ac tortor molestie condimentum.',
      ),
      Team(
        id: '3',
        title: 'The best team',
        dateTime: now,
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer placerat viverra est et dapibus. Praesent tincidunt sollicitudin convallis. Sed ut nibh ullamcorper, mollis lacus vitae, feugiat nisi. Sed blandit dolor id turpis facilisis congue sed a sapien. Aenean rhoncus, velit semper lobortis sagittis, tortor augue vestibulum dolor, sed interdum massa risus elementum massa. Duis semper nec enim nec ultricies. Vestibulum consequat viverra nisi, non fringilla nunc elementum vel. Etiam eget dui laoreet, interdum purus eget, rhoncus mauris.',
      ),
    ]);
  }
}
