import 'dart:math';

class NombreMystere {
  int nombreMystere = 0;
  int nbTentativesMaxNiveau = 0;
  int nbEssaisNiveau = 0;
  int niveau = 0;
  int score = 0;
  int tentativeBasse = 0;
  int tentativeHaute = 0;
  static Map<int, List<int>> niveaux = {
    1: [10, 5],
    2: [20, 6],
    3: [40, 6],
    4: [80, 7],
    5: [160, 7],
    6: [320, 8],
    7: [640, 8],
    8: [1280, 8],
  };

  void initNiveau(int niv) {
    int nbTent = 0;
    int nbMyst = 0;
    int tentH = 0;
    if (niveaux.containsKey(niv)){
      nbTent = niveaux[niv]![1];
      tentH = niveaux[niv]![0];
      nbMyst = Random().nextInt(tentH);
    } else {
      nbTent = niv;
      tentH = 10*2^niv;
      nbMyst = Random().nextInt(tentH);
    }
    nombreMystere = nbMyst;
    nbTentativesMaxNiveau = nbTent;
    niveau = niv;
    tentativeHaute = tentH;
    nbEssaisNiveau = 0;
  }

  void nextLevel() {
    score += (nbTentativesMaxNiveau - nbEssaisNiveau) * niveaux[niveau]![0];
    niveau++;
    initNiveau(niveau);
  }

  void incrementerEssais() {
    nbEssaisNiveau++;
  }

  int nombre() {
    return nombreMystere;
  }

  int tentativesMax() {
    return nbTentativesMaxNiveau;
  }

  int essais() {
    return nbEssaisNiveau;
  }

  int niveauActuel() {
    return niveau;
  }

  int scoreActuel() {
    return score;
  }

  int tentativeBasseActuelle() {
    return tentativeBasse;
  }

  int tentativeHauteActuelle() {
    return tentativeHaute;
  }

  bool estTrouve(int nb) {
    return nb == nombreMystere;
  }

  bool estPerdu() {
    return nbEssaisNiveau >= nbTentativesMaxNiveau;
  }

  void setTentativeBasse(int nb) {
    tentativeBasse = nb;
  }

  void setTentativeHaute(int nb) {
    tentativeHaute = nb;
  }

  void tryNumber(int nb) {
    if (nb < nombreMystere) {
      setTentativeBasse(nb);
    } else {
      setTentativeHaute(nb);
    } incrementerEssais();
  }
}