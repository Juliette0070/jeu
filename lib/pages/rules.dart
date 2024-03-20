import 'package:flutter/material.dart';
import '../../mytheme.dart';

class Rules extends StatelessWidget {
  const Rules({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: MyTheme.dark(),
        title: "Nombre mystère",
        home: const Scaffold(
            body: Center(
                child: Text(
                    "Page des règles!"
                )
            )
        )
    );
  }
}