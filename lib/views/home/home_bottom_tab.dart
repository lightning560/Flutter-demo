import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '/core/providers/home/bottom_tab_provider.dart';

class HomeBottomTab extends HookConsumerWidget {
  const HomeBottomTab({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabIndex = ref.watch(bottomTabIndexProvider);
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            CupertinoIcons.house_fill,
            // color: Colors.green,
            size: 24.0,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.play_circle),
          label: 'Video',
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.cart_fill, color: Colors.pink, size: 32),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.plus),
          label: 'Publish',
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.person),
          label: 'Me',
        ),
      ],
      type: BottomNavigationBarType.fixed,
      currentIndex:
          // int.parse("${context.watch<HomeViewModel>().bottomNavigationIndex}"),
          // 1,
          tabIndex,
      selectedItemColor: Colors.amber[800],
      onTap: (i) => ref.read(bottomTabIndexProvider.notifier).setIndex(i),
    );
  }
}
