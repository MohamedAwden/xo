import 'package:flutter/material.dart';
import 'package:xogame/game_board.dart';
import 'package:xogame/welcome_page.dart';

void main() {
  runApp(const xoApp());
}

class xoApp extends StatelessWidget {
  const xoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        GameBoard.routeName : (_) => GameBoard(),
        WelcomePage.routeName: (_) => WelcomePage(),
      },
      initialRoute:WelcomePage.routeName  ,
    );
  }
}
