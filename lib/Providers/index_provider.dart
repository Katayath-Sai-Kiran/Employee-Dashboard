import 'package:flutter/cupertino.dart';

class IndexProvider extends ChangeNotifier {
  int currentIndex = 1;
  void updateCurrentIndex({required int updatedIndex}) {
    currentIndex = updatedIndex;
    notifyListeners();
  }
}
