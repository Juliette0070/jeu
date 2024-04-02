import 'package:flutter/material.dart';
import 'package:jeu/modele/nombre_mystere.dart';
import '../../mytheme.dart';
import 'package:jeu/pages/game.dart';

class Play extends StatefulWidget {
  const Play({super.key, required this.nm});
  final NombreMystere nm;

  @override
  State<Play> createState() => PlayState();
}

class PlayState extends State<Play> {
  static bool isGameScreenVisible = false;
  late final TextEditingController _pseudoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return isGameScreenVisible
        ? Game(
            nm: widget.nm,
            onEndGame: () {
              setState(() {
                isGameScreenVisible = false;
                widget.nm.initNiveau(1);
              });
            },
            onLeaveGame: () {
              setState(() {
                isGameScreenVisible = false;
              });
            },
          )
        : WidgetLancerJeu(
          pseudoController: _pseudoController,
          onPlayPressed: () {
            setState(() {
              widget.nm.initNiveau(1);
              widget.nm.enregistrerScore();
              widget.nm.pseudo = _pseudoController.text.isNotEmpty
                  ? _pseudoController.text
                  : 'Anonyme';
              isGameScreenVisible = true;
            });
          },
          onContinuerPressed: () {
            setState(() {
              widget.nm.pseudo = _pseudoController.text.isNotEmpty
                  ? _pseudoController.text
                  : 'Anonyme';
              isGameScreenVisible = true;
            });
          },
          onDernierPressed: () {
            setState(() {
              widget.nm.initNiveau(widget.nm.niveau);
              widget.nm.enregistrerScore();
              widget.nm.pseudo = _pseudoController.text.isNotEmpty
                  ? _pseudoController.text
                  : 'Anonyme';
              isGameScreenVisible = true;
            });
          },
      );
  }
}

class WidgetLancerJeu extends StatelessWidget {
  final TextEditingController pseudoController;
  final VoidCallback onPlayPressed;
  final VoidCallback onContinuerPressed;
  final VoidCallback onDernierPressed;

  const WidgetLancerJeu({Key? key, required this.pseudoController,
    required this.onPlayPressed, required this.onContinuerPressed,
    required this.onDernierPressed}) : super(key: key);

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
                  const SizedBox(height: 20),
                  TextField(
                    controller: pseudoController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Entrez votre pseudo',
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: onPlayPressed,
                        child: const Text('Jouer'),
                      ),
                      ElevatedButton(
                        onPressed: onContinuerPressed,
                        child: const Text('Continuer'),
                      ),
                      ElevatedButton(
                        onPressed: onDernierPressed,
                        child: const Text('Dernier niveau'),
                      ),
                    ],
                  ),
                ],
              ),
            )
        )
    );
  }
}