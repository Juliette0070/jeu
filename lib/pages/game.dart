import 'package:flutter/material.dart';
import 'package:jeu/modele/nombre_mystere.dart';

class Game extends StatefulWidget {
  const Game({super.key, required this.nm});

  final NombreMystere nm;

  @override
  GameState createState() => GameState();
}

class GameState extends State<Game> {
  String lastInput = 'Entrez un nombre dans le champ ci-dessous!';
  String currentInput = '';
  TextEditingController _controller = TextEditingController();

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
              Text('${widget.nm.tentativeBasse} <',
                style: const TextStyle(fontSize: 24),
              ),
              const SizedBox(width: 10),
              SizedBox(
                width: 60,
                child: TextField(
                  controller: _controller,
                  onChanged: (value) {
                    setState(() {
                      currentInput = value;
                    });
                  },
                  onSubmitted: (_) {
                    handleButtonPress();
                    _controller.clear();
                  },
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Text('< ${widget.nm.tentativeHaute}',
                style: const TextStyle(fontSize: 24),
              ),
            ],
          ),
          Text(
            'Il vous reste ${widget.nm.nbTentativesMaxNiveau - widget.nm.nbEssaisNiveau} essais',
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
      if (guess < widget.nm.tentativeBasse || guess > widget.nm.tentativeHaute) {
        lastInput = 'Le nombre doit être compris entre ${widget.nm.tentativeBasse} et ${widget.nm.tentativeHaute}!';
        return;
      }
      if (guess == widget.nm.nombreMystere) {
        lastInput = 'Bravo, vous avez trouvé le nombre mystère! C\'était bien ${widget.nm.nombreMystere}, vous avez pris ${widget.nm.nbEssaisNiveau + 1}/${widget.nm.nbTentativesMaxNiveau} essais';
        widget.nm.nextLevel();
      } else {
        if (guess < widget.nm.nombreMystere) {
          if (guess > widget.nm.tentativeBasse) {
            widget.nm.tentativeBasse = guess;
          }
          lastInput = 'Le nombre mystère est plus grand que $currentInput';
        } else {
          if (guess < widget.nm.tentativeHaute) {
            widget.nm.tentativeHaute = guess;
          }
          lastInput = 'Le nombre mystère est plus petit que $currentInput';
        }
        widget.nm.nbEssaisNiveau++;
        if (widget.nm.nbEssaisNiveau == widget.nm.nbTentativesMaxNiveau) {
          lastInput = 'Vous avez perdu! Le nombre mystère était ${widget.nm.nombreMystere}';
        }
      }
      currentInput = '';
      _controller.clear();
    });
  }
}
