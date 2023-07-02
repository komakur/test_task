import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task_list_app/router/app_router_config.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '404 NOT FOUND',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            TextButton(
              onPressed: () =>
                  context.goNamed(PAGE.TASKS.name, pathParameters: {'id': '1'}),
              child: const Text('Go to Tasks'),
            ),
          ],
        ),
      ),
    );
  }
}
