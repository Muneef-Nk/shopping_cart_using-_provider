import 'package:flutter/material.dart';
import 'package:shopping_card_using_provider/model/card_model.dart';
import 'package:shopping_card_using_provider/model/product_model.dart';

class ProductCardController with ChangeNotifier {
  late int price;
  int? total;
  int itemCount = 1;
  List<CardModel> card = [];

  void add() {
    if (itemCount < 10) {
      itemCount++;
    }
    notifyListeners();
  }

  void remove() {
    if (itemCount > 1) {
      itemCount--;
    }
    notifyListeners();
  }

  void reset() {
    itemCount = 1;
    notifyListeners();
  }

  int totalPrice(int index) {
    return total = product[index].price * itemCount;
  }

  void addCard(CardModel cardModel) {
    card.add(cardModel);
    notifyListeners();
  }

  addTotal(int index) {
    if (card[index].itemCount < 10) {
      card[index].itemCount++;
      card[index].total = card[index].total + card[index].price;
    }
    notifyListeners();
  }

  void removeCard(int index) {
    card.removeAt(index);
    notifyListeners();
  }

  removeTotal(int index) {
    if (card[index].itemCount > 1) {
      card[index].itemCount--;
      card[index].total = card[index].total - card[index].price;
    }
    notifyListeners();
  }
}
