import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:shopping_card_using_provider/controller/home_controller.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    var providerBottom = Provider.of<HomeScreenController>(context);

    return Scaffold(
      body: providerBottom.pages[providerBottom.currentIndex],
      bottomNavigationBar: SalomonBottomBar(
          currentIndex: providerBottom.currentIndex,
          onTap: (i) {
            providerBottom.changeBottomBar(i);
          },
          items: [
            SalomonBottomBarItem(
              icon: Icon(Icons.home),
              title: Text("Home"),
              selectedColor: Colors.purple,
            ),
            SalomonBottomBarItem(
              icon: Icon(Icons.favorite_outline),
              title: Text("Saved"),
              selectedColor: Colors.pink,
            ),
            SalomonBottomBarItem(
              icon: Icon(Icons.shopping_bag_outlined),
              title: Text("Card"),
              selectedColor: Colors.orange,
            ),
            SalomonBottomBarItem(
              icon: Icon(Icons.settings),
              title: Text("Settings"),
              selectedColor: Colors.green,
            ),
          ]),
    );
  }
}
