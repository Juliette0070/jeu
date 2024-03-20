import 'package:flutter/material.dart';
import '../../mytheme.dart';

class Play extends StatelessWidget {
  const Play({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: MyTheme.dark(),
        title: "SAE Mobile",
        home: const Scaffold(
            body: Center(
                child: Text(
                    "Page de jeu!"
                )
            )
        )
    );
  }
}