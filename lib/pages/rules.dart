import 'package:flutter/material.dart';
import '../../mytheme.dart';

class Rules extends StatelessWidget {
  const Rules({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return MaterialApp(
        theme: MyTheme.dark(),
        title: "Nombre mystère",
        home: Scaffold(
            body: Center(
                child: ListView(
                  padding: const EdgeInsets.all(8),
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(vertical: screenHeight * 0.05, horizontal: screenWidth * 0.05),
                      child: Text(
                        "I - Le but du jeu est de trouver le nombre mystère en un nombre de d'essais limité.",
                        style: MyTheme.darkTextTheme.displayMedium,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: screenHeight * 0.05, horizontal: screenWidth * 0.05),
                      child: Text(
                        "II - A chaque essai, le jeu vous indique si le nombre mystère est plus grand ou plus petit que votre proposition.",
                        style: MyTheme.darkTextTheme.displayMedium,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: screenHeight * 0.05, horizontal: screenWidth * 0.05),
                      child: Text(
                        "III - Si vous réussissez à trouver le nombre mystère, vous passez au niveau suivant.",
                        style: MyTheme.darkTextTheme.displayMedium,
                      ),
                    ),
                  ],
                )
            )
        )
    );
  }
}