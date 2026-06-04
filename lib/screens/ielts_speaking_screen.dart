import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import '../data/ielts_data.dart';
import '../models/models.dart';

class IeltsSpeakingScreen extends StatelessWidget {
  const IeltsSpeakingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final parts = IeltsData.speakingParts;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('IELTS Speaking'),
          bottom: const TabBar(tabs: [Tab(text: 'Part 1'), Tab(text: 'Part 2'), Tab(text: 'Part 3')]),
        ),
        body: TabBarView(
          children: [
            _PartList(items: parts.where((p) => p.part == 'Part 1').toList()),
            _PartList(items: parts.where((p) => p.part == 'Part 2').toList()),
            _PartList(items: parts.where((p) => p.part == 'Part 3').toList()),
          ],
        ),
      ),
    );
  }
}

class _PartList extends StatelessWidget {
  final List<IeltsSpeakingPart> items;
  const _PartList({required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: items.length,
      itemBuilder: (context, i) {
        final item = items[i];
        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          child: ListTile(
            leading: CircleAvatar(backgroundColor: Colors.orange.shade100, child: Icon(Icons.record_voice_over, color: Colors.orange.shade700)),
            title: Text(item.topic, style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text('${item.questions.length} questions · ${item.vocabulary.length} vocab'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => _SpeakingDetail(part: item))),
          ),
        );
      },
    );
  }
}

class _SpeakingDetail extends StatefulWidget {
  final IeltsSpeakingPart part;
  const _SpeakingDetail({required this.part});
  @override
  State<_SpeakingDetail> createState() => _SpeakingDetailState();
}

class _SpeakingDetailState extends State<_SpeakingDetail> {
  final FlutterTts _tts = FlutterTts();
  int _qi = 0;
  bool _showAnswer = false;

  @override
  void initState() { super.initState(); _tts.setLanguage('en-US'); _tts.setSpeechRate(0.45); }
  @override
  void dispose() { _tts.stop(); super.dispose(); }

  @override
  Widget build(BuildContext context) {
    final q = widget.part.questions;
    final a = widget.part.sampleAnswers;
    return Scaffold(
      appBar: AppBar(title: Text('${widget.part.part}: ${widget.part.topic}')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Question
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(color: Colors.orange.shade50, borderRadius: BorderRadius.circular(8)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('Q${_qi + 1}/${q.length}', style: const TextStyle(fontWeight: FontWeight.bold)),
                      const Spacer(),
                      IconButton(icon: const Icon(Icons.volume_up, size: 20), onPressed: () => _tts.speak(q[_qi])),
                    ],
                  ),
                  Text(q[_qi], style: const TextStyle(fontSize: 16, height: 1.5)),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Instructions
            const Text('🎤 Practice speaking your answer aloud for 30-60 seconds (Part 1) or 1-2 minutes (Part 2)', style: TextStyle(color: Colors.grey, fontSize: 13)),
            const SizedBox(height: 16),
            // Show sample answer
            if (_qi < a.length) ...[
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: () => setState(() => _showAnswer = !_showAnswer),
                  icon: Icon(_showAnswer ? Icons.visibility_off : Icons.visibility),
                  label: Text(_showAnswer ? 'Hide Model Answer' : 'Show Model Answer'),
                ),
              ),
              if (_showAnswer) ...[
                const SizedBox(height: 12),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(color: Colors.green.shade50, borderRadius: BorderRadius.circular(8)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text('✅ Model Answer:', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green)),
                          const Spacer(),
                          IconButton(icon: const Icon(Icons.volume_up, size: 20, color: Colors.green), onPressed: () => _tts.speak(a[_qi])),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Text(a[_qi], style: const TextStyle(fontSize: 14, height: 1.7)),
                    ],
                  ),
                ),
              ],
            ],
            const SizedBox(height: 20),
            // Vocabulary
            const Text('📚 Useful Vocabulary:', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: widget.part.vocabulary.map((v) => Chip(label: Text(v, style: const TextStyle(fontSize: 12)), backgroundColor: Colors.blue.shade50)).toList(),
            ),
            const SizedBox(height: 24),
            // Nav
            Row(
              children: [
                if (_qi > 0) Expanded(child: OutlinedButton(onPressed: () => setState(() { _qi--; _showAnswer = false; }), child: const Text('Previous'))),
                if (_qi > 0) const SizedBox(width: 12),
                if (_qi < q.length - 1) Expanded(child: ElevatedButton(onPressed: () => setState(() { _qi++; _showAnswer = false; }), child: const Text('Next Question'))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
