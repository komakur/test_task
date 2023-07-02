import 'package:flutter/material.dart';
import 'package:task_list_app/app_navigation_bar.dart';
import 'package:task_list_app/pages/split_view.dart';

// this is Scaffold for nested navigation

class ScaffoldWithNestedNavigation extends StatefulWidget {
  const ScaffoldWithNestedNavigation({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<ScaffoldWithNestedNavigation> createState() =>
      _ScaffoldWithNestedNavigationState();
}

class _ScaffoldWithNestedNavigationState
    extends State<ScaffoldWithNestedNavigation> {
  late final ValueNotifier<int> selectedNavBarListItemNotifier;

  @override
  void initState() {
    super.initState();
    selectedNavBarListItemNotifier = ValueNotifier(0);
  }

  @override
  Widget build(BuildContext context) {
    return SplitView(
      menu: AppNavigationBar(
        selectedNavBarListItemNotifier: selectedNavBarListItemNotifier,
      ),
      content: widget.child,
    );
  }
}
