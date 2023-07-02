import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task_list_app/common/app_style.dart';
import 'package:task_list_app/localization/app_translations_delegate.dart';

class AppNavigationBar extends StatelessWidget {
  const AppNavigationBar(
      {Key? key, required this.selectedNavBarListItemNotifier})
      : super(key: key);

  final ValueNotifier<int> selectedNavBarListItemNotifier;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppStyle.darkBlue,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 64),
        itemCount: navigationBarItems.length,
        itemBuilder: (context, index) => ValueListenableBuilder(
          valueListenable: selectedNavBarListItemNotifier,
          builder: (context, value, child) => _NavigationBarListItem(
            onPressed: () {
              selectedNavBarListItemNotifier.value = index;
            },
            isSelected: index == value,
            item: navigationBarItems[index],
          ),
        ),
        separatorBuilder: (context, index) => const Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: Divider(
            color: AppStyle.mediumBlue,
            height: 1,
            endIndent: 16,
            indent: 16,
          ),
        ),
      ),
    );
  }
}

class _NavigationBarListItem extends StatelessWidget {
  const _NavigationBarListItem({
    Key? key,
    required this.item,
    required this.isSelected,
    required this.onPressed,
  }) : super(key: key);

  final NavigationBarItem item;
  final bool isSelected;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed();
        context.goNamed(item.name, pathParameters: {'id': '1'});
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: isSelected ? AppStyle.selectedNavBarListItem : null,
        ),
        child: Text(
          AppLocalization.of(context).getTranslatedValue(item.name).toString(),
          style: const TextStyle(
            color: AppStyle.lightTextColor,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}

final navigationBarItems = [
  NavigationBarItem(name: 'tasks', url: 'tasks'),
  NavigationBarItem(name: 'projects', url: 'projects'),
  NavigationBarItem(name: 'teams', url: 'teams'),
];

class NavigationBarItem {
  final String name;
  final String url;

  NavigationBarItem({required this.name, required this.url});
}
