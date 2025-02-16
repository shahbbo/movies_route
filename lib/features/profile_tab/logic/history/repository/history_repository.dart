import 'package:shared_preferences/shared_preferences.dart';

class HistoryRepository {
  static const String historyKey = "watch_history";

  //save movie in history
  Future<void> addMovieToHistory(String movieName) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> history = prefs.getStringList(historyKey) ?? [];
    if (!history.contains(movieName)) {
      history.add(movieName);
      await prefs.setStringList(historyKey, history);
    }
  }

//get movie from history
  Future<List<String>> getMovieFromHistory() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(historyKey) ?? [];
  }
}
