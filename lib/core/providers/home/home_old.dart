import 'package:flutter/foundation.dart';

/// Mix-in [DiagnosticableTreeMixin] to have access to [debugFillProperties] for the devtool
// ignore: prefer_mixin
class HomeViewModel with ChangeNotifier, DiagnosticableTreeMixin {
  int _count = 0;
  int _bottomNavigationIndex = 0;
  int _homeTabIndex = 1;

  int get count => _count;
  int get bottomNavigationIndex => _bottomNavigationIndex;
  int get homeTabIndex => _homeTabIndex;

  void increment() {
    _count++;
    notifyListeners();
  }

  void setBottomNavigationIndex(int i) {
    _bottomNavigationIndex = i;
    print(_bottomNavigationIndex);
    notifyListeners();
  }


  /// Makes `Counter` readable inside the devtools by listing all of its properties
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IntProperty('count', count));
    properties.add(IntProperty('bottomNavigationIndex', bottomNavigationIndex));
    properties.add(IntProperty("homeTabIndex", homeTabIndex));
  }
}