import 'package:flutter/material.dart';
import '../data/content_provider.dart';
import '../models/models.dart';
import '../services/progress_service.dart';

class GrammarScreen extends StatelessWidget {
  const GrammarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Grammar Lessons')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: ContentProvider.grammarLessons.length,
        itemBuilder: (context, index) {
          final lesson = ContentProvider.grammarLessons[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: CircleAvatar(child: Text('${index + 1}')),
              title: Text(lesson.title, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('${lesson.exercises.length} exercises'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => _GrammarDetailScreen(lesson: lesson))),
            ),
          );
        },
      ),
    );
  }
}

class _GrammarDetailScreen extends StatefulWidget {
  final GrammarLesson lesson;
  const _GrammarDetailScreen({required this.lesson});

  @override
  State<_GrammarDetailScreen> createState() => _GrammarDetailScreenState();
}

class _GrammarDetailScreenState extends State<_GrammarDetailScreen> {
  int _exerciseIndex = 0;
  int? _selectedAnswer;
  bool _showResult = false;
  int _score = 0;
  bool _inExercises = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.lesson.title)),
      body: _inExercises ? _buildExercise() : _buildLesson(),
    );
  }

  Widget _buildLesson() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Explanation', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text(widget.lesson.explanation, style: const TextStyle(fontSize: 15, height: 1.5)),
          const SizedBox(height: 20),
          const Text('Examples', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          ...widget.lesson.examples.map((e) => Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text('• ', style: TextStyle(fontSize: 15)),
              Expanded(child: Text(e, style: const TextStyle(fontSize: 15, fontStyle: FontStyle.italic))),
            ]),
          )),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () => setState(() => _inExercises = true),
              icon: const Icon(Icons.edit),
              label: const Text('Start Exercises'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExercise() {
    if (_exerciseIndex >= widget.lesson.exercises.length) {
      ProgressService.incrementGrammar();
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.check_circle, size: 64, color: Colors.green),
            const SizedBox(height: 16),
            Text('Score: $_score/${widget.lesson.exercises.length}', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            ElevatedButton(onPressed: () => Navigator.pop(context), child: const Text('Back to Lessons')),
          ],
        ),
      );
    }

    final exercise = widget.lesson.exercises[_exerciseIndex];
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Question ${_exerciseIndex + 1}/${widget.lesson.exercises.length}', style: const TextStyle(color: Colors.grey)),
          const SizedBox(height: 12),
          Text(exercise.question, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          ...List.generate(exercise.options.length, (i) {
            Color? color;
            if (_showResult) {
              if (i == exercise.correctIndex) { color = Colors.green[100]; }
              else if (i == _selectedAnswer) { color = Colors.red[100]; }
            }
            return Card(
              color: color,
              child: ListTile(
                title: Text(exercise.options[i]),
                leading: Icon(_selectedAnswer == i ? Icons.radio_button_checked : Icons.radio_button_unchecked, color: _selectedAnswer == i ? Colors.blue : null),
                onTap: _showResult ? null : () => setState(() => _selectedAnswer = i),
              ),
            );
          }),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _selectedAnswer == null ? null : () {
                if (!_showResult) {
                  setState(() {
                    _showResult = true;
                    if (_selectedAnswer == exercise.correctIndex) _score++;
                  });
                } else {
                  setState(() {
                    _exerciseIndex++;
                    _selectedAnswer = null;
                    _showResult = false;
                  });
                }
              },
              child: Text(_showResult ? 'Next' : 'Check Answer'),
            ),
          ),
        ],
      ),
    );
  }
}
