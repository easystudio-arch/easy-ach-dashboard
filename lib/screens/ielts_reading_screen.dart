import 'package:flutter/material.dart';
import '../data/ielts_data.dart';
import '../models/models.dart';

class IeltsReadingScreen extends StatelessWidget {
  const IeltsReadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('IELTS Reading')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: IeltsData.readingPassages.length,
        itemBuilder: (context, i) {
          final p = IeltsData.readingPassages[i];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: CircleAvatar(child: Text('${i + 1}')),
              title: Text(p.title, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('${p.category} · ${p.questions.length} questions'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => _ReadingDetail(passage: p))),
            ),
          );
        },
      ),
    );
  }
}

class _ReadingDetail extends StatefulWidget {
  final IeltsReadingPassage passage;
  const _ReadingDetail({required this.passage});
  @override
  State<_ReadingDetail> createState() => _ReadingDetailState();
}

class _ReadingDetailState extends State<_ReadingDetail> {
  bool _showQuiz = false;
  int _qi = 0;
  int? _selected;
  bool _showResult = false;
  int _score = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.passage.title)),
      body: _showQuiz ? _buildQuiz() : _buildPassage(),
    );
  }

  Widget _buildPassage() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Tip
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: Colors.amber.shade50, borderRadius: BorderRadius.circular(8)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('💡 ', style: TextStyle(fontSize: 16)),
                Expanded(child: Text(widget.passage.tip, style: const TextStyle(fontSize: 13))),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Text(widget.passage.passage, style: const TextStyle(fontSize: 15, height: 1.8)),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () => setState(() => _showQuiz = true),
              icon: const Icon(Icons.quiz),
              label: const Text('Answer Questions'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuiz() {
    final questions = widget.passage.questions;
    if (_qi >= questions.length) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(_score >= questions.length * 0.7 ? Icons.emoji_events : Icons.check_circle, size: 64, color: _score >= questions.length * 0.7 ? Colors.amber : Colors.green),
            const SizedBox(height: 12),
            Text('$_score/${questions.length}', style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            Text(_score >= questions.length * 0.7 ? 'Band 7+ level! 🎉' : 'Keep practicing!', style: const TextStyle(fontSize: 16, color: Colors.grey)),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: () => Navigator.pop(context), child: const Text('Back')),
          ],
        ),
      );
    }

    final q = questions[_qi];
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2), decoration: BoxDecoration(color: Colors.blue.shade100, borderRadius: BorderRadius.circular(8)), child: Text(q.type.replaceAll('_', ' ').toUpperCase(), style: TextStyle(fontSize: 11, color: Colors.blue.shade800))),
              const Spacer(),
              Text('${_qi + 1}/${questions.length}', style: const TextStyle(color: Colors.grey)),
            ],
          ),
          const SizedBox(height: 12),
          Text(q.question, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          ...List.generate(q.options.length, (i) {
            Color? color;
            if (_showResult) {
              if (i == q.correctIndex) color = Colors.green[100];
              else if (i == _selected) color = Colors.red[100];
            }
            return Card(
              color: color,
              child: ListTile(
                title: Text(q.options[i]),
                leading: Icon(_selected == i ? Icons.radio_button_checked : Icons.radio_button_unchecked, color: _selected == i ? Colors.blue : null),
                onTap: _showResult ? null : () => setState(() => _selected = i),
              ),
            );
          }),
          if (_showResult) ...[
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(color: Colors.blue[50], borderRadius: BorderRadius.circular(8)),
              child: Text('💡 ${q.explanation}', style: const TextStyle(fontSize: 13)),
            ),
          ],
          const Spacer(),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _selected == null ? null : () {
                if (!_showResult) {
                  setState(() { _showResult = true; if (_selected == q.correctIndex) _score++; });
                } else {
                  setState(() { _qi++; _selected = null; _showResult = false; });
                }
              },
              child: Text(_showResult ? 'Next' : 'Check'),
            ),
          ),
        ],
      ),
    );
  }
}
