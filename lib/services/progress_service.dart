import 'package:shared_preferences/shared_preferences.dart';

class ProgressService {
  static SharedPreferences? _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static int get vocabCompleted => _prefs?.getInt('vocab') ?? 0;
  static int get grammarCompleted => _prefs?.getInt('grammar') ?? 0;
  static int get readingCompleted => _prefs?.getInt('reading') ?? 0;
  static int get listeningCompleted => _prefs?.getInt('listening') ?? 0;
  static int get quizBestScore => _prefs?.getInt('quizBest') ?? 0;
  static int get quizTotal => _prefs?.getInt('quizTotal') ?? 0;

  static void incrementVocab() => _prefs?.setInt('vocab', vocabCompleted + 1);
  static void incrementGrammar() => _prefs?.setInt('grammar', grammarCompleted + 1);
  static void incrementReading() => _prefs?.setInt('reading', readingCompleted + 1);
  static void incrementListening() => _prefs?.setInt('listening', listeningCompleted + 1);

  static void saveQuizScore(int score, int total) {
    if (score > quizBestScore) _prefs?.setInt('quizBest', score);
    _prefs?.setInt('quizTotal', total);
  }
}
