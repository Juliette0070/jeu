import 'package:flutter/material.dart';
import '../../mytheme.dart';
import 'package:jeu/modele/nombre_mystere.dart';

class Scores extends StatelessWidget {
  const Scores({super.key, required this.nm});

  final NombreMystere nm;

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
                      const Text(
                          "Scores:",
                          style: TextStyle(fontSize: 30)
                      ),
                      for (var score in nm.scores)
                        Text(
                            "${score['pseudo']} : ${score['scoreTotal']} (lvl ${score['niveau']})",
                            style: const TextStyle(fontSize: 24)
                        ),
                      if (nm.scores.isEmpty)
                        const Text(
                            "Aucun score pour le moment",
                            style: TextStyle(fontSize: 24)
                        )
                    ]
                )
            )
        )
    );
  }
}