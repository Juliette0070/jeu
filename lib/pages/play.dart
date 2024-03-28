import 'package:flutter/material.dart';
import 'package:jeu/modele/nombre_mystere.dart';
import '../../mytheme.dart';
import 'package:jeu/pages/game.dart';

class Play extends StatefulWidget {
  const Play({super.key, required this.nm});
  final NombreMystere nm;

  @override
  State<Play> createState() => _PlayState();
}

class _PlayState extends State<Play> {
  static bool isGameScreenVisible = false;

  @override
  Widget build(BuildContext context) {
    return isGameScreenVisible
        ? Game(nm: widget.nm)
        : WidgetLancerJeu(
          onPlayPressed: () {
            setState(() {
              isGameScreenVisible = true;
            });
          },
    );
  }
}

class WidgetLancerJeu extends StatelessWidget {
  final VoidCallback onPlayPressed;

  const WidgetLancerJeu({Key? key, required this.onPlayPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: MyTheme.dark(),
        title: "Nombre mystère",
        home: Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset('assets/images/nombreMystere.jpg'),
                  const Text("Page de jeu!"),
                  ElevatedButton(
                    onPressed: onPlayPressed,
                    child: const Text('Jouer'),
                  ),
                ],
              ),
            )
        )
    );
  }
}