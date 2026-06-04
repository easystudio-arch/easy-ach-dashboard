import 'dart:convert';
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

  // Last position tracking
  static int getLastPosition(String key) => _prefs?.getInt('last_$key') ?? 0;
  static void saveLastPosition(String key, int value) => _prefs?.setInt('last_$key', value);
  static String getLastString(String key) => _prefs?.getString('last_$key') ?? '';
  static void saveLastString(String key, String value) => _prefs?.setString('last_$key', value);

  // Streak tracking
  static int get streak => _prefs?.getInt('streak') ?? 0;
  static String get lastStudyDate => _prefs?.getString('last_study_date') ?? '';

  static void recordStudyDay() {
    final today = DateTime.now().toIso8601String().substring(0, 10);
    if (lastStudyDate == today) { recordDailySnapshot(); return; }
    final yesterday = DateTime.now().subtract(const Duration(days: 1)).toIso8601String().substring(0, 10);
    _prefs?.setInt('streak', lastStudyDate == yesterday ? streak + 1 : 1);
    _prefs?.setString('last_study_date', today);
    recordDailySnapshot();
  }

  // IELTS scores
  static int get ieltsReadingCorrect => _prefs?.getInt('ielts_reading_correct') ?? 0;
  static int get ieltsReadingTotal => _prefs?.getInt('ielts_reading_total') ?? 0;
  static int get ieltsListeningCorrect => _prefs?.getInt('ielts_listening_correct') ?? 0;
  static int get ieltsListeningTotal => _prefs?.getInt('ielts_listening_total') ?? 0;

  static void saveIeltsReading(int correct, int total) {
    _prefs?.setInt('ielts_reading_correct', ieltsReadingCorrect + correct);
    _prefs?.setInt('ielts_reading_total', ieltsReadingTotal + total);
  }

  static void saveIeltsListening(int correct, int total) {
    _prefs?.setInt('ielts_listening_correct', ieltsListeningCorrect + correct);
    _prefs?.setInt('ielts_listening_total', ieltsListeningTotal + total);
  }

  // Daily challenge checklist
  static String get _todayKey => 'challenge_${DateTime.now().toIso8601String().substring(0, 10)}';
  static List<String> get completedChallenges => _prefs?.getStringList(_todayKey) ?? [];
  static void completeChallenge(String id) {
    final list = completedChallenges;
    if (!list.contains(id)) { list.add(id); _prefs?.setStringList(_todayKey, list); }
  }

  // Progress history tracking
  static void recordDailySnapshot() {
    final today = DateTime.now().toIso8601String().substring(0, 10);
    final history = getProgressHistory();
    if (history.isNotEmpty && history.last['date'] == today) {
      history.last['total'] = vocabCompleted + grammarCompleted + readingCompleted + listeningCompleted;
    } else {
      history.add({'date': today, 'total': vocabCompleted + grammarCompleted + readingCompleted + listeningCompleted});
    }
    if (history.length > 30) history.removeRange(0, history.length - 30);
    _prefs?.setString('progress_history', jsonEncode(history));
  }

  static List<Map<String, dynamic>> getProgressHistory() {
    final raw = _prefs?.getString('progress_history');
    if (raw == null) return [];
    return List<Map<String, dynamic>>.from(jsonDecode(raw));
  }
}
