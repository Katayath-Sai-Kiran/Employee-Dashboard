import 'package:flutter/cupertino.dart';

class IndexProvider extends ChangeNotifier {
  int currentIndex = 0;
  void updateCurrentIndex({required int updatedIndex}) {
    currentIndex = updatedIndex;
    notifyListeners();
  }
}
