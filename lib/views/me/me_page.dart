import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'me_navigation_drawer.dart';

class MePage extends HookConsumerWidget {
  const MePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "DrawerTitle",
          ),
        ),
        body: const Center(
          child: Placeholder(),
        ),
        drawer: const Drawer(
          child: MeNavigationDrawer(),
        ));
  }
}
