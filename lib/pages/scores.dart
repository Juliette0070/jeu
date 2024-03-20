import 'package:flutter/material.dart';
import '../../mytheme.dart';

class Scores extends StatelessWidget {
  const Scores({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: MyTheme.dark(),
        title: "Nombre mystère",
        home: const Scaffold(
            body: Center(
                child: Text(
                    "Page des scores!"
                )
            )
        )
    );
  }
}