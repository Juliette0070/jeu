import 'package:flutter/material.dart';
import '../../mytheme.dart';

class Play extends StatelessWidget {
  const Play({super.key});

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
                  Text("Page de jeu!")
                ],
              ),
            )
        )
    );
  }
}