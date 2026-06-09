import 'dart:async';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_tts/flutter_tts.dart';
import 'progress_service.dart';
import 'tts_keepalive_stub.dart' if (dart.library.js_interop) 'tts_keepalive_web.dart';
import 'tts_offline_voice_stub.dart' if (dart.library.js_interop) 'tts_offline_voice_web.dart';

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
    final lang = accents[currentAccent]!;
    await _tts.setLanguage(lang);
    if (kIsWeb) {
      await _setOfflineVoice(lang);
      _tts.setStartHandler(() => _startKeepAlive());
      _tts.setCompletionHandler(() => _stopKeepAlive());
      _tts.setCancelHandler(() => _stopKeepAlive());
    }
  }

  static Future<void> _setOfflineVoice(String lang) async {
    final name = getOfflineVoiceNameForLang(lang);
    if (name.isNotEmpty) {
      await _tts.setVoice({"name": name, "locale": lang});
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
    final lang = accents[accent]!;
    await _tts.setLanguage(lang);
    if (kIsWeb) await _setOfflineVoice(lang);
  }
}
