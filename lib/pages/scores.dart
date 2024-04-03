import 'package:flutter/material.dart';
import '../../mytheme.dart';
import 'package:jeu/modele/nombre_mystere.dart';
import 'package:jeu/modele/sharedPref.dart';

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
                child: FutureBuilder<Set<String>>(
                  future: getAllKeys(),
                  builder: (BuildContext context, AsyncSnapshot<Set<String>> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: snapshot.data?.map((key) {
                          return FutureBuilder<Map<String, int>>(
                            future: loadScore(key),
                            builder: (BuildContext context, AsyncSnapshot<Map<String, int>> scoreSnapshot) {
                              if (scoreSnapshot.connectionState == ConnectionState.waiting) {
                                return const CircularProgressIndicator();
                              } else if (scoreSnapshot.hasError) {
                                return Text('Error: ${scoreSnapshot.error}');
                              } else {
                                return Text(
                                  "$key: ${scoreSnapshot.data?['score']} (Niveau ${scoreSnapshot.data?['level']})",
                                  style: const TextStyle(fontSize: 24),
                                );
                              }
                            },
                          );
                        }).toList() ?? [],
                      );
                    }
                  },
                )
            )
        )
    );
  }
}