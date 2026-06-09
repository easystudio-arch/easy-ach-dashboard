import 'package:flutter/material.dart';
import '../data/content_provider.dart';
import '../models/models.dart';
import '../services/progress_service.dart';

class ReadingScreen extends StatefulWidget {
  const ReadingScreen({super.key});

  @override
  State<ReadingScreen> createState() => _ReadingScreenState();
}

class _ReadingScreenState extends State<ReadingScreen> {
  String _selectedCategory = 'All';
  String _selectedLevel = 'Medium';

  List<ReadingPassage> get _filteredPassages {
    var list = ContentProvider.readingPassages.where((p) => p.level == _selectedLevel).toList();
    if (_selectedCategory != 'All') list = list.where((p) => p.category == _selectedCategory).toList();
    return list;
  }

  @override
  Widget build(BuildContext context) {
    final categories = ['All', ...ContentProvider.readingCategories];
    return Scaffold(
      appBar: AppBar(title: const Text('Reading Comprehension')),
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
                  onSelected: (_) => setState(() => _selectedLevel = l),
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
                final isSelected = cat == _selectedCategory;
                return ChoiceChip(
                  label: Text(cat),
                  selected: isSelected,
                  onSelected: (_) => setState(() => _selectedCategory = cat),
                );
              },
            ),
          ),
          // Passage list
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _filteredPassages.length,
              itemBuilder: (context, index) {
                final passage = _filteredPassages[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    leading: CircleAvatar(child: Text('${index + 1}')),
                    title: Text(passage.title, style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text('${passage.category} · ${passage.questions.length} questions'),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => _ReadingDetailScreen(passage: passage, index: index)));
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _ReadingDetailScreen extends StatefulWidget {
  final ReadingPassage passage;
  final int index;
  const _ReadingDetailScreen({required this.passage, required this.index});

  @override
  State<_ReadingDetailScreen> createState() => _ReadingDetailScreenState();
}

class _ReadingDetailScreenState extends State<_ReadingDetailScreen> {
  bool _showQuestions = false;
  int _qIndex = 0;
  int? _selected;
  bool _showResult = false;
  int _score = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.passage.title)),
      body: _showQuestions ? _buildQuiz() : _buildPassage(),
    );
  }

  Widget _buildPassage() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(color: Colors.blue[100], borderRadius: BorderRadius.circular(12)),
            child: Text(widget.passage.category, style: TextStyle(fontSize: 12, color: Colors.blue[800])),
          ),
          const SizedBox(height: 12),
          Text(widget.passage.text, style: const TextStyle(fontSize: 15, height: 1.7)),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () => setState(() => _showQuestions = true),
              icon: const Icon(Icons.quiz),
              label: const Text('Answer Questions'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuiz() {
    if (_qIndex >= widget.passage.questions.length) {
      ProgressService.incrementReading();
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.check_circle, size: 64, color: Colors.green),
            Text('Score: $_score/${widget.passage.questions.length}', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            ElevatedButton(onPressed: () => Navigator.pop(context), child: const Text('Back')),
          ],
        ),
      );
    }

    final q = widget.passage.questions[_qIndex];
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Q${_qIndex + 1}/${widget.passage.questions.length}', style: const TextStyle(color: Colors.grey)),
          const SizedBox(height: 8),
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
                onTap: _showResult ? null : () => setState(() => _selected = i),
                leading: Icon(_selected == i ? Icons.radio_button_checked : Icons.radio_button_unchecked, color: _selected == i ? Colors.blue : null),
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
                  setState(() { _qIndex++; _selected = null; _showResult = false; });
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
