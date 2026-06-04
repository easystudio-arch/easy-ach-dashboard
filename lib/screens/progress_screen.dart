import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../services/progress_service.dart';
import 'daily_boost_screen.dart';
import 'graphic_screen.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final vocab = ProgressService.vocabCompleted;
    final grammar = ProgressService.grammarCompleted;
    final reading = ProgressService.readingCompleted;
    final listening = ProgressService.listeningCompleted;
    final quizBest = ProgressService.quizBestScore;
    final quizTotal = ProgressService.quizTotal;
    final total = vocab + grammar + reading + listening;
    final maxTotal = 30 + 5 + 3 + 5; // vocab + grammar + reading + listening targets

    return Scaffold(
      appBar: AppBar(title: const Text('Your Progress')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            CircularPercentIndicator(
              radius: 80,
              lineWidth: 12,
              percent: (total / maxTotal).clamp(0.0, 1.0),
              center: Text('${((total / maxTotal) * 100).clamp(0, 100).toInt()}%', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              progressColor: Colors.blue,
              footer: const Padding(padding: EdgeInsets.only(top: 12), child: Text('Overall Progress')),
            ),
            const SizedBox(height: 32),
            _StatTile(icon: Icons.style, label: 'Vocabulary', value: '$vocab / 30', color: Colors.blue),
            _StatTile(icon: Icons.menu_book, label: 'Grammar', value: '$grammar / 5', color: Colors.green),
            _StatTile(icon: Icons.article, label: 'Reading', value: '$reading / 3', color: Colors.orange),
            _StatTile(icon: Icons.headphones, label: 'Listening', value: '$listening / 5', color: Colors.purple),
            _StatTile(icon: Icons.quiz, label: 'Quiz Best', value: quizTotal > 0 ? '$quizBest / $quizTotal' : 'Not taken', color: Colors.red),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const DailyBoostScreen())),
                icon: const Icon(Icons.bolt),
                label: const Text('Daily Boost - Motivasi Harian'),
                style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(14), backgroundColor: Colors.orange, foregroundColor: Colors.white),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const GraphicScreen())),
                icon: const Icon(Icons.show_chart),
                label: const Text('Progress Trend - Grafik Kemajuan'),
                style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(14), backgroundColor: Colors.teal, foregroundColor: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;

  const _StatTile({required this.icon, required this.label, required this.value, required this.color});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: Icon(icon, color: color),
        title: Text(label),
        trailing: Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
      ),
    );
  }
}
