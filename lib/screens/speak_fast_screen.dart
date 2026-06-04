import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import '../services/progress_service.dart';

class SpeakFastScreen extends StatefulWidget {
  const SpeakFastScreen({super.key});

  @override
  State<SpeakFastScreen> createState() => _SpeakFastScreenState();
}

class _SpeakFastScreenState extends State<SpeakFastScreen> {
  final FlutterTts _tts = FlutterTts();
  late String _theme = ProgressService.getLastString('speakfast_theme').isEmpty ? 'Casual' : ProgressService.getLastString('speakfast_theme');
  double _speed = 1.0;
  late int _currentLine = ProgressService.getLastPosition('speakfast_line');
  bool _isPlaying = false;
  bool _soundOn = true;
  final ScrollController _scrollCtrl = ScrollController();

  static const Map<String, List<String>> _content = {
    'Casual': [
      "Hey, what's up? How's it going?",
      "I'm doing great, thanks for asking.",
      "Did you catch that new show on Netflix?",
      "Yeah, it's amazing. I binged it all weekend.",
      "We should hang out sometime this week.",
      "Let me grab a coffee first, then we'll talk.",
      "No worries, take your time.",
      "By the way, have you tried that new restaurant?",
      "Honestly, the food was incredible.",
      "I'll send you the location, you gotta try it.",
      "Sounds like a plan! Let's go Friday.",
      "Cool, I'll hit you up later then.",
      "Alright, catch you later! Take care.",
      "Oh wait, one more thing before you go.",
      "Can you pick me up on the way there?",
      "Sure thing, no problem at all.",
      "You're the best. See you Friday!",
      "Don't forget to bring your appetite!",
      "Ha! Trust me, I always do.",
      "Later, dude. Have a good one!",
    ],
    'Reflection': [
      "Learning a language is a journey, not a race.",
      "Every mistake you make is a step forward.",
      "Don't compare your chapter one to someone's chapter twenty.",
      "The fact that you're trying already makes you brave.",
      "Fluency is not about perfection, it's about connection.",
      "Speak even when you're scared. That's how you grow.",
      "Your accent is proof that you know more than one language.",
      "Small progress is still progress. Keep going.",
      "The best time to start was yesterday. The next best time is now.",
      "Be patient with yourself. You're doing better than you think.",
      "Confidence comes from practice, not from waiting.",
      "Every word you learn opens a new door.",
      "It's okay to pause. It's not okay to quit.",
      "Celebrate the small wins. They add up.",
      "You don't need to be perfect to be understood.",
      "Speaking is a muscle. The more you use it, the stronger it gets.",
      "Believe in your progress, even when it feels slow.",
      "One conversation at a time, you're getting there.",
      "The world needs your voice. Don't hold it back.",
      "You are capable of more than you imagine.",
    ],
    'English is Easy': [
      "English is easy when you stop overthinking it.",
      "Just speak. Grammar will fix itself over time.",
      "Use simple words. Simple is powerful.",
      "I go, you go, we go. See? Easy pattern.",
      "Don't memorize rules. Memorize sentences.",
      "Listen more, stress less. Your brain will adapt.",
      "Think in English. Don't translate from your language.",
      "Repeat after me: I can speak English fluently.",
      "Short sentences are not wrong. They are clear.",
      "Want, need, like, have, do. Start with these.",
      "Past tense? Just add '-ed'. Most of the time.",
      "Questions? Put 'do' or 'does' first. Done.",
      "Prepositions are tricky, but you'll get used to them.",
      "Read out loud every day. Five minutes is enough.",
      "Copy how native speakers say things. That's natural learning.",
      "Songs, movies, podcasts. English is everywhere.",
      "Mistakes are free lessons. Make as many as you can.",
      "You already know more English than you realize.",
      "Keep it fun. Boring study kills motivation.",
      "You're reading this in English. See? You're already good!",
    ],
    'Business': [
      "Let's schedule a meeting to discuss the proposal.",
      "I'd like to follow up on our previous conversation.",
      "Could you send me the report by end of day?",
      "We need to align our strategy with market trends.",
      "I appreciate your input on this project.",
      "Let's circle back on this after the quarterly review.",
      "The deadline has been moved to next Friday.",
      "Please find attached the updated budget forecast.",
      "We're looking at a fifteen percent growth this quarter.",
      "I'd like to propose a new approach to this challenge.",
      "Teamwork and communication are key to our success.",
      "Let's streamline the process to improve efficiency.",
      "The client requested a revision of the contract.",
      "We'll need stakeholder approval before moving forward.",
      "Can you prepare a brief summary for the board?",
      "Our competitive advantage lies in innovation.",
      "Let's leverage our resources to maximize output.",
      "I'll take the lead on the new product launch.",
      "Risk management should be our top priority.",
      "Thank you for your professionalism and dedication.",
    ],
    'Technology': [
      "Artificial intelligence is transforming every industry.",
      "Cloud computing allows us to scale without limits.",
      "Cybersecurity threats are evolving every single day.",
      "Machine learning models need massive amounts of data.",
      "The future of work is remote and digital.",
      "APIs connect different systems seamlessly together.",
      "Blockchain technology ensures transparency and security.",
      "User experience design puts people first.",
      "Automation reduces human error and saves time.",
      "Open source software drives collaborative innovation.",
      "Data privacy is a fundamental human right.",
      "The Internet of Things connects billions of devices.",
      "Agile methodology helps teams deliver faster.",
      "Version control keeps your codebase organized and safe.",
      "Responsive design works on any screen size.",
      "Clean code is readable, maintainable, and testable.",
      "DevOps bridges the gap between development and operations.",
      "Quantum computing will revolutionize problem solving.",
      "Digital literacy is essential in the modern workplace.",
      "Technology is a tool. People are the solution.",
    ],
  };

