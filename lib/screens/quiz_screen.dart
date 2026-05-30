import 'package:flutter/material.dart';
import '../data/content_provider.dart';
import '../services/progress_service.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final _questions = ContentProvider.generalQuiz;
  int _index = 0;
  int? _selected;
  bool _showResult = false;
  int _score = 0;

  @override
  Widget build(BuildContext context) {
    if (_index >= _questions.length) {
      ProgressService.saveQuizScore(_score, _questions.length);
      return Scaffold(
        appBar: AppBar(title: const Text('Quiz Complete')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(_score > _questions.length * 0.7 ? Icons.emoji_events : Icons.refresh, size: 64, color: _score > _questions.length * 0.7 ? Colors.amber : Colors.orange),
              const SizedBox(height: 16),
              Text('$_score/${_questions.length}', style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Text(_score > _questions.length * 0.7 ? 'Excellent! B2 level achieved!' : 'Keep practicing!', style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 24),
              ElevatedButton(onPressed: () => setState(() { _index = 0; _score = 0; }), child: const Text('Retry')),
              const SizedBox(height: 8),
              OutlinedButton(onPressed: () => Navigator.pop(context), child: const Text('Back')),
            ],
          ),
        ),
      );
    }

    final q = _questions[_index];
    return Scaffold(
      appBar: AppBar(title: Text('Quiz (${_index + 1}/${_questions.length})')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LinearProgressIndicator(value: (_index + 1) / _questions.length),
            const SizedBox(height: 20),
            Text(q.question, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            ...List.generate(q.options.length, (i) {
              Color? color;
              if (_showResult) {
                if (i == q.correctIndex) { color = Colors.green[100]; }
                else if (i == _selected) { color = Colors.red[100]; }
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
            if (_showResult && q.explanation != null) ...[
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(color: Colors.blue[50], borderRadius: BorderRadius.circular(8)),
                child: Text('💡 ${q.explanation}', style: const TextStyle(fontSize: 14)),
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
                    setState(() { _index++; _selected = null; _showResult = false; });
                  }
                },
                child: Text(_showResult ? 'Next' : 'Check Answer'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
