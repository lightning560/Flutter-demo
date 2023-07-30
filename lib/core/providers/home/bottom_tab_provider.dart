import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bottom_tab_provider.g.dart';

@riverpod
class BottomTabIndex extends _$BottomTabIndex {
  @override
  int build() {
    return 0;
  }

  void setIndex(int idx) {
    state = idx;
  }
}
