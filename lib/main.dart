import 'package:flutter/material.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter_rb/views/shop/collection/mall_collection_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'views/feed/post/image_post_page.dart';
import 'views/feed/post/videos_page_view.dart';
import 'views/home/home_page.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: HomePage(),
      builder: BotToastInit(), //1. call BotToastInit
      navigatorObservers: [BotToastNavigatorObserver()],
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/imagePostPage': (context) => const ImagePostPage(),
        '/videoPageView': (context) => const VideosPageView(),
        '/shop/collection': (context) => MallCollecionPage(),
      },
    );
  }
}
