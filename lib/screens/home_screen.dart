import 'package:flutter/material.dart';
import '../screens/vocabulary_screen.dart';
import '../screens/grammar_screen.dart';
import '../screens/reading_screen.dart';
import '../screens/listening_screen.dart';
import '../screens/speaking_screen.dart';
import '../screens/conversation_screen.dart';
import '../screens/quiz_screen.dart';
import '../screens/progress_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EasyEnglish-B2'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.bar_chart),
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ProgressScreen())),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Welcome! Master English B2 Level', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            const Text('Selamat datang! Kuasai Bahasa Inggris Level B2', style: TextStyle(fontSize: 14, color: Colors.blueGrey)),
            const SizedBox(height: 8),
            const Text('Interactive offline course with vocabulary, grammar, reading, listening & quizzes.', style: TextStyle(fontSize: 14, color: Colors.grey)),
            const SizedBox(height: 24),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                children: [
                  _ModuleCard(icon: Icons.style, title: 'Vocabulary', subtitle: 'Kosakata - 500 Kata', color: Colors.blue, onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const VocabularyScreen()))),
                  _ModuleCard(icon: Icons.menu_book, title: 'Grammar', subtitle: 'Tata Bahasa - 5 Pelajaran', color: Colors.green, onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const GrammarScreen()))),
                  _ModuleCard(icon: Icons.article, title: 'Reading', subtitle: 'Membaca - 3 Teks', color: Colors.orange, onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ReadingScreen()))),
                  _ModuleCard(icon: Icons.headphones, title: 'Listening', subtitle: 'Mendengar - TTS', color: Colors.purple, onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ListeningScreen()))),
                  _ModuleCard(icon: Icons.record_voice_over, title: 'Speaking', subtitle: 'Berbicara - Karaoke', color: Colors.deepOrange, onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const SpeakingScreen()))),
                  _ModuleCard(icon: Icons.chat, title: 'Conversation', subtitle: 'Percakapan - Role Play', color: Colors.indigo, onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ConversationScreen()))),
                  _ModuleCard(icon: Icons.quiz, title: 'Quiz', subtitle: 'Kuis - 15 Soal', color: Colors.red, onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const QuizScreen()))),
                  _ModuleCard(icon: Icons.trending_up, title: 'Progress', subtitle: 'Kemajuan Belajar', color: Colors.teal, onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ProgressScreen()))),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ModuleCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;
  final VoidCallback onTap;

  const _ModuleCard({required this.icon, required this.title, required this.subtitle, required this.color, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 40, color: color),
              const SizedBox(height: 12),
              Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              Text(subtitle, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
            ],
          ),
        ),
      ),
    );
  }
}
