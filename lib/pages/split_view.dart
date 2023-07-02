import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_list_app/providers/intl_provider.dart';

// this makes response view (when the the screen width is small, the NavBar will be hidden)

class SplitView extends ConsumerWidget {
  const SplitView({
    Key? key,
    this.menu,
    required this.content,
    // these values are now configurable with sensible default values
    this.breakpoint = 600,
    this.menuWidth = 240,
  }) : super(key: key);
  final Widget? menu;
  final Widget content;
  final double breakpoint;
  final double menuWidth;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isArabic = ref.watch(intlProvider);

    final screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth >= breakpoint) {
      // widescreen: menu on the left, content on the right
      return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => ref.read(intlProvider.notifier).toggleLang(),
          child: Text(isArabic ? 'Arabic' : 'English'),
        ),
        body: Directionality(
          textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
          child: Row(
            children: [
              menu == null
                  ? const SizedBox.shrink()
                  : SizedBox(
                      width: menuWidth,
                      child: menu,
                    ),
              Container(width: 0.5, color: Colors.black),
              Expanded(child: content),
            ],
          ),
        ),
      );
    } else {
      // narrow screen: show content, menu inside drawer
      return Scaffold(
        floatingActionButton: FloatingActionButton(
            onPressed: () => ref.read(intlProvider.notifier).toggleLang()),
        appBar: AppBar(
          leading: Builder(
            builder: (context) {
              return IconButton(
                onPressed: () => Scaffold.of(context).openDrawer(),
                icon: const Icon(
                  Icons.menu,
                ),
              );
            },
          ),
        ),
        body: content,
        drawer: SizedBox(
          width: menuWidth,
          child: Drawer(
            child: menu,
          ),
        ),
      );
    }
  }
}