  List<String> get _lines => _content[_theme]!;

  @override
  void initState() {
    super.initState();
    _tts.setLanguage('en-US');
    _tts.awaitSpeakCompletion(true);
  }

  @override
  void dispose() {
    _tts.stop();
    _scrollCtrl.dispose();
    super.dispose();
  }

  Future<void> _play() async {
    setState(() => _isPlaying = true);
    await _tts.setSpeechRate(_speed * 0.5);

    for (int i = _currentLine; i < _lines.length && _isPlaying; i++) {
      if (!mounted) return;
      setState(() => _currentLine = i);
      ProgressService.saveLastPosition('speakfast_line', i);
      _scrollToLine(i);
      if (_soundOn) {
        await _tts.speak(_lines[i]);
      } else {
        await Future.delayed(Duration(milliseconds: (2000 / _speed).round()));
      }
      if (!_isPlaying) break;
    }
    if (mounted) setState(() => _isPlaying = false);
  }

  void _stop() {
    _tts.stop();
    setState(() => _isPlaying = false);
  }

  void _reset() {
    _stop();
    setState(() => _currentLine = 0);
    _scrollCtrl.animateTo(0, duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  void _scrollToLine(int index) {
    final target = index * 56.0;
    if (_scrollCtrl.hasClients) {
      _scrollCtrl.animateTo(target, duration: const Duration(milliseconds: 400), curve: Curves.ease);
    }
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(title: const Text('Speak Fast & Clear')),
      body: Column(
        children: [
          // Theme selector
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 4, offset: const Offset(0, 2))],
            ),
            child: SizedBox(
              height: 36,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: _content.keys.map((t) => Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: ChoiceChip(
                    label: Text(t, style: TextStyle(fontSize: 12, fontWeight: _theme == t ? FontWeight.w600 : FontWeight.normal, color: _theme == t ? Colors.white : cs.onSurfaceVariant)),
                    selected: _theme == t,
                    selectedColor: const Color(0xFF1E293B),
                    onSelected: (_) { _stop(); setState(() { _theme = t; _currentLine = 0; }); ProgressService.saveLastString('speakfast_theme', t); ProgressService.saveLastPosition('speakfast_line', 0); },
                  ),
                )).toList(),
              ),
            ),
          ),
          // Speed control
          Container(
            margin: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: Row(
              children: [
                Icon(Icons.speed, color: cs.primary, size: 18),
                const SizedBox(width: 8),
                Text('${_speed.toStringAsFixed(1)}x', style: TextStyle(color: cs.primary, fontWeight: FontWeight.bold, fontSize: 13)),
                Expanded(
                  child: Slider(
                    value: _speed,
                    min: 0.5,
                    max: 2.0,
                    divisions: 6,
                    onChanged: (v) => setState(() => _speed = v),
                  ),
                ),
              ],
            ),
          ),
          // Running text area
          Expanded(
            child: Container(
              margin: const EdgeInsets.fromLTRB(16, 8, 16, 0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey.shade200),
                boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.03), blurRadius: 8, offset: const Offset(0, 2))],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: ListView.builder(
                  controller: _scrollCtrl,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                  itemCount: _lines.length,
                  itemBuilder: (ctx, i) {
                    final isActive = i == _currentLine && _isPlaying;
                    final isPast = i < _currentLine;
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      height: 56,
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.symmetric(horizontal: isActive ? 12 : 0, vertical: 4),
                      decoration: BoxDecoration(
                        color: isActive ? cs.primary.withValues(alpha: 0.08) : Colors.transparent,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        _lines[i],
                        style: TextStyle(
                          fontSize: isActive ? 18 : 15,
                          height: 1.5,
                          fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
                          color: isActive ? cs.primary : isPast ? cs.onSurface.withValues(alpha: 0.35) : cs.onSurface.withValues(alpha: 0.85),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          // Controls
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 8, offset: const Offset(0, -2))],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.restart_alt, color: cs.onSurfaceVariant, size: 28),
                  onPressed: _reset,
                ),
                const SizedBox(width: 16),
                IconButton(
                  icon: Icon(_soundOn ? Icons.volume_up : Icons.volume_off, color: _soundOn ? cs.primary : Colors.grey, size: 28),
                  onPressed: () { if (_soundOn) _tts.stop(); setState(() => _soundOn = !_soundOn); },
                ),
                const SizedBox(width: 16),
                FloatingActionButton(
                  backgroundColor: const Color(0xFF1E293B),
                  foregroundColor: Colors.white,
                  onPressed: _isPlaying ? _stop : _play,
                  child: Icon(_isPlaying ? Icons.pause : Icons.play_arrow),
                ),
                const SizedBox(width: 16),
                IconButton(
                  icon: Icon(Icons.skip_next, color: cs.onSurfaceVariant, size: 28),
                  onPressed: _currentLine < _lines.length - 1
                      ? () { _stop(); setState(() => _currentLine++); ProgressService.saveLastPosition('speakfast_line', _currentLine); _scrollToLine(_currentLine); }
                      : null,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
