import 'dart:async';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_tts/flutter_tts.dart';
import 'progress_service.dart';
import 'tts_keepalive_stub.dart' if (dart.library.js_interop) 'tts_keepalive_web.dart';

class TtsService {
  static final FlutterTts _tts = FlutterTts();
  static const String _key = 'tts_accent';
  static const Map<String, String> accents = {
    'American': 'en-US',
    'British': 'en-GB',
    'Australian': 'en-AU',
  };

  static const Map<String, String> accentFlags = {
    'American': '🇺🇸',
    'British': '🇬🇧',
    'Australian': '🇦🇺',
  };

  static Timer? _keepAliveTimer;

  static String get currentAccent {
    final saved = ProgressService.getLastString(_key);
    return saved.isEmpty ? 'American' : saved;
  }

  static FlutterTts get instance => _tts;

  static Future<void> init() async {
    await _tts.setLanguage(accents[currentAccent]!);
    if (kIsWeb) {
      _tts.setStartHandler(() => _startKeepAlive());
      _tts.setCompletionHandler(() => _stopKeepAlive());
      _tts.setCancelHandler(() => _stopKeepAlive());
    }
  }

  static void _startKeepAlive() {
    _stopKeepAlive();
    _keepAliveTimer = Timer.periodic(const Duration(seconds: 10), (_) {
      webPauseResume();
    });
  }

  static void _stopKeepAlive() {
    _keepAliveTimer?.cancel();
    _keepAliveTimer = null;
  }

  static Future<void> setAccent(String accent) async {
    ProgressService.saveLastString(_key, accent);
    await _tts.setLanguage(accents[accent]!);
  }
}
