import 'package:flutter/material.dart';
import 'ielts_reading_screen.dart';
import 'ielts_listening_screen.dart';
import 'ielts_writing_screen.dart';
import 'ielts_speaking_screen.dart';

class IeltsScreen extends StatelessWidget {
  const IeltsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('IELTS Preparation')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Target band score banner
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Colors.indigo, Colors.blue.shade700]),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Column(
                children: [
                  Text('🎯 Target: Band 7.0+', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
                  SizedBox(height: 4),
                  Text('Practice all 4 skills consistently', style: TextStyle(color: Colors.white70)),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Tips card
            Card(
              color: Colors.amber.shade50,
              child: const Padding(
                padding: EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('💡 Band 7 Tips:', style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(height: 6),
                    Text('• Listening: Predict answers before audio plays'),
                    Text('• Reading: Don\'t read word-by-word, skim first'),
                    Text('• Writing: Plan 5 min, write 35 min, check 5 min'),
                    Text('• Speaking: Extend answers, use linking words'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text('Practice Skills', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            _SkillCard(icon: Icons.headphones, title: 'Listening', subtitle: '3 sections · Fill gaps & MCQ', color: Colors.purple, onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const IeltsListeningScreen()))),
            _SkillCard(icon: Icons.article, title: 'Reading', subtitle: '3 Academic passages · T/F/NG & MCQ', color: Colors.blue, onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const IeltsReadingScreen()))),
            _SkillCard(icon: Icons.edit_note, title: 'Writing', subtitle: 'Task 1 & Task 2 · Sample answers', color: Colors.green, onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const IeltsWritingScreen()))),
            _SkillCard(icon: Icons.record_voice_over, title: 'Speaking', subtitle: 'Part 1, 2, 3 · Model answers', color: Colors.orange, onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const IeltsSpeakingScreen()))),
          ],
        ),
      ),
    );
  }
}

class _SkillCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;
  final VoidCallback onTap;
  const _SkillCard({required this.icon, required this.title, required this.subtitle, required this.color, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: CircleAvatar(backgroundColor: color.withOpacity(0.1), child: Icon(icon, color: color)),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }
}
