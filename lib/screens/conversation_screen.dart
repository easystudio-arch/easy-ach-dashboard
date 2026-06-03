import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import '../services/progress_service.dart';

class ConversationScreen extends StatefulWidget {
  const ConversationScreen({super.key});

  @override
  State<ConversationScreen> createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen> {
  final FlutterTts _tts = FlutterTts();
  int _dialogIndex = 0;
  int _lineIndex = 0;
  bool _isSpeaking = false;
  bool _showUserLine = false;
  int _highlightedWord = -1;
  Timer? _timer;

  static const List<_Dialogue> _dialogues = [
    _Dialogue(title: 'Job Interview', lines: [
      _Line(speaker: 'Interviewer', text: 'Tell me about your previous work experience.', isApp: true),
      _Line(speaker: 'You', text: 'I worked as a project manager for three years at a tech company.', isApp: false),
      _Line(speaker: 'Interviewer', text: 'What would you say is your greatest strength?', isApp: true),
      _Line(speaker: 'You', text: 'I would say my ability to communicate effectively with diverse teams.', isApp: false),
      _Line(speaker: 'Interviewer', text: 'Can you describe a challenging situation you handled?', isApp: true),
      _Line(speaker: 'You', text: 'Once I had to mediate a conflict between two departments with opposing priorities.', isApp: false),
    ]),
    _Dialogue(title: 'At the Airport', lines: [
      _Line(speaker: 'Agent', text: 'Good morning. May I see your passport and boarding pass?', isApp: true),
      _Line(speaker: 'You', text: 'Of course, here they are. I also have a connecting flight to Berlin.', isApp: false),
      _Line(speaker: 'Agent', text: 'Would you like a window or an aisle seat?', isApp: true),
      _Line(speaker: 'You', text: 'An aisle seat, please. I prefer to stretch my legs during the flight.', isApp: false),
      _Line(speaker: 'Agent', text: 'Do you have any luggage to check in?', isApp: true),
      _Line(speaker: 'You', text: 'Yes, I have one suitcase and I will keep this bag as carry-on.', isApp: false),
    ]),
    _Dialogue(title: 'Debating Climate Change', lines: [
      _Line(speaker: 'Partner', text: 'Do you think individual actions can really make a difference for climate change?', isApp: true),
      _Line(speaker: 'You', text: 'I believe they can, but systemic changes are far more impactful in the long run.', isApp: false),
      _Line(speaker: 'Partner', text: 'Some argue that government regulations stifle economic growth though.', isApp: true),
      _Line(speaker: 'You', text: 'That is a valid concern, however sustainable industries create new job opportunities.', isApp: false),
      _Line(speaker: 'Partner', text: 'What about developing countries that rely heavily on fossil fuels?', isApp: true),
      _Line(speaker: 'You', text: 'They should receive financial support to transition to renewable energy sources.', isApp: false),
    ]),
    _Dialogue(title: 'Ordering at a Restaurant', lines: [
      _Line(speaker: 'Waiter', text: 'Good evening. Are you ready to order or would you like a few more minutes?', isApp: true),
      _Line(speaker: 'You', text: 'I think we are ready. Could you recommend something from the specials?', isApp: false),
      _Line(speaker: 'Waiter', text: 'Our chef recommends the grilled salmon with roasted vegetables tonight.', isApp: true),
      _Line(speaker: 'You', text: 'That sounds lovely. I will have that, and could I get it without the sauce?', isApp: false),
      _Line(speaker: 'Waiter', text: 'Absolutely. Would you like anything to drink with your meal?', isApp: true),
      _Line(speaker: 'You', text: 'A glass of sparkling water with lemon, please.', isApp: false),
    ]),
    _Dialogue(title: 'Discussing Technology', lines: [
      _Line(speaker: 'Friend', text: 'Have you noticed how much artificial intelligence has changed our daily routines?', isApp: true),
      _Line(speaker: 'You', text: 'Absolutely. I rely on AI tools for work, but I am concerned about privacy implications.', isApp: false),
      _Line(speaker: 'Friend', text: 'Do you think AI will eventually replace most human jobs?', isApp: true),
      _Line(speaker: 'You', text: 'Not entirely. It will transform roles, but human creativity remains irreplaceable.', isApp: false),
      _Line(speaker: 'Friend', text: 'What about the ethical concerns around biased algorithms?', isApp: true),
      _Line(speaker: 'You', text: 'We need stricter regulations and diverse teams developing these systems.', isApp: false),
    ]),
  ];

  @override
  void initState() {
    super.initState();
    _dialogIndex = ProgressService.getLastPosition('conversation');
    _tts.setLanguage('en-US');
    _tts.setSpeechRate(0.45);
    _tts.setCompletionHandler(() {
      if (mounted) {
        setState(() => _isSpeaking = false);
      }
    });
  }

  @override
  void dispose() {
    _tts.stop();
    _timer?.cancel();
    super.dispose();
  }

  void _playAppLine() {
    final line = _dialogues[_dialogIndex].lines[_lineIndex];
    setState(() => _isSpeaking = true);
    _tts.speak(line.text);
  }

  void _startUserKaraoke() {
    final line = _dialogues[_dialogIndex].lines[_lineIndex];
    final words = line.text.split(RegExp(r'\s+'));
    setState(() {
      _showUserLine = true;
      _highlightedWord = 0;
    });
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(milliseconds: 450), (t) {
      if (!mounted) { t.cancel(); return; }
      setState(() {
        _highlightedWord++;
        if (_highlightedWord >= words.length) {
          t.cancel();
          _highlightedWord = -1;
        }
      });
    });
  }

