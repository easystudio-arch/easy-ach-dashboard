import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import '../data/content_provider.dart';

class SpeakingScreen extends StatefulWidget {
  const SpeakingScreen({super.key});

  @override
  State<SpeakingScreen> createState() => _SpeakingScreenState();
}

class _SpeakingScreenState extends State<SpeakingScreen> {
  final FlutterTts _tts = FlutterTts();
  int _currentIndex = 0;
  int _highlightedWord = -1;
  bool _isPlaying = false;
  bool _userTurn = false;
  List<String> _words = [];
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _tts.setLanguage('en-US');
    _tts.setSpeechRate(0.4);
    _tts.setCompletionHandler(() {
      if (mounted) {
        setState(() {
          _isPlaying = false;
          _highlightedWord = -1;
          _userTurn = true;
        });
        _timer?.cancel();
      }
    });
    _loadWords();
  }

  void _loadWords() {
    _words = ContentProvider.listeningTexts[_currentIndex].split(RegExp(r'\s+'));
  }

  @override
  void dispose() {
    _tts.stop();
    _timer?.cancel();
    super.dispose();
  }

  void _play() {
    setState(() {
      _isPlaying = true;
      _userTurn = false;
      _highlightedWord = 0;
    });

    final text = ContentProvider.listeningTexts[_currentIndex];
    _tts.speak(text);

    // Word highlight timer synced to speech rate (~320ms per word at 0.4 rate)
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(milliseconds: 320), (t) {
      if (!mounted) { t.cancel(); return; }
      setState(() {
        _highlightedWord++;
        if (_highlightedWord >= _words.length) {
          t.cancel();
        }
      });
    });
  }

  void _stop() {
    _tts.stop();
    _timer?.cancel();
    setState(() {
      _isPlaying = false;
      _highlightedWord = -1;
    });
  }

  @override
  Widget build(BuildContext context) {
    final texts = ContentProvider.listeningTexts;
    return Scaffold(
      appBar: AppBar(title: Text('Speaking (${_currentIndex + 1}/${texts.length})')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            LinearProgressIndicator(value: (_currentIndex + 1) / texts.length),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: _userTurn ? Colors.green[50] : Colors.blue[50],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Icon(_userTurn ? Icons.mic : Icons.volume_up, color: _userTurn ? Colors.green : Colors.blue),
                  const SizedBox(width: 8),
                  Text(
                    _userTurn ? '🎤 Your turn! Read aloud following the text' : '👂 Listen & follow the highlighted words',
                    style: TextStyle(fontWeight: FontWeight.bold, color: _userTurn ? Colors.green[800] : Colors.blue[800]),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Karaoke text area
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(16),
                ),
                child: SingleChildScrollView(
                  child: Wrap(
                    spacing: 6,
                    runSpacing: 10,
                    children: List.generate(_words.length, (i) {
                      final isHighlighted = i == _highlightedWord;
                      final isPast = i < _highlightedWord;
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        padding: isHighlighted ? const EdgeInsets.symmetric(horizontal: 4, vertical: 2) : EdgeInsets.zero,
                        decoration: isHighlighted
                            ? BoxDecoration(color: Colors.amber, borderRadius: BorderRadius.circular(4))
                            : null,
                        child: Text(
                          _words[i],
                          style: TextStyle(
                            fontSize: 20,
                            height: 1.6,
                            color: isHighlighted ? Colors.black : isPast ? Colors.white70 : Colors.white38,
                            fontWeight: isHighlighted ? FontWeight.bold : FontWeight.normal,
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Controls
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: _isPlaying ? null : _play,
                  icon: const Icon(Icons.play_arrow),
                  label: const Text('Listen First'),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                ),
                const SizedBox(width: 12),
                ElevatedButton.icon(
                  onPressed: _isPlaying ? _stop : null,
                  icon: const Icon(Icons.stop),
                  label: const Text('Stop'),
                ),
                const SizedBox(width: 12),
                ElevatedButton.icon(
                  onPressed: () {
                    // Replay karaoke without TTS for user to read aloud
                    setState(() {
                      _userTurn = true;
                      _highlightedWord = 0;
                    });
                    _timer?.cancel();
                    _timer = Timer.periodic(const Duration(milliseconds: 450), (t) {
                      if (!mounted) { t.cancel(); return; }
                      setState(() {
                        _highlightedWord++;
                        if (_highlightedWord >= _words.length) {
                          t.cancel();
                          _highlightedWord = -1;
                        }
                      });
                    });
                  },
                  icon: const Icon(Icons.mic),
                  label: const Text('Read Aloud'),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton.icon(
                  onPressed: _currentIndex > 0
                      ? () { _stop(); setState(() { _currentIndex--; _loadWords(); _userTurn = false; }); }
                      : null,
                  icon: const Icon(Icons.arrow_back),
                  label: const Text('Prev'),
                ),
                TextButton.icon(
                  onPressed: _currentIndex < texts.length - 1
                      ? () { _stop(); setState(() { _currentIndex++; _loadWords(); _userTurn = false; }); }
                      : null,
                  icon: const Icon(Icons.arrow_forward),
                  label: const Text('Next'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
