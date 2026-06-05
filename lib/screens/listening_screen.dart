import 'package:flutter/material.dart';
import '../data/content_provider.dart';
import '../services/progress_service.dart';
import '../services/tts_service.dart';

class ListeningScreen extends StatefulWidget {
  const ListeningScreen({super.key});

  @override
  State<ListeningScreen> createState() => _ListeningScreenState();
}

class _ListeningScreenState extends State<ListeningScreen> {
  final _tts = TtsService.instance;
  late int _currentIndex = ProgressService.getLastPosition('listening');
  bool _showText = false;
  bool _isPlaying = false;
  String _accent = TtsService.currentAccent;

  @override
  void initState() {
    super.initState();
    _tts.setSpeechRate(0.45);
    _tts.awaitSpeakCompletion(true);
    _tts.setCompletionHandler(() => setState(() => _isPlaying = false));
  }

  @override
  void dispose() {
    _tts.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final texts = ContentProvider.listeningTexts;
    return Scaffold(
      appBar: AppBar(
        title: Text('Listening (${_currentIndex + 1}/${texts.length})'),
        actions: [
          DropdownButton<String>(
            value: _accent,
            underline: const SizedBox(),
            items: TtsService.accents.keys.map((a) => DropdownMenuItem(value: a, child: Text(a, style: const TextStyle(fontSize: 13)))).toList(),
            onChanged: (v) { TtsService.setAccent(v!); setState(() => _accent = v); },
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            LinearProgressIndicator(value: (_currentIndex + 1) / texts.length),
            const SizedBox(height: 32),
            const Icon(Icons.headphones, size: 64, color: Colors.purple),
            const SizedBox(height: 16),
            const Text('Listen carefully, then check the transcript', style: TextStyle(fontSize: 16)),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () async {
                    setState(() => _isPlaying = true);
                    await _tts.speak(texts[_currentIndex]);
                  },
                  icon: Icon(_isPlaying ? Icons.volume_up : Icons.play_arrow),
                  label: Text(_isPlaying ? 'Playing...' : 'Play'),
                ),
                const SizedBox(width: 12),
                OutlinedButton.icon(
                  onPressed: () { _tts.stop(); setState(() => _isPlaying = false); },
                  icon: const Icon(Icons.stop),
                  label: const Text('Stop'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            OutlinedButton.icon(
              onPressed: () => setState(() => _showText = !_showText),
              icon: Icon(_showText ? Icons.visibility_off : Icons.visibility),
              label: Text(_showText ? 'Hide Transcript' : 'Show Transcript'),
            ),
            const SizedBox(height: 16),
            if (_showText)
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(12)),
                    child: Text(texts[_currentIndex], style: const TextStyle(fontSize: 15, height: 1.6)),
                  ),
                ),
              )
            else
              const Expanded(child: SizedBox()),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: _currentIndex > 0 ? () => setState(() { _currentIndex--; _showText = false; _tts.stop(); _isPlaying = false; ProgressService.saveLastPosition('listening', _currentIndex); }) : null,
                  child: const Text('Previous'),
                ),
                ElevatedButton(
                  onPressed: _currentIndex < texts.length - 1
                      ? () { ProgressService.incrementListening(); setState(() { _currentIndex++; _showText = false; _tts.stop(); _isPlaying = false; }); ProgressService.saveLastPosition('listening', _currentIndex); }
                      : () { ProgressService.incrementListening(); ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('All listening done! 🎉'))); },
                  child: const Text('Next'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
