import 'package:fifaPlayers/services/repository.dart';
import 'package:fifaPlayers/ui/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  PlayerRepository _repository = PlayerRepository();

  runApp(MyApp(
    playerRepository: _repository,
  ));
}

class MyApp extends StatelessWidget {
  final PlayerRepository playerRepository;

  MyApp({this.playerRepository});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          canvasColor: Colors.white,
          appBarTheme: AppBarTheme(
              elevation: 0.0,
              color: Colors.white,
              iconTheme: IconThemeData(color: Colors.black, size: 30))),
      home: HomeScreen(playerRepository: playerRepository),
    );
  }
}
