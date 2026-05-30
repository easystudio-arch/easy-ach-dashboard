import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import '../data/vocab_data.dart';
import '../models/models.dart';
import '../services/progress_service.dart';

class VocabularyScreen extends StatelessWidget {
  const VocabularyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Vocabulary B2')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Daily section
          const Text('📅 Daily Words', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          SizedBox(
            height: 80,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: VocabData.totalDays,
              itemBuilder: (context, i) => Padding(
                padding: const EdgeInsets.only(right: 8),
                child: ActionChip(
                  avatar: CircleAvatar(child: Text('${i + 1}')),
                  label: Text('Day ${i + 1}'),
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => _FlashcardScreen(title: 'Day ${i + 1}', words: VocabData.getDailyWords(i + 1))),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          // Topics section
          const Text('📚 By Topic', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          ...VocabData.topics.entries.map((e) => Card(
            margin: const EdgeInsets.only(bottom: 8),
            child: ListTile(
              leading: CircleAvatar(child: Text('${e.value.length}')),
              title: Text(e.key),
              subtitle: Text('${e.value.length} words'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => _FlashcardScreen(title: e.key, words: e.value)),
              ),
            ),
          )),
        ],
      ),
    );
  }
}

class _FlashcardScreen extends StatefulWidget {
  final String title;
  final List<VocabWord> words;
  const _FlashcardScreen({required this.title, required this.words});

  @override
  State<_FlashcardScreen> createState() => _FlashcardScreenState();
}

class _FlashcardScreenState extends State<_FlashcardScreen> {
  int _i = 0;

  @override
  Widget build(BuildContext context) {
    final word = widget.words[_i];
    return Scaffold(
      appBar: AppBar(title: Text('${widget.title} (${_i + 1}/${widget.words.length})')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            LinearProgressIndicator(value: (_i + 1) / widget.words.length),
            const SizedBox(height: 24),
            Expanded(
              child: FlipCard(
                direction: FlipDirection.HORIZONTAL,
                front: Card(
                  elevation: 6,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  color: Colors.blue[50],
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(word.word, style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 8),
                          Text('(${word.partOfSpeech})', style: TextStyle(fontSize: 14, color: Colors.grey[600])),
                          const SizedBox(height: 24),
                          const Text('Tap to flip', style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                    ),
                  ),
                ),
                back: Card(
                  elevation: 6,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  color: Colors.green[50],
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(word.definition, style: const TextStyle(fontSize: 16), textAlign: TextAlign.center),
                          const SizedBox(height: 16),
                          Text('"${word.example}"', style: const TextStyle(fontSize: 14, fontStyle: FontStyle.italic), textAlign: TextAlign.center),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton.icon(
                  onPressed: _i > 0 ? () => setState(() => _i--) : null,
                  icon: const Icon(Icons.arrow_back),
                  label: const Text('Prev'),
                ),
                ElevatedButton.icon(
                  onPressed: _i < widget.words.length - 1
                      ? () { ProgressService.incrementVocab(); setState(() => _i++); }
                      : () {
                          ProgressService.incrementVocab();
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('All words reviewed! 🎉')));
                        },
                  icon: const Icon(Icons.arrow_forward),
                  label: const Text('Next'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
