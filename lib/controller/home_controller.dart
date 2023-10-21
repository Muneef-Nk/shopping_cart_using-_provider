import 'package:flutter/material.dart';
import 'package:shopping_card_using_provider/view/add_to_card/add_to_card.dart';
import 'package:shopping_card_using_provider/view/saved_product_screen/saved.dart';
import 'package:shopping_card_using_provider/view/screens/homescreen/homescreen.dart';

class HomeScreenController with ChangeNotifier {
  int currentIndex = 0;
  int currentCategoryIndex = 0;
  bool isSelectTitle = false;
  List label = ["All", "Men", "Women", "Kids"];

  List<Widget> pages = [
    HomeScreen(),
    SavedProduct(),
    AddtoCard(),
    Center(child: Text("setting"))
  ];

  changeBottomBar(int index) {
    currentIndex = index;
    notifyListeners();
  }

  changeCategory(int index) {
    currentCategoryIndex = index;
    notifyListeners();
  }
}
