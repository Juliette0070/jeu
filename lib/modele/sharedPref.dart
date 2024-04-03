import 'package:shared_preferences/shared_preferences.dart';

// To save scores
Future<void> saveScore(String key, int score, int level) async {
  final prefs = await SharedPreferences.getInstance();
  List<String> scoreAndLevelList = prefs.getStringList(key) ?? [];

  String newScoreAndLevelString = '$score,$level';
  scoreAndLevelList.add(newScoreAndLevelString);

  prefs.setStringList(key, scoreAndLevelList);
}

// To get the maximum level reached
Future<int> getMaxLevel() async {
  final prefs = await SharedPreferences.getInstance();
  int maxLevel = prefs.getInt('maxLevel') ?? 1;
  return maxLevel;
}

// To save the maximum level reached
Future<void> saveMaxLevel(int level) async {
  final prefs = await SharedPreferences.getInstance();
  if (level > (prefs.getInt('maxLevel') ?? 1)) {
    prefs.setInt('maxLevel', level);
  }
}

Future<List<String>> getAllKeys() async {
  final prefs = await SharedPreferences.getInstance();
  Set<String> keys = prefs.getKeys();

  keys.remove('maxLevel'); // Remove the key used to store the maximum level reached

  // Load all scores
  Map<String, int> maxScores = {};
  for (String key in keys) {
    List<Map<String, int>> scoresAndLevels = await loadScores(key);
    int maxScore = scoresAndLevels
        .map((scoreAndLevel) => scoreAndLevel['score'] ?? 0)
        .reduce((value, element) => value > element ? value : element);
    maxScores[key] = maxScore;
  }

  // Sort keys by max score in descending order
  List<String> sortedKeys = keys.toList();
  sortedKeys.sort((a, b) => (maxScores[b]?.compareTo(maxScores[a] ?? 0) ?? 0));

  return sortedKeys;
}

Future<List<Map<String, int>>> loadScores(String key) async {
  final prefs = await SharedPreferences.getInstance();
  List<String> scoreAndLevelStrings = prefs.getStringList(key) ?? [];

  List<Map<String, int>> scoresAndLevels = [];
  for (String scoreAndLevelString in scoreAndLevelStrings) {
    List<String> scoreAndLevelList = scoreAndLevelString.split(',');
    if (scoreAndLevelList.length != 2) {
      continue;
    }
    int score = int.tryParse(scoreAndLevelList[0]) ?? 0;
    int level = int.tryParse(scoreAndLevelList[1]) ?? 0;
    scoresAndLevels.add({'score': score, 'level': level});
  }

  return scoresAndLevels;
}

Future<void> clearPreferences() async {
  final prefs = await SharedPreferences.getInstance();
  prefs.clear();
}