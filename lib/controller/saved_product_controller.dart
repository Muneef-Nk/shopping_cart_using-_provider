import 'package:flutter/material.dart';

class SavedProductController with ChangeNotifier {
  bool isFovorite = false;
  List favorite = [];

  addSaved(int index) {
    final isExist = favorite.contains(index);
    if (isExist) {
      //remove
      favorite.removeAt(index);
    } else {
      //add
      favorite.add(index);
    }

    notifyListeners();
  }

  bool isExist(int index) {
    final isExist = favorite.contains(index);
    print(isExist);
    return isExist;
  }

  removeSaved(int index) {
    favorite.removeAt(index);
    notifyListeners();
  }

  bool checkFevorite(int index) {
    if (favorite.contains(index)) {
      return isFovorite = true;
    } else {
      return isFovorite = false;
    }
  }
}
