import 'package:flutter/material.dart';
import '../services/progress_service.dart';
import 'vocabulary_screen.dart';
import 'grammar_screen.dart';
import 'listening_screen.dart';
import 'speaking_screen.dart';
import 'quiz_screen.dart';

class DailyBoostScreen extends StatefulWidget {
  const DailyBoostScreen({super.key});

  @override
  State<DailyBoostScreen> createState() => _DailyBoostScreenState();
}

class _DailyBoostScreenState extends State<DailyBoostScreen> {
  static const _quotes = [
    "Small progress is still progress. Keep going! 💪",
    "The secret of getting ahead is getting started.",
    "Don't watch the clock; do what it does. Keep going.",
    "Every expert was once a beginner.",
    "One word at a time, one day at a time. You've got this!",
    "Consistency beats intensity. Show up every day.",
    "Your future self will thank you for studying today.",
    "Mistakes are proof that you are trying.",
    "A little progress each day adds up to big results.",
    "Speak even when you're scared. That's how you grow.",
    "The best investment you can make is in yourself.",
    "Learning is a treasure that will follow you everywhere.",
    "Don't be afraid of being slow, be afraid of standing still.",
    "5 minutes of study is better than 0 minutes.",
    "You are one lesson away from a breakthrough!",
  ];

  static const _challenges = [
    _Challenge('vocab5', '📚 Hafalkan 5 vocab hari ini', 'vocabulary'),
    _Challenge('grammar1', '📖 Selesaikan 1 grammar lesson', 'grammar'),
    _Challenge('listen1', '🎧 Dengarkan 1 listening exercise', 'listening'),
    _Challenge('speak1', '🗣️ Latihan speaking 1 teks', 'speaking'),
    _Challenge('quiz1', '❓ Kerjakan quiz hari ini', 'quiz'),
  ];

  String get _todayQuote {
    final day = DateTime.now().difference(DateTime(2024)).inDays;
    return _quotes[day % _quotes.length];
  }

  String get _streakMessage {
    final streak = ProgressService.streak;
    final last = ProgressService.lastStudyDate;
    final today = DateTime.now().toIso8601String().substring(0, 10);
    if (last == today) return "Keren! Kamu sudah belajar hari ini! 🎉";
    if (streak == 0) return "Ayo mulai streak pertamamu hari ini! 🚀";
    final yesterday = DateTime.now().subtract(const Duration(days: 1)).toIso8601String().substring(0, 10);
    if (last == yesterday) return "Jangan putus streak-mu! Lanjutkan hari ini! 🔥";
    return "Kamu sudah $streak hari tidak belajar. Yuk mulai lagi! 💪";
  }

  void _goTo(String module) {
    Widget screen;
    switch (module) {
      case 'vocabulary': screen = const VocabularyScreen(); break;
      case 'grammar': screen = const GrammarScreen(); break;
      case 'listening': screen = const ListeningScreen(); break;
      case 'speaking': screen = const SpeakingScreen(); break;
      case 'quiz': screen = const QuizScreen(); break;
      default: return;
    }
    Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
  }

  @override
  Widget build(BuildContext context) {
    final completed = ProgressService.completedChallenges;
    final streak = ProgressService.streak;

    return Scaffold(
      appBar: AppBar(title: const Text('Daily Boost')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Streak
            Card(
              color: Colors.orange[50],
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Text('🔥', style: const TextStyle(fontSize: 32)),
                    const SizedBox(width: 12),
                    Expanded(child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Streak: $streak hari', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 4),
                        Text(_streakMessage, style: TextStyle(fontSize: 13, color: Colors.grey[700])),
                      ],
                    )),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Quote
            Card(
              color: Colors.blue[50],
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    const Text('💬', style: TextStyle(fontSize: 24)),
                    const SizedBox(width: 12),
                    Expanded(child: Text(_todayQuote, style: const TextStyle(fontSize: 15, fontStyle: FontStyle.italic))),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            // Daily challenges
            const Text('🎯 Tantangan Hari Ini', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            ...(_challenges.map((c) {
              final done = completed.contains(c.id);
              return Card(
                margin: const EdgeInsets.only(bottom: 8),
                child: ListTile(
                  leading: Icon(done ? Icons.check_circle : Icons.radio_button_unchecked, color: done ? Colors.green : Colors.grey),
                  title: Text(c.label, style: TextStyle(decoration: done ? TextDecoration.lineThrough : null, color: done ? Colors.grey : null)),
                  trailing: done
                      ? const Text('✓', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold))
                      : TextButton(
                          onPressed: () { ProgressService.completeChallenge(c.id); ProgressService.recordStudyDay(); setState(() {}); _goTo(c.module); },
                          child: const Text('Mulai'),
                        ),
                ),
              );
            })),
            const SizedBox(height: 16),
            // Progress summary
            Text('${completed.length} / ${_challenges.length} tantangan selesai', textAlign: TextAlign.center, style: TextStyle(fontSize: 14, color: Colors.grey[600])),
            const SizedBox(height: 4),
            LinearProgressIndicator(value: completed.length / _challenges.length, minHeight: 8, borderRadius: BorderRadius.circular(4)),
          ],
        ),
      ),
    );
  }
}

class _Challenge {
  final String id, label, module;
  const _Challenge(this.id, this.label, this.module);
}
