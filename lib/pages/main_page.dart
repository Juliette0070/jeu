import 'package:flutter/material.dart';
import 'package:jeu/modele/nombre_mystere.dart';
import 'package:jeu/pages/play.dart';
import 'package:jeu/pages/scores.dart';
import 'package:jeu/pages/rules.dart';
import 'package:jeu/mytheme.dart';

class MainPage extends StatefulWidget{
  const MainPage({super.key});

  @override
  Home createState()=> Home();
}

class Home extends State<MainPage>{
  Home();
  NombreMystere nm = NombreMystere();

  int _currentScreen = 0;

  @override
  Widget build(BuildContext context) {
    Widget child = Container();

    switch(_currentScreen){
      case 0:
        child = Play(nm: nm);
        break;
      case 1:
        child = Scores(nm: nm);
        break;
      case 2:
        child = const Rules();
        break;
    }

    return MaterialApp(
        theme: MyTheme.dark(),
        title: "Nombre mystère",
        home: Scaffold(
          appBar: AppBar(
              title: const Text("Nombre mystère"),
              titleTextStyle: MyTheme.darkTextTheme.displayLarge
          ),
          backgroundColor: Colors.black,
          bottomNavigationBar: _getNavBar(),
          body: SizedBox.expand(child: child),
        )
    );
  }

  Widget _getNavBar(){
    return BottomNavigationBar(
      currentIndex: _currentScreen,
      onTap: (int index) => setState(() => _currentScreen = index),
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.play_arrow),
          label: 'Play',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.leaderboard),
          label: 'Scores',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.book),
          label: 'Rules',
        ),
      ],
    );
  }
}