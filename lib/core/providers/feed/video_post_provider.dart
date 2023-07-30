import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'video_post_provider.g.dart';

@riverpod
class CurrVideoPageView extends _$CurrVideoPageView {
  @override
  int build() => 0;
  void increment() => state = state + 1;
  void setCurr(idx) => state = idx;
}
