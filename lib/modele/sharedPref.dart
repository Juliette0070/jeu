import 'package:shared_preferences/shared_preferences.dart';

// To save scores
Future<void> saveScore(String key, int score, int level) async {
  final prefs = await SharedPreferences.getInstance();
  String scoreAndLevelString = '$score,$level';
  prefs.setString(key, scoreAndLevelString);
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

Future<Set<String>> getAllKeys() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getKeys();
}

Future<Map<String, int>> loadScore(String key) async {
  final prefs = await SharedPreferences.getInstance();
  String? scoreAndLevelString = prefs.getString(key);
  if (scoreAndLevelString == null) {
    return {'score': 0, 'level': 0};
  } else {
    List<String> scoreAndLevelList = scoreAndLevelString.split(',');
    if (scoreAndLevelList.length != 2) {
      return {'score': 0, 'level': 0};
    }
    int score = int.tryParse(scoreAndLevelList[0]) ?? 0;
    int level = int.tryParse(scoreAndLevelList[1]) ?? 0;
    return {'score': score, 'level': level};
  }
}

Future<void> clearPreferences() async {
  final prefs = await SharedPreferences.getInstance();
  prefs.clear();
}