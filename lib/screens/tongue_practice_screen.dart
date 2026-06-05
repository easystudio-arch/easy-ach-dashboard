import 'package:flutter/material.dart';
import '../services/tts_service.dart';

class TonguePracticeScreen extends StatefulWidget {
  const TonguePracticeScreen({super.key});

  @override
  State<TonguePracticeScreen> createState() => _TonguePracticeScreenState();
}

class _TonguePracticeScreenState extends State<TonguePracticeScreen> {
  final _tts = TtsService.instance;
  String _accent = TtsService.currentAccent;
  double _speed = 0.7;
  int _level = 0;
  int _current = 0;
  bool _speaking = false;

  static const List<String> _levels = ['Easy', 'Medium', 'Hard'];

  static const Map<String, List<String>> _twisters = {
    'Easy': [
      "She sells seashells by the seashore.",
      "Red lorry, yellow lorry.",
      "Toy boat, toy boat, toy boat.",
      "Big black bug bit a big black bear.",
      "Fresh French fried fish.",
      "Six slippery snails slid slowly seaward.",
      "A proper copper coffee pot.",
      "Green glass globes glow greenly.",
      "Eleven benevolent elephants.",
      "Five frantic frogs fled from fifty fierce fishes.",
    ],
    'Medium': [
      "Peter Piper picked a peck of pickled peppers.",
      "How much wood would a woodchuck chuck if a woodchuck could chuck wood?",
      "Betty Botter bought some butter but she said the butter's bitter.",
      "I scream, you scream, we all scream for ice cream.",
      "Fuzzy Wuzzy was a bear. Fuzzy Wuzzy had no hair.",
      "I saw Susie sitting in a shoeshine shop.",
      "A snake sneaks to seek a snack.",
      "Fred fed Ted bread and Ted fed Fred bread.",
      "The thirty-three thieves thought that they thrilled the throne.",
      "Can you can a can as a canner can can a can?",
    ],
    'Hard': [
      "The sixth sick sheikh's sixth sheep's sick.",
      "Pad kid poured curd pulled cod.",
      "Brisk brave brigadiers brandished broad bright blades.",
      "If you must cross a course cross cow across a crowded cow crossing, cross the cross coarse cow carefully.",
      "Imagine an imaginary menagerie manager managing an imaginary menagerie.",
      "She stood on the balcony inexplicably mimicking him hiccupping and amicably welcoming him in.",
      "Rory the warrior and Roger the worrier were reared wrongly in a rural brewery.",
      "The seething sea ceaseth and thus the seething sea sufficeth us.",
      "Six Czech cricket critics.",
      "Scissors sizzle, thistles sizzle.",
    ],
  };

  List<String> get _currentList => _twisters[_levels[_level]]!;

  Future<void> _speak() async {
    setState(() => _speaking = true);
    await _tts.setSpeechRate(_speed);
    await _tts.speak(_currentList[_current]);
    _tts.setCompletionHandler(() {
      if (mounted) setState(() => _speaking = false);
    });
  }

  void _next() {
    setState(() => _current = (_current + 1) % _currentList.length);
  }

  void _prev() {
    setState(() => _current = (_current - 1 + _currentList.length) % _currentList.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tongue Practice'),
        actions: [
          DropdownButton<String>(
            value: _accent,
            underline: const SizedBox(),
            items: TtsService.accents.keys.map((a) => DropdownMenuItem(value: a, child: Text(a, style: const TextStyle(fontSize: 13)))).toList(),
            onChanged: (v) { TtsService.setAccent(v!); setState(() => _accent = v); },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Level selector
            SegmentedButton<int>(
              segments: List.generate(3, (i) => ButtonSegment(value: i, label: Text(_levels[i]))),
              selected: {_level},
              onSelectionChanged: (v) => setState(() { _level = v.first; _current = 0; }),
            ),
            const SizedBox(height: 8),
            Text('${_current + 1} / ${_currentList.length}', style: TextStyle(color: Colors.grey[600])),
            const SizedBox(height: 24),
            // Tongue twister card
            Expanded(
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Center(
                    child: Text(
                      _currentList[_current],
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600, height: 1.5),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Speed control
            Row(
              children: [
                const Icon(Icons.speed, size: 20),
                const SizedBox(width: 8),
                Text('${_speed.toStringAsFixed(1)}x'),
                Expanded(
                  child: Slider(
                    value: _speed,
                    min: 0.3,
                    max: 1.5,
                    divisions: 12,
                    label: '${_speed.toStringAsFixed(1)}x',
                    onChanged: (v) => setState(() => _speed = v),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            // Controls
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton.filled(onPressed: _prev, icon: const Icon(Icons.skip_previous)),
                const SizedBox(width: 16),
                FloatingActionButton(
                  onPressed: _speaking ? null : _speak,
                  child: Icon(_speaking ? Icons.volume_up : Icons.play_arrow),
                ),
                const SizedBox(width: 16),
                IconButton.filled(onPressed: _next, icon: const Icon(Icons.skip_next)),
              ],
            ),
            const SizedBox(height: 8),
            Text('Listen, then repeat aloud!', style: TextStyle(color: Colors.grey[600], fontStyle: FontStyle.italic)),
          ],
        ),
      ),
    );
  }
}
