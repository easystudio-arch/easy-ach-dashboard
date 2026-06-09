import 'dart:async';
import 'package:flutter/material.dart';
import '../data/content_provider.dart';
import '../models/models.dart';
import '../services/tts_service.dart';

class SpeakingScreen extends StatefulWidget {
  const SpeakingScreen({super.key});

  @override
  State<SpeakingScreen> createState() => _SpeakingScreenState();
}

class _SpeakingScreenState extends State<SpeakingScreen> {
  final _tts = TtsService.instance;
  String _selectedCategory = 'All';
  String _selectedLevel = 'Medium';
  int _currentIndex = 0;
  int _highlightedWord = -1;
  bool _isPlaying = false;
  bool _userTurn = false;
  List<String> _words = [];
  Timer? _timer;
  String _accent = TtsService.currentAccent;

  List<SpeakingText> get _filteredTexts {
    var list = ContentProvider.speakingTexts.where((s) => s.level == _selectedLevel).toList();
    if (_selectedCategory != 'All') list = list.where((s) => s.category == _selectedCategory).toList();
    return list;
  }

  @override
  void initState() {
    super.initState();
    _tts.setSpeechRate(0.4);
    _tts.awaitSpeakCompletion(true);
    _tts.setCompletionHandler(() {
      if (mounted) {
        setState(() { _isPlaying = false; _highlightedWord = -1; _userTurn = true; });
        _timer?.cancel();
      }
    });
    _loadWords();
  }

  void _loadWords() {
    final texts = _filteredTexts;
    if (texts.isEmpty) { _words = []; return; }
    if (_currentIndex >= texts.length) _currentIndex = 0;
    _words = texts[_currentIndex].text.split(RegExp(r'\s+'));
  }

  @override
  void dispose() {
    _tts.stop();
    _timer?.cancel();
    super.dispose();
  }

  void _play() {
    final texts = _filteredTexts;
    if (texts.isEmpty) return;
    setState(() { _isPlaying = true; _userTurn = false; _highlightedWord = 0; });
    _tts.speak(texts[_currentIndex].text);
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(milliseconds: 320), (t) {
      if (!mounted) { t.cancel(); return; }
      setState(() {
        _highlightedWord++;
        if (_highlightedWord >= _words.length) t.cancel();
      });
    });
  }

  void _stop() {
    _tts.stop();
    _timer?.cancel();
    setState(() { _isPlaying = false; _highlightedWord = -1; });
  }

  void _onCategoryChange(String cat) {
    _stop();
    setState(() { _selectedCategory = cat; _currentIndex = 0; _userTurn = false; });
    _loadWords();
  }

  @override
  Widget build(BuildContext context) {
    final texts = _filteredTexts;
    final categories = ['All', ...ContentProvider.speakingCategories];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Speaking Practice'),
        actions: [
          DropdownButton<String>(
            value: _accent,
            underline: const SizedBox(),
            items: TtsService.accents.keys.map((a) => DropdownMenuItem(value: a, child: Text(TtsService.accentFlags[a]!, style: const TextStyle(fontSize: 20)))).toList(),
            onChanged: (v) { TtsService.setAccent(v!); setState(() => _accent = v); },
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Column(
        children: [
          // Level selector
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 8, 12, 0),
            child: Row(
              children: ['Easy', 'Medium', 'Hard'].map((l) => Padding(
                padding: const EdgeInsets.only(right: 8),
                child: ChoiceChip(
                  label: Text(l, style: TextStyle(fontSize: 12, color: _selectedLevel == l ? Colors.white : null)),
                  selected: _selectedLevel == l,
                  selectedColor: l == 'Easy' ? Colors.green : l == 'Medium' ? Colors.orange : Colors.red,
                  onSelected: (_) { _stop(); setState(() { _selectedLevel = l; _currentIndex = 0; _userTurn = false; }); _loadWords(); },
                ),
              )).toList(),
            ),
          ),
          // Category chips
          SizedBox(
            height: 50,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              separatorBuilder: (_, __) => const SizedBox(width: 8),
              itemBuilder: (context, i) {
                final cat = categories[i];
                return ChoiceChip(
                  label: Text(cat),
                  selected: cat == _selectedCategory,
                  onSelected: (_) => _onCategoryChange(cat),
                );
              },
            ),
          ),
          if (texts.isEmpty)
            const Expanded(child: Center(child: Text('No texts in this category')))
          else
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    // Title & progress
                    Row(
                      children: [
                        Expanded(child: Text(texts[_currentIndex].title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
                        Text('${_currentIndex + 1}/${texts.length}', style: const TextStyle(color: Colors.grey)),
                      ],
                    ),
                    const SizedBox(height: 8),
                    LinearProgressIndicator(value: (_currentIndex + 1) / texts.length),
                    const SizedBox(height: 12),
                    // Status bar
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        color: _userTurn ? Colors.green[50] : Colors.blue[50],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Icon(_userTurn ? Icons.mic : Icons.volume_up, color: _userTurn ? Colors.green : Colors.blue, size: 18),
                          const SizedBox(width: 8),
                          Text(
                            _userTurn ? '🎤 Your turn! Read aloud' : '👂 Listen & follow',
                            style: TextStyle(fontWeight: FontWeight.bold, color: _userTurn ? Colors.green[800] : Colors.blue[800], fontSize: 13),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    // Karaoke text
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(color: Colors.grey[900], borderRadius: BorderRadius.circular(16)),
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
                                decoration: isHighlighted ? BoxDecoration(color: Colors.amber, borderRadius: BorderRadius.circular(4)) : null,
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
                    const SizedBox(height: 12),
                    // Controls
                    Wrap(
                      spacing: 8,
                      alignment: WrapAlignment.center,
                      children: [
                        ElevatedButton.icon(
                          onPressed: _isPlaying ? null : _play,
                          icon: const Icon(Icons.play_arrow, size: 18),
                          label: const Text('Listen'),
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                        ),
                        ElevatedButton.icon(
                          onPressed: _isPlaying ? _stop : null,
                          icon: const Icon(Icons.stop, size: 18),
                          label: const Text('Stop'),
                        ),
                        ElevatedButton.icon(
                          onPressed: () {
                            setState(() { _userTurn = true; _highlightedWord = 0; });
                            _timer?.cancel();
                            _timer = Timer.periodic(const Duration(milliseconds: 450), (t) {
                              if (!mounted) { t.cancel(); return; }
                              setState(() {
                                _highlightedWord++;
                                if (_highlightedWord >= _words.length) { t.cancel(); _highlightedWord = -1; }
                              });
                            });
                          },
                          icon: const Icon(Icons.mic, size: 18),
                          label: const Text('Read Aloud'),
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    // Nav
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton.icon(
                          onPressed: _currentIndex > 0 ? () { _stop(); setState(() { _currentIndex--; _userTurn = false; }); _loadWords(); } : null,
                          icon: const Icon(Icons.arrow_back),
                          label: const Text('Prev'),
                        ),
                        TextButton.icon(
                          onPressed: _currentIndex < texts.length - 1 ? () { _stop(); setState(() { _currentIndex++; _userTurn = false; }); _loadWords(); } : null,
                          icon: const Icon(Icons.arrow_forward),
                          label: const Text('Next'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
