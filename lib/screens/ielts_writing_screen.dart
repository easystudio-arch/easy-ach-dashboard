import 'package:flutter/material.dart';
import '../data/ielts_data.dart';
import '../models/models.dart';

class IeltsWritingScreen extends StatelessWidget {
  const IeltsWritingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('IELTS Writing')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: IeltsData.writingTasks.length,
        itemBuilder: (context, i) {
          final t = IeltsData.writingTasks[i];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: CircleAvatar(backgroundColor: Colors.green.shade100, child: Text(t.taskType == 'Task 1' ? '1' : '2', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green.shade800))),
              title: Text('${t.taskType}: ${t.prompt.substring(0, 40)}...', style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('${t.tips.length} tips · ${t.usefulPhrases.length} phrases'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => _WritingDetail(task: t))),
            ),
          );
        },
      ),
    );
  }
}

class _WritingDetail extends StatefulWidget {
  final IeltsWritingTask task;
  const _WritingDetail({required this.task});
  @override
  State<_WritingDetail> createState() => _WritingDetailState();
}

class _WritingDetailState extends State<_WritingDetail> {
  final _controller = TextEditingController();
  bool _showSample = false;

  @override
  void dispose() { _controller.dispose(); super.dispose(); }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('IELTS ${widget.task.taskType}')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Prompt
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(color: Colors.grey.shade100, borderRadius: BorderRadius.circular(8), border: Border.all(color: Colors.grey.shade300)),
              child: Text(widget.task.prompt, style: const TextStyle(fontSize: 14, height: 1.6)),
            ),
            const SizedBox(height: 16),
            // Tips
            const Text('📝 Tips:', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            ...widget.task.tips.map((t) => Padding(padding: const EdgeInsets.only(bottom: 4), child: Text('• $t', style: const TextStyle(fontSize: 13)))),
            const SizedBox(height: 16),
            // Useful phrases
            ExpansionTile(
              title: const Text('Useful Phrases', style: TextStyle(fontWeight: FontWeight.bold)),
              children: widget.task.usefulPhrases.map((p) => ListTile(dense: true, title: Text(p, style: const TextStyle(fontSize: 13, fontStyle: FontStyle.italic)))).toList(),
            ),
            const SizedBox(height: 16),
            // Writing area
            const Text('✍️ Your Answer:', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            TextField(
              controller: _controller,
              maxLines: 10,
              decoration: InputDecoration(
                hintText: 'Write your answer here...',
                border: const OutlineInputBorder(),
                suffixIcon: ValueListenableBuilder<TextEditingValue>(
                  valueListenable: _controller,
                  builder: (_, v, __) => Padding(padding: const EdgeInsets.all(12), child: Text('${v.text.split(RegExp(r'\\s+')).where((w) => w.isNotEmpty).length} words', style: const TextStyle(color: Colors.grey, fontSize: 12))),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Show/hide sample answer
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () => setState(() => _showSample = !_showSample),
                icon: Icon(_showSample ? Icons.visibility_off : Icons.visibility),
                label: Text(_showSample ? 'Hide Sample Answer' : 'Show Sample Answer (Band 7-8)'),
              ),
            ),
            if (_showSample) ...[
              const SizedBox(height: 12),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(color: Colors.green.shade50, borderRadius: BorderRadius.circular(8)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('✅ Sample Answer (Band 7-8):', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green)),
                    const SizedBox(height: 8),
                    Text(widget.task.sampleAnswer, style: const TextStyle(fontSize: 14, height: 1.7)),
                    const SizedBox(height: 8),
                    Text('Word count: ${widget.task.sampleAnswer.split(RegExp(r'\\s+')).where((w) => w.isNotEmpty).length}', style: const TextStyle(color: Colors.grey, fontSize: 12)),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
