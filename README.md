# Full stack demo-intro

This is a modern full-stack demo developed independently by Leon LiangNing individual .

In terms of functionality, half of it is a feed and half is e-commerce, referenced from the XiaoHongShu[小红书 – 你的生活指南 on the App Store (apple.com)](https://apps.apple.com/us/app/%E5%B0%8F%E7%BA%A2%E4%B9%A6-%E4%BD%A0%E7%9A%84%E7%94%9F%E6%B4%BB%E6%8C%87%E5%8D%97/id741292507).

## projects

- [Golang-framework kit-demo](https://github.com/lightning560/mio) is named mio
- [Golang Backend microservice-demo](https://github.com/lightning560/go-microservice)
- [SRE & Full chain stress test]()
- [Web-demo](https://github.com/lightning560/Web-demo)
- [iOS-demo](https://github.com/lightning560/iOS-demo)
- [Flutter-demo](https://github.com/lightning560/Flutter-demo)

# flutter-demo

Personal time is limited, demo focus on the development of Golang framework and Golang microservice backend.
Flutter demo is a semi-finished product, only basic functions have been implemented, details and UI have not been dealt with.

# tech-stack

### MVVM,state

- riverpod v2
- hooks_riverpod: ^2.2.0
- flutter_hooks: ^0.18.5+1

### annotation

- riverpod_annotation
- freezed_annotation: ^2.2.0
- json_annotation: ^4.8.0

### log

logger: ^1.1.0

### http

dio

# library

- visibility_detector
- video_player
- webview_flutter
- like_button
- ...

# features

## feed gallery

![](/img/Simulator%20Screen%20Recording%20-%20iPhone%2014%20Pro%20-%202023-07-13%20at%2011.21.26.gif)

### Swipe up to refresh data

Through the onVisibilityChanged listener of visibility_detector, monitor the display ratio of a transparent widget at the bottom. If the ratio is more than 1%, request more data until the exposed ratio of the widget is 0.

### drop down refresh

RefreshIndicator

```dart
class _FeedPageState extends ConsumerState<FeedPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true; // 是否需要缓存
  @override
  Widget build(BuildContext context) {
    super.build(context); // 必须调用
    /// for repo use,must before ref.watch(feedCardsRepoProvider)
    final feedCardsTopic = ref.read(feedCardsTopicProvider.notifier);
    feedCardsTopic.state = widget.topic;
    final cardsRepo = ref.watch(feedCardsRepoProvider);
    String routeTo;
    return RefreshIndicator(
      onRefresh: () async => ref.refresh(feedCardsRepoProvider),
      ...
    );
  }
}
```

### navigateTabView

Set the linkage of TabBar in AppBar and TabBarView in body.

```dart
class FeedTabPage extends StatelessWidget {
  FeedTabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 9,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: const Icon(
            CupertinoIcons.book_fill,
            color: Colors.yellow,
          ),
          actions: const [
            Icon(CupertinoIcons.search),
          ],
          bottom: TabBar(
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
            ),
            splashBorderRadius: BorderRadius.circular(40),
            // automaticIndicatorColorAdjustment:true,
            isScrollable: true,
            // onTap: (value) => print('tabbar ontap:$value'),
            tabs: <Widget>[
              Tab(
                text: "follow",
              ),
              Tab(text: "for you"),
              Tab(
                text: "study",
              ),
              Tab(
                icon: Icon(Icons.beach_access_sharp),
              ),
              ...
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Center(
              child: FeedPage(key: UniqueKey(), topic: "you"),
            ),
            ...
          ],
        ),
      ),
    );
  }
}
```

### page cache

When switching from TabBarView A to another TabBarView, and then returning to TabBarView A, it is found that A has been destroyed and needs to re-request data and render.
The desired effect is to save the current browsing position of TabBarView A, and when switching back, do not trigger data request and rendering again.
Use AutomaticKeepAliveClientMixin() to keep the current TabBarView.

```dart
class _FeedPageState extends ConsumerState<FeedPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true; // 是否需要缓存
  @override
  Widget build(BuildContext context) {
   ...
  }
}
```

## image post

![](/img/Simulator%20Screen%20Recording%20-%20iPhone%2014%20Pro%20-%202023-07-13%20at%2011.25.20.gif)

## vertical video player

refer to TikTok

![](/img/Simulator%20Screen%20Recording%20-%20iPhone%2014%20Pro%20-%202023-07-13%20at%2011.37.09.gif)

### vertical slide

Listen to the current page index in onPageChanged, and synchronize the index to riverpod.

```dart
class _VideosPageViewState extends ConsumerState<VideosPageView> {
  late PageController _controller;
  @override
  void initState() {

    super.initState();
    _controller = PageController(initialPage: 0, keepPage: true);
    _controller.addListener(() {
      //PageView滑动的距离
      double offset = _controller.offset;
      //当前显示的页面的索引
      double page = _controller.page!;
      print("pageView 滑动的距离 $offset  索引 $page");
    });
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      allowImplicitScrolling: true,
      scrollDirection: Axis.vertical,
      controller: _controller,
      onPageChanged: (idx) {
        print(idx);
        ref.read(currVideoPageViewProvider.notifier).setCurr(idx);
      },
      children: <Widget>[
        VideoPostPage(pageIndex: 0, key: UniqueKey()),
        VideoPostPage(
          pageIndex: 1,
          key: UniqueKey(),
        ),
        const Center(
          child: Text('Third Page'),
        ),
      ],
    );
  }
}
```

### Preloading&cache

In PageView, the allowImplicitScrolling property is set to true, which will cache one page before and after, so when sliding to page three, page one will be destroyed.
If the current page is 3, we can read and render the video of page 4 in advance, but the player of page 4 should be mute. When the user slides to page 4, set the playback progress to 0 and unmute.

```dart
class _VideoPostPageState extends ConsumerState<VideoPostPage>
    with WidgetVisibilityStateMixin, WidgetsBindingObserver {
  late VideoPlayerController _controller;
  late int _currIndex;
  // final AsyncMemoizer _memoizer = AsyncMemoizer();
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        videoUrl)
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
        _controller.setVolume(0);
        _controller.setLooping(true);
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  onHide() {
    super.onHide();
    _controller.pause();
  }

  @override
  void onShow() {
    super.onShow();
    _controller.setVolume(100);
  }
  void handleChangedPage() {
    if (_controller.value.isInitialized) {
      if (_currIndex == widget.pageIndex) {
        _controller.setVolume(100);
      }
      if (_currIndex - 1 == widget.pageIndex) {
        _controller.pause();
      }
      if (_currIndex + 1 == widget.pageIndex) {
        _controller.pause();
      }
    }
  }
  ...
  @override
  Widget build(BuildContext context) {
    // final renderBox = context.findRenderObject();
    // Offset offset = renderBox?.localToGlobal(Offset.zero);
    // print("POSITION: $offset");

    _currIndex = ref.watch(currVideoPageViewProvider);
    // handleChangedPage();
    return Scaffold(
      body: VisibilityDetector(
          key: Key("key+${widget.pageIndex.toString()}"),
          onVisibilityChanged: (visibilityInfo) {
            var visiblePercentage = visibilityInfo.visibleFraction * 100;
            debugPrint(
                'Widget ${visibilityInfo.key} is ${visiblePercentage}% visible');
            if (visiblePercentage == 100) {
              _controller.play();
              _controller.setVolume(100);
            }
            if (visiblePercentage < 100) {
              _controller.pause();
            }
          },
          child: Stack(
            fit: StackFit.loose,
            children: [
              Column(
                children: [
                  Expanded(
                    child: Center(
                        child: _controller.value.isInitialized
                            ? AspectRatio(
                                aspectRatio: _controller.value.aspectRatio,
                                child: VideoPlayer(_controller),
                              )
                            : const CircularProgressIndicator()),
                  )
                ],
              ),
              Positioned(
                bottom: 2,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height - 100,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _controller.value.isPlaying
                          ? _controller.pause()
                          : _controller.play();
                    });
                  },
                  child: _controller.value.isInitialized
                      ? Container(
                          color: Color.fromRGBO(116, 75, 228, 0.1),
                          child: _controller.value.isPlaying
                              ? const SizedBox.shrink()
                              : const IconButton(
                                  icon: Icon(
                                    Icons.play_arrow_rounded,
                                    size: 64,
                                    color: Color.fromARGB(153, 127, 124, 124),
                                  ),
                                  onPressed: null,
                                ))
                      : Container(
                          color: Colors.amberAccent,
                        ),
                ),
              ),
              Positioned(
                bottom: 0,
                width: MediaQuery.of(context).size.width,
                child: VideoProgressIndicator(
                  _controller,
                  allowScrubbing: true,
                  colors: VideoProgressColors(
                      backgroundColor: Colors.blueGrey,
                      bufferedColor: Colors.blueGrey,
                      playedColor: Colors.blueAccent),
                ),
              ),
            ],
          )),
    );
  }
}
```

## comment

![](/img/Simulator%20Screen%20Recording%20-%20iPhone%2014%20Pro%20-%202023-07-13%20at%2011.26.16.gif)

### input of comment

set resizeToAvoidBottomInset: true ensure bottomBar can show right
TextField must be wrapped with Expenaed or SizedBox.
The inputActive variable is used to control whether the TextField pops up.
ModalBarrier serves as a masking layer. Clicking on the masking layer cancels the pop-up state of TextField.
FocusNode is used to control whether TextField gains focus.

```dart
 body: Center(
          child: Stack(
        children: [
          ListView.builder(
            addAutomaticKeepAlives: true,
            itemCount: widgets.length,
            itemBuilder: (context, index) {
              var item = widgets[index];
              return item;
            },
          ),
          if (inputActive)
            SizedBox(
                child: ModalBarrier(
              color: Colors.black26,
              onDismiss: () {
                setState(() {
                  inputActive = false;
                });
              },
            )),
          if (inputActive)
            Positioned(
                // bottom: MediaQuery.of(context).viewInsets.bottom / 2,
                bottom: 10,
                child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Container(
                        color: Colors.white,
                        child: Row(
                          children: [
                            SizedBox(
                                width: MediaQuery.of(context).size.width - 80,
                                child: TextField(
                                  controller: _controller,
                                  focusNode: focusNode,
                                  autofocus: true,
                                  keyboardType: TextInputType.text,
                                  textInputAction:
                                      TextInputAction.done, // keyboard done key
                                  maxLines: 1,
                                  maxLengthEnforcement:
                                      MaxLengthEnforcement.none,
                                )),
                            TextButton(
                              child: Text("send"),
                              onPressed: () {},
                            )
                          ],
                        ))))
        ],
      )),
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey[100],
        child: IconTheme(
          data: IconThemeData(color: Colors.black),
          child: Row(
            children: <Widget>[
              FilledButton.tonal(
                onPressed: () {
                  inputActive = !inputActive;
                  setState(() {});
                },
                child: Text("reply things"),
              ),
   ...
            ],
          ),
        ),
```

## mall

![](/img/Simulator%20Screen%20Recording%20-%20iPhone%2014%20Pro%20-%202023-07-13%20at%2011.51.04.gif)

### product

![](/img/Simulator%20Screen%20Recording%20-%20iPhone%2014%20Pro%20-%202023-07-13%20at%2012.02.01.gif)

# MVVM

use riverpod v2

## json to model

- freezed_annotation: ^2.2.0
- json_annotation: ^4.8.0
- hooks_riverpod: ^2.2.0
- freezed: ^2.3.2
- json_serializable: ^6.6.1
- riverpod_generator: ^1.1.1

run `flutter pub run build_runner build` Generate code with this commands.

```dart
part 'feed_card.freezed.dart';
part 'feed_card.g.dart';

@freezed
class FeedCard with _$FeedCard {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory FeedCard({
    required String? id,
    required String? cover,
    required String? avatar,
    required String? name,
    required String? title,
    required String topic,
    @JsonKey(unknownEnumValue: FeedKind.image) required FeedKind type,
    required int? likeCnt,
    // int? like_cnt,
    bool? haveProduct,
    bool? isSponsored,
    int? viewCnt,
  }) = _FeedCard;
  factory FeedCard.fromJson(Map<String, dynamic> json) =>
      _$FeedCardFromJson(json);
}

import 'package:json_annotation/json_annotation.dart';
enum FeedKind {
 @JsonValue('image')
 image,
 @JsonValue('video')
 video,
 @JsonValue('live')
 live
}
```

## View

final cardsRepo = ref.watch(feedCardsRepoProvider);

cardsRepo.when Obtaining asynchronous network data.

```dart
class _FeedPageState extends ConsumerState<FeedPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true; // 是否需要缓存
  @override
  Widget build(BuildContext context) {
    super.build(context); // 必须调用
    /// for repo use,must before ref.watch(feedCardsRepoProvider)
    final feedCardsTopic = ref.read(feedCardsTopicProvider.notifier);
    feedCardsTopic.state = widget.topic;
    final cardsRepo = ref.watch(feedCardsRepoProvider);
    String routeTo;
    return RefreshIndicator(
      onRefresh: () async => ref.refresh(feedCardsRepoProvider),
      child: cardsRepo.when(
        data: (repo) {
          List<Widget> cards = [];
          for (final c in repo.feedCards) {
            switch (c.type) {
              case FeedKind.image:
                {
                  routeTo = "/imagePostPage";
                  break;
                }
              case FeedKind.video:
                {
                  routeTo = "/videoPageView";
                  break;
                }
              case FeedKind.live:
                {
                  routeTo = "/live_room";
                  break;
                }
            }
            cards.add(FeedStaggeredGridCardWidget(
                feedCard: c, routeTo: routeTo, key: UniqueKey()));
          }
          return StaggeredGridContainer(key: UniqueKey(), cards: cards);
        },
        error: (err, stack) {
          BotToast.showText(text: "async value error");
          return Text('FeedPageError: $err');
        },
        loading: () => Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
```

## Provider:VM

run `flutter pub run build_runner build` Generate code with commands.

```dart
class FeedCardsState {
  late List<FeedCard> feedCards;
  late int count = 0;
  late String s = '';
  FeedCardsState(List<FeedCard> feedCards, int count, String s) {
    this.feedCards = feedCards;
    this.count = count;
    this.s = s;
  }
}

final feedCardsTopicProvider = StateProvider.autoDispose<String>((_) => 'you');

@riverpod
class FeedCardsRepo extends _$FeedCardsRepo {
  final rbHttp = RbHttp();
  @override
  FutureOr<FeedCardsState> build() async {
    final feedCardsTopic = ref.watch(feedCardsTopicProvider);
    var data = await getFeedCards(feedCardsTopic);
    return FeedCardsState(data, data.length, '1');
  }

  Future<List<FeedCard>> getFeedCards(String topic) async {
    final res = await rbHttp.get("${Api.FEED_CARDS}?topic=$topic");
    final List list = res;
    for (var item in list) {
      item['topic'] = topic;
    }
    print(list);
    return list.map((feedCard) => FeedCard.fromJson(feedCard)).toList();
  }
}
```

# implement

## routie

Pre-register the route in the root widget

```dart
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
        ...
      },
    );
  }
}
```

Trigger route jump through Navigator.pushNamed.

```dart
String routeTo = "imagePostPage";
GestureDetector(
 onTap: () {
  Navigator.pushNamed(context, routeTo);
}
```

## log

base on logger: ^1.1.0

```dart
import 'package:logger/logger.dart';

var RbLog = Logger(
  filter: null, // Use the default LogFilter (-> only log in debug mode)
  printer: _prettyPrinter, // Use the PrettyPrinter to format and print log
  output: null,
  level: null, // Use the default LogOutput (-> send everything to console)
);

var _prettyPrinter = PrettyPrinter(
    methodCount: 2, // number of method calls to be displayed
    errorMethodCount: 8, // number of method calls if stacktrace is provided
    lineLength: 120, // width of the output
    colors: true, // Colorful log messages
    printEmojis: true, // Print an emoji for each log message
    printTime: false // Should each log print contain a timestamp
    );
```

## http

wrap library dio^5.0.0

```dart
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'api.dart';
import 'proxy.dart';
import 'connections_interceptor.dart';
import 'request_interceptor.dart';

class RbHttp {
  /// 超时时间
  static const CONNECT_TIMEOUT = Duration(seconds: 3);
  static const RECEIVE_TIMEOUT = Duration(seconds: 6);

  static RbHttp instance = RbHttp._internal();
  factory RbHttp() => instance;
  Dio dio = Dio();
  final CancelToken _cancelToken = CancelToken();
  RbHttp._internal() {
    dio.options
      ..baseUrl = Api.Local_MOCK_URL
      ..connectTimeout = CONNECT_TIMEOUT
      ..receiveTimeout = RECEIVE_TIMEOUT
      ..validateStatus = (int? status) {
        return status != null && status > 0;
      }
      ..headers = {};
    dio.interceptors.add(RequestInterceptor()); //自定义拦截
    dio.interceptors.add(ConnectsInterceptor()); //拦截网络
    dio.interceptors.add(LogInterceptor()); //打开日志
    // dio.interceptors.add(NetCacheInterceptor()); //

    // 在调试模式下需要抓包调试，所以使用代理，并禁用HTTPS证书校验
    if (PROXY_ENABLE) {
      dio.httpClientAdapter = IOHttpClientAdapter()
        ..onHttpClientCreate = (client) {
          // Config the client.
          client.findProxy = (uri) {
            // Forward all request to proxy "PROXY_IP:$PROXY_PORT".
            return "PROXY $PROXY_IP:$PROXY_PORT";
          };
          // We can also create a new HttpClient for Dio instead of returning,
          // but a client must being returned here.
          // return client;
          client.badCertificateCallback =
              (X509Certificate cert, String host, int port) => true;
          return client;
        };
    }
  }

  void init(
      //这个在main或者初始化的时候先调用一下
      {String? baseUrl,
      int? connectTimeout,
      int? receiveTimeout,
      List<Interceptor>? interceptors}) {
    dio.options = dio.options.copyWith(
      baseUrl: baseUrl,
      connectTimeout: Duration(milliseconds: connectTimeout!),
      receiveTimeout: Duration(milliseconds: receiveTimeout!),
    );
    if (interceptors != null && interceptors.isNotEmpty) {
      dio.interceptors.addAll(interceptors);
    }
  }

  /// 设置headers
  void setHeaders(Map<String, dynamic> map) {
    dio.options.headers.addAll(map);
  }

/*
   * 取消请求
   * 同一个cancel token 可以用于多个请求，当一个cancel token取消时，所有使用该cancel token的请求都会被取消。
   * 所以参数可选
   */
  void cancelRequests({CancelToken? token}) {
    token ?? _cancelToken.cancel("cancelled");
  }

  /// http get 操作
  Future get(
    String path, {
    Map<String, dynamic>? params,
    Options? options,
    CancelToken? cancelToken,
    bool refresh = false,
    bool noCache = true,
    String? cacheKey,
    bool cacheDisk = false,
  }) async {
    Options requestOptions = options ?? Options();
    requestOptions = requestOptions.copyWith(extra: {
      "refresh": refresh,
      "noCache": noCache,
      "cacheKey": cacheKey,
      "cacheDisk": cacheDisk,
    });
    Response response;
    response = await dio.get(path,
        queryParameters: params,
        options: requestOptions,
        cancelToken: cancelToken ?? _cancelToken);
    return response.data;
  }

  /// http post 操作
  Future post(
    String path, {
    Map<String, dynamic>? params,
    data,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    Options requestOptions = options ?? Options();
    var response = await dio.post(path,
        data: data,
        queryParameters: params,
        options: requestOptions,
        cancelToken: cancelToken ?? _cancelToken);
    return response.data;
  }

  /// restful put 操作
  Future put(
    String path, {
    data,
    Map<String, dynamic>? params,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    Options requestOptions = options ?? Options();

    var response = await dio.put(path,
        data: data,
        queryParameters: params,
        options: requestOptions,
        cancelToken: cancelToken ?? _cancelToken);
    return response.data;
  }

  /// http patch 操作
  Future patch(
    String path, {
    data,
    Map<String, dynamic>? params,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    Options requestOptions = options ?? Options();
    var response = await dio.patch(path,
        data: data,
        queryParameters: params,
        options: requestOptions,
        cancelToken: cancelToken ?? _cancelToken);
    return response.data;
  }

  /// http delete 操作
  Future delete(
    String path, {
    data,
    Map<String, dynamic>? params,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    Options requestOptions = options ?? Options();
    var response = await dio.delete(path,
        data: data,
        queryParameters: params,
        options: requestOptions,
        cancelToken: cancelToken ?? _cancelToken);
    return response.data;
  }

  /// http post form 表单提交操作
  Future postForm(
    String path, {
    Map<String, dynamic>? params,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    Options requestOptions = options ?? Options();
    var data = FormData.fromMap(params!);
    var response = await dio.post(path,
        data: data,
        options: requestOptions,
        cancelToken: cancelToken ?? _cancelToken);
    return response.data;
  }
}
```

### interceptor

use connectivity_plus

```dart
final logger = RbLog;

class ConnectsInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    super.onRequest(options, handler);
    _request();
  }

  _request() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      //  connected to a mobile network.
    } else if (connectivityResult == ConnectivityResult.wifi) {
      //  connected to a wifi network.
    } else {
      logger.e('没有网络');
      // 错误弹窗
    }
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {

    super.onError(err, handler);
  }
}
```

## Mixin

### VisibilityStateMixin

Monitor whether the widget is rendered.

```dart
enum VisibilityState { hide, show }

mixin WidgetVisibilityStateMixin<T extends StatefulWidget> on State<T>
    implements WidgetsBindingObserver {
  late FocusNode _ownFocusNode, _oldFocusNode, _newFocusNode;
  VisibilityState visibilityState = VisibilityState.hide;

  ///忽略的焦点列表
  List<FocusNode> _ignoreFocusList = [];
  List<FocusNode> get ignoreFocusList => _ignoreFocusList;
  set ignoreFocusList(List<FocusNode> list) => _ignoreFocusList = list;

  ///显示
  void onShow() {
    visibilityState = VisibilityState.show;
  }

  ///隐藏
  void onHide() {
    visibilityState = VisibilityState.hide;
  }

  _addFocusNodeChangeCb() {
    _ownFocusNode =
        _oldFocusNode = _newFocusNode = FocusManager.instance.primaryFocus!;
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPersistentFrameCallback(focusNodeChangeCb);
    onShow();
  }

  ///焦点判断
  void focusNodeChangeCb(_) {
    _newFocusNode = FocusManager.instance.primaryFocus!;
    if (_newFocusNode == _oldFocusNode) return;
    _oldFocusNode = _newFocusNode;

    if (_judgeNeedIgnore(_newFocusNode)) return;
    if (_newFocusNode == _ownFocusNode) {
      ///显示
      if (visibilityState != VisibilityState.show) {
        onShow();
      }
    } else {
      ///不显示
      if (visibilityState != VisibilityState.hide) {
        onHide();
      }
    }
  }

  ///忽略焦点值
  bool _judgeNeedIgnore(focusNode) {
    return _ignoreFocusList.contains(focusNode);
  }

  @override
  void initState() {
    super.initState();
    Future(_addFocusNodeChangeCb);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
```

# hyper app

use webview_flutter library

```dart
import 'package:webview_flutter/webview_flutter.dart';

const htmlString = '''
<!DOCTYPE html>
...
<script>
    const resizeObserver = new ResizeObserver(entries =>
          Report.postMessage(document.scrollingElement.scrollHeight))
    resizeObserver.observe(document.body)
</script>
</body>
</html>
''';

class WebviewDemo extends StatefulWidget {
  const WebviewDemo({super.key});

  @override
  State<WebviewDemo> createState() => _MyWebViewState();
}

class _MyWebViewState extends State<WebviewDemo> {
  late final WebViewController controller;
  double height = 0;
  @override
  void initState() {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..addJavaScriptChannel('Report', onMessageReceived: (message) {
        setState(() {
          height = double.parse(message.message);
        });
      })
      ..loadHtmlString(htmlString);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: height, child: WebViewWidget(controller: controller)),
      ],
    );
  }
}
```

## WebViewController

<https://pub.flutter-io.cn/documentation/webview_flutter/latest/webview_flutter/WebViewController-class.html>

### setJavaScriptMode(JavaScriptMode.unrestricted)

By default, javascript is disabled. We must manually enable `setJavaScriptMode(JavaScriptMode.unrestricted)`, otherwise most web pages will be unusable.

### setBackgroundColor(const Color(0x00000000))

### setNavigationDelegate

```dart
controller = WebViewController()
  ..setJavaScriptMode(JavaScriptMode.unrestricted)
  ..setBackgroundColor(const Color(0x00000000))
  ..setNavigationDelegate(
    NavigationDelegate(
      onProgress: (int progress) {
        // Update loading bar.
      },
      onPageStarted: (String url) {},
      onPageFinished: (String url) {},
      onWebResourceError: (WebResourceError error) {},
      onNavigationRequest: (NavigationRequest request) {
        if (request.url.startsWith('https://www.youtube.com/')) {
          return NavigationDecision.prevent;
        }
        return NavigationDecision.navigate;
      },
    ),
  )
  ..loadRequest(Uri.parse('https://flutter.cn'));
```

### addJavaScriptChannel

Adds a new JavaScript channel to the set of enabled channels.
<https://pub.flutter-io.cn/documentation/webview_flutter/latest/webview_flutter/WebViewController/addJavaScriptChannel.html>

```js
<script>  
// 必须放在body中     
const resizeObserver = new ResizeObserver(entries =>  
          Report.postMessage(document.scrollingElement.scrollHeight))    
resizeObserver.observe(document.body)
</script>
```

```dart
..addJavaScriptChannel('Report', onMessageReceived: (message) {
        setState(() {
          height = double.parse(message.message);
        });
})
```

Adds a new JavaScript channel to the set of enabled channels.
The JavaScript code can then call `postMessage` on that object to send a message that will be passed to `onMessageReceived`.
For example, after adding the following JavaScript channel:

```dart
final WebViewController controller = WebViewController();
controller.addJavaScriptChannel(
  name: 'Print',
  onMessageReceived: (JavascriptMessage message) {
    print(message.message);
  },
);
```

### loadRequest(Uri.parse('<https://google.com>')

### loadHtmlString(htmlString)

## JS invoke dart

### option:javascriptChannels

The javascriptChannels method is also recommended, mainly for JS to pass data to Flutter. For example, there is the following JS code.

```javascript
<button onclick="callFlutter()" callFlutter</button 
function callFlutter(){
 Toast.postMessage("JS调用了Flutter"); 
}
```

Use postMessage method. Toast is a predefined name. When receiving, we need to use this name to receive. The Flutter side code is as follows.

```javascript
WebView(
  javascriptChannels: <JavascriptChannel [ 
  _alertJavascriptChannel(context),
 ].toSet(),
)

JavascriptChannel _alertJavascriptChannel(BuildContext context) {
 return JavascriptChannel(
  name: 'Toast',
  onMessageReceived: (JavascriptMessage message) {
  showToast(message.message);
  });
}
```

### onNavigationRequest

### Develop own JSBridge

(JSBridge can be developed and a common set of specifications can be established. First, it is necessary to agree on a protocol with the [H5 development](https://cloud.tencent.com/solution/ai-creativemarketing?from=10680) to create the Model.)

```javascript
class JsBridge {
 String method; // 方法名
 Map data; // 传递数据
 Function success; // 执行成功回调
 Function error; // 执行失败回调

 JsBridge(this.method, this.data, this.success, this.error);

 /// jsonEncode方法中会调用实体类的这个方法。如果实体类中没有这个方法，会报错。
 Map toJson() {
 Map map = new Map();
 map["method"] = this.method;
 map["data"] = this.data;
 map["success"] = this.success;
 map["error"] = this.error;
 return map;
 }

 static JsBridge fromMap(Map<String, dynamic  map) {
 JsBridge jsonModel = new JsBridge(map['method'], map['data'], map['success'], map['error']);
 return jsonModel;
 }

 @override
 String toString() {
 return "JsBridge: {method: $method, data: $data, success: $success, error: $error}";
 }
}
```

The received H5 methods are then processed internally.

## dart invoke js

controller.runJavascript
`js code example`

```js
function callJS(message){
 document.getElementById("p1").style.visibility = message;
}
```

`dart code example`

```dart
Future<void> evaluateJavascript() async {
  print('evaluateJavascript');
  _controller.runJavascript('callJS('visible');');
}
```

## WebView size

### web page reports its own height

Add js code to htmlString

```html
<body>
<div class="content"> web page</div>
<script>
    const resizeObserver = new ResizeObserver(entries =>
          Report.postMessage(document.scrollingElement.scrollHeight))
    resizeObserver.observe(document.body)
</script>
</body>
```

> If the WebView doesn't support ResizeObserver we can just call Report.postMessage(document.scrollingElement.scrollHeight)) at the right time.

In the dart code, do the following

1. add a variable height with an initial value of 0
2. add ScriptChannel, note that the name and the name of the previous script must be the same, in this case the name is `Report`
3. Replace Expanded with SizedBox to limit the height of the WebViewWidget.

```dart
class _MyWebViewState extends State<MyWebView> {
  late final WebViewController controller;
  double height = 0;
  @override
  void initState() {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..addJavaScriptChannel('Report', onMessageReceived: (message) {
        setState(() {
          height = double.parse(message.message);
        });
      })
      ..loadHtmlString(htmlString);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: height, child: WebViewWidget(controller: controller)),

      ],
    );
  }
}
```

Change the style of the body in the html code from height:100px to `height:200px`, re-run the code , and the SizedBox becomes 200px.

### if not be able to modify a page: injecting js

If the height of the page is only determined by static css, we can simply add a small delay to get the height directly.

```dart
controller.setNavigationDelegate(NavigationDelegate(
        onPageFinished: (url) async {
          await Future.delayed(Duration(milliseconds: 50));
          var message = await controller.runJavaScriptReturningResult(
              'document.scrollingElement.scrollHeight');
          setState(() {
            height =double.parse(message.toString());
          });
        },
 ));
```

If the page is loaded and then js makes changes to the page, it's hard to predict how long it will take. js can change the page at any time, resulting in a change in height, so the only way to keep track of the page's height is to rely on a listener. If the webview doesn't support ResizeObserver, we can also use setInterval.

```dart
 void initState() {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..addJavaScriptChannel('Report', onMessageReceived: (message) {
         var msgHeight = double.parse(message.message);
         setState(() {
           height = msgHeight;
         });
      })
      ..setNavigationDelegate(NavigationDelegate(
        onPageFinished: (url) async {
          // 注入 js
          controller.runJavaScript(
              '''const resizeObserver = new ResizeObserver(entries =>
          Report.postMessage(document.scrollingElement.scrollHeight))
    resizeObserver.observe(document.body)''');
        },
      ))
      ..loadHtmlString(htmlString);
    super.initState();
  }
```

We must wait until the page has finished loading before injecting the js

## onNavigationRequest:Intercept url in html

```javascript
navigationDelegate: (NavigationRequest request) {
 if (request.url.startsWith('js://webview')) { 
  showToast('JS调用了Flutter By navigationDelegate'); 
  Navigator.push(context,
   new MaterialPageRoute(builder: (context) =  new testNav()));
  return NavigationDecision.prevent;
 }
 return NavigationDecision.navigate; //必须有
},
```

NavigationDecision.prevent means prevent route substitution, NavigationDecision.navigate means allow route substitution.
If the url ends in /flutter, jump to the corresponding native page. Otherwise, the original request continues.

```dart
onNavigationRequest: (request) {
   if (request.url.endsWith('/flutter')) {
     // 跳到原生页面
     return NavigationDecision.prevent;
   } else {
     // 继续原来的请求
     return NavigationDecision.navigate;
   }
 },
```

Use A tag `<a href='/ios'> Jump to the Flutter page</a>`
Use js to jump window.location.href='complete page address'
The address redirected by js must be a complete page address.
It can be written like this

1. `https://google.com`
2. `aa:/bb`
   The schema can be customized, but it cannot be absent. This is invalid /flutter

### js calls the methods defined by JavaScriptChannel

Start by defining the channel object for the jump as `Jump`.

```dart
  void initState() {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..addJavaScriptChannel('Jump', onMessageReceived: (message) {
          //根据 message 信息跳转
      })
      ..loadHtmlString(htmlString);

    super.initState();
  }
```

Execute `Jump.postMessage('video');` on the page.
In fact, when flutter gets the message from the page, it can jump to the flutter page and perform other functions, such as calling the camera.

# layout

## /core/common

### /error

### /http

wrap dio library

### /log

### /mixin

## /core/models

data model layer

## /core/providers

ViewModel layer

## /core/repos

The repo layer of data.
Including network data and local cache data.
