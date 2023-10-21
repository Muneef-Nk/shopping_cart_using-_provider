import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_card_using_provider/controller/details_screen_controller.dart';

// import 'controller/card_screen_controller.dart';
import 'view/screens/homescreen/homescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DetailsScreenController()),
        // ChangeNotifierProvider(create: (context) => CardScreenController())
        ChangeNotifierProxyProvider(
            create: (context) => CardScreenController(), update: update)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
