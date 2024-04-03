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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'Scoreboard',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      child: FutureBuilder<List<String>>(
                        future: getAllKeys(),
                        builder: (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return CircularProgressIndicator();
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else {
                            if (snapshot.data?.isEmpty ?? true) {
                              return Center(child: Text('Jouez pour ajouter un score!'));
                            } else {
                              return Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: snapshot.data?.map((key) {
                                    return FutureBuilder<List<Map<String, int>>>(
                                      future: loadScores(key),
                                      builder: (BuildContext context, AsyncSnapshot<List<Map<String, int>>> scoreSnapshot) {
                                        if (scoreSnapshot.connectionState == ConnectionState.waiting) {
                                          return CircularProgressIndicator();
                                        } else if (scoreSnapshot.hasError) {
                                          return Text('Error: ${scoreSnapshot.error}');
                                        } else {
                                          return Column(
                                            children: scoreSnapshot.data?.map((scoreAndLevel) {
                                              return Text(
                                                "$key: ${scoreAndLevel['score'].toString()} (Niveau ${scoreAndLevel['level'].toString()})",
                                                style: const TextStyle(fontSize: 24),
                                              );
                                            }).toList() ?? [],
                                          );
                                        }
                                      },
                                    );
                                  }).toList() ?? [],
                                ),
                              );
                            }
                          }
                        },
                      ),
                    ),
                  ],
                )
            )
        )
    );
  }
}