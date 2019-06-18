import 'package:flutter/material.dart';
import 'package:gato_multiplayer/screens/home/home.dart';
import 'package:gato_multiplayer/screens/game/game.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gato Multiplayer',
      routes: {
        '/PlayGamePage': (context) => PlayGamePage(),
        '/SignInPage': (context) => SignInPage(),
        '/ChooseGameMode': (context) => ChooseGameMode(),
        '/PlayGameMultiPage': (context) => PlayGameMultiPage(),
      },
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: SignInPage(),
    );
  }
}
