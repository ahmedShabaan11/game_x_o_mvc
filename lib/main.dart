import 'package:flutter/material.dart';
import 'package:game_x_o/screen/home-screen.dart';
import 'package:game_x_o/screen/named_player_screen.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "NamedScreen",
      routes: {
        NamedScreen.namedScreen: (context) {
          return NamedScreen();
        },
        HomeScreen.homeScreen:(context)
        {
          return  HomeScreen();
        }
      },
    );
  }
}
