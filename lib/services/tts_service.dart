import 'package:flutter_tts/flutter_tts.dart';
import 'progress_service.dart';

class TtsService {
  static final FlutterTts _tts = FlutterTts();
  static const String _key = 'tts_accent';
  static const Map<String, String> accents = {
    'American': 'en-US',
    'British': 'en-GB',
    'Australian': 'en-AU',
  };

  static String get currentAccent {
    final saved = ProgressService.getLastString(_key);
    return saved.isEmpty ? 'American' : saved;
  }

  static FlutterTts get instance => _tts;

  static Future<void> init() async {
    await _tts.setLanguage(accents[currentAccent]!);
  }

  static Future<void> setAccent(String accent) async {
    ProgressService.saveLastString(_key, accent);
    await _tts.setLanguage(accents[accent]!);
  }
}
