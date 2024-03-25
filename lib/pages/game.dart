import 'package:flutter/material.dart';

class Game extends StatefulWidget {
  const Game({Key? key}) : super(key: key);

  @override
  GameState createState() => GameState();
}

class GameState extends State<Game> {
  String lastInput = 'Entrez un nombre dans le champ ci-dessous!';
  String currentInput = '';
  int mysteryNumber = 42;
  int? lastTooHigh;
  int? lastTooLow;
  int baseAttempts = 10;
  int attempts = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              lastInput,
              style: const TextStyle(fontSize: 24),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                lastTooLow != null
                    ? '$lastTooLow <'
                    : ' ? < ',
                style: const TextStyle(fontSize: 24),
              ),
              const SizedBox(width: 10),
              SizedBox(
                width: 60,
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      currentInput = value;
                    });
                  },
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Text(
                lastTooHigh != null
                    ? '< $lastTooHigh'
                    : '< ?',
                style: const TextStyle(fontSize: 24),
              ),
            ],
          ),
          Text(
            'Il vous reste $attempts essais',
            style: const TextStyle(fontSize: 24),
          ),
          ElevatedButton(
            onPressed: handleButtonPress,
            child: const Text(
            'Confirmer le nombre',
            style: TextStyle(fontSize: 24),
            )
          )
        ],
      ),
    );
  }

  void handleButtonPress() {
    setState(() {
      if(currentInput.isEmpty) {
        lastInput = 'Veuillez entrer un nombre!';
        return;
      }
      int? guess = int.tryParse(currentInput);
      if (guess == null) {
        lastInput = 'Veuillez entrer un nombre valide!';
        return;
      }
      if (guess == mysteryNumber) {
        lastInput = 'Bravo, vous avez trouvé le nombre mystère! C\'était bien $mysteryNumber, vous avez pris ${baseAttempts - attempts + 1} essais';
        lastTooLow = null;
        lastTooHigh = null;
      } else {
        if (guess < mysteryNumber) {
          if (lastTooLow == null || guess > lastTooLow!) {
            lastTooLow = guess;
          }
          lastInput = 'Le nombre mystère est plus grand que $currentInput';
        } else {
          if (lastTooHigh == null || guess < lastTooHigh!) {
            lastTooHigh = guess;
          }
          lastInput = 'Le nombre mystère est plus petit que $currentInput';
        }
        currentInput = '';
        attempts--;
        if (attempts == 0) {
          lastInput = 'Vous avez perdu! Le nombre mystère était $mysteryNumber';
        }
      }
    });
  }
}