  void _nextLine() {
    _timer?.cancel();
    final dialogue = _dialogues[_dialogIndex];
    if (_lineIndex < dialogue.lines.length - 1) {
      setState(() {
        _lineIndex++;
        _showUserLine = false;
        _highlightedWord = -1;
      });
    } else {
      // Dialogue complete
      setState(() {
        _lineIndex = 0;
        _showUserLine = false;
        _highlightedWord = -1;
      });
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Dialogue complete! Great job! 🎉')));
    }
  }

  @override
  Widget build(BuildContext context) {
    final dialogue = _dialogues[_dialogIndex];
    final currentLine = dialogue.lines[_lineIndex];
    final words = currentLine.text.split(RegExp(r'\s+'));

    return Scaffold(
      appBar: AppBar(title: Text(dialogue.title)),
      body: Column(
        children: [
          // Dialogue selector
          SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              itemCount: _dialogues.length,
              itemBuilder: (context, i) => Padding(
                padding: const EdgeInsets.only(right: 8),
                child: ChoiceChip(
                  label: Text(_dialogues[i].title),
                  selected: _dialogIndex == i,
                  onSelected: (_) {
                    _tts.stop();
                    _timer?.cancel();
                    setState(() { _dialogIndex = i; _lineIndex = 0; _showUserLine = false; _highlightedWord = -1; });
                    ProgressService.saveLastPosition('conversation', i);
                  },
                ),
              ),
            ),
          ),
          // Chat history
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _lineIndex + 1,
              itemBuilder: (context, i) {
                final line = dialogue.lines[i];
                final isCurrent = i == _lineIndex;
                return Align(
                  alignment: line.isApp ? Alignment.centerLeft : Alignment.centerRight,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.all(14),
                    constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.75),
                    decoration: BoxDecoration(
                      color: line.isApp ? Colors.blue[50] : Colors.green[50],
                      borderRadius: BorderRadius.circular(16),
                      border: isCurrent ? Border.all(color: line.isApp ? Colors.blue : Colors.green, width: 2) : null,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(line.speaker, style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: line.isApp ? Colors.blue : Colors.green)),
                        const SizedBox(height: 4),
                        if (isCurrent && !line.isApp && _showUserLine)
                          Wrap(
                            spacing: 4,
                            children: List.generate(words.length, (wi) {
                              final isHl = wi == _highlightedWord;
                              final isPast = _highlightedWord > -1 && wi < _highlightedWord;
                              return Container(
                                padding: isHl ? const EdgeInsets.symmetric(horizontal: 3, vertical: 1) : null,
                                decoration: isHl ? BoxDecoration(color: Colors.amber, borderRadius: BorderRadius.circular(3)) : null,
                                child: Text(words[wi], style: TextStyle(fontSize: 16, fontWeight: isHl ? FontWeight.bold : FontWeight.normal, color: isHl ? Colors.black : isPast ? Colors.black87 : Colors.black54)),
                              );
                            }),
                          )
                        else
                          Text(
                            isCurrent && !line.isApp && !_showUserLine ? '...' : line.text,
                            style: const TextStyle(fontSize: 16),
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          // Action buttons
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(color: Colors.grey[100], borderRadius: const BorderRadius.vertical(top: Radius.circular(16))),
            child: currentLine.isApp
                ? Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: _isSpeaking ? null : _playAppLine,
                          icon: Icon(_isSpeaking ? Icons.volume_up : Icons.play_arrow),
                          label: Text(_isSpeaking ? 'Speaking...' : '🔊 Listen'),
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.blue, foregroundColor: Colors.white),
                        ),
                      ),
                      const SizedBox(width: 12),
                      ElevatedButton(
                        onPressed: _nextLine,
                        child: const Text('Next →'),
                      ),
                    ],
                  )
                : Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: _startUserKaraoke,
                          icon: const Icon(Icons.mic),
                          label: const Text('🎤 Your Turn - Read!'),
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.green, foregroundColor: Colors.white),
                        ),
                      ),
                      const SizedBox(width: 12),
                      ElevatedButton(
                        onPressed: _nextLine,
                        child: const Text('Next →'),
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}

class _Dialogue {
  final String title;
  final List<_Line> lines;
  const _Dialogue({required this.title, required this.lines});
}

class _Line {
  final String speaker;
  final String text;
  final bool isApp;
  const _Line({required this.speaker, required this.text, required this.isApp});
}
