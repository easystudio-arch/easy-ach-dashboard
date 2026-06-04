import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import '../data/ielts_data.dart';
import '../models/models.dart';

class IeltsListeningScreen extends StatelessWidget {
  const IeltsListeningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('IELTS Listening')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: IeltsData.listeningSections.length,
        itemBuilder: (context, i) {
          final s = IeltsData.listeningSections[i];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: CircleAvatar(backgroundColor: Colors.purple.shade100, child: Icon(Icons.headphones, color: Colors.purple.shade700)),
              title: Text(s.title, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(s.context),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => _ListeningDetail(section: s))),
            ),
          );
        },
      ),
    );
  }
}

class _ListeningDetail extends StatefulWidget {
  final IeltsListeningSection section;
  const _ListeningDetail({required this.section});
  @override
  State<_ListeningDetail> createState() => _ListeningDetailState();
}

class _ListeningDetailState extends State<_ListeningDetail> {
  final FlutterTts _tts = FlutterTts();
  bool _isPlaying = false;
  bool _hasListened = false;
  bool _showQuiz = false;
  int _qi = 0;
  int? _selected;
  bool _showResult = false;
  int _score = 0;

  @override
  void initState() {
    super.initState();
    _tts.setLanguage('en-US');
    _tts.setSpeechRate(0.45);
    _tts.setCompletionHandler(() { if (mounted) setState(() { _isPlaying = false; _hasListened = true; }); });
  }

  @override
  void dispose() { _tts.stop(); super.dispose(); }

  void _play() { setState(() => _isPlaying = true); _tts.speak(widget.section.audioText); }
  void _stop() { _tts.stop(); setState(() => _isPlaying = false); }

  @override
  Widget build(BuildContext context) {
    if (_showQuiz) return Scaffold(appBar: AppBar(title: const Text('Questions')), body: _buildQuiz());
    return Scaffold(
      appBar: AppBar(title: Text(widget.section.title)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Context info
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(color: Colors.purple.shade50, borderRadius: BorderRadius.circular(8)),
              child: Text('📋 ${widget.section.context}', style: const TextStyle(fontSize: 14)),
            ),
            const SizedBox(height: 16),
            // Key Vocabulary
            if (widget.section.keyVocabulary.isNotEmpty)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(color: Colors.amber.shade50, borderRadius: BorderRadius.circular(8), border: Border.all(color: Colors.amber.shade200)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('📚 Pelajari dulu kata-kata ini:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                    const SizedBox(height: 8),
                    ...widget.section.keyVocabulary.entries.map((e) => Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('• ${e.key}', style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
                          const Text(' — ', style: TextStyle(fontSize: 13)),
                          Expanded(child: Text(e.value, style: const TextStyle(fontSize: 13, color: Colors.grey))),
                        ],
                      ),
                    )),
                  ],
                ),
              ),
            const SizedBox(height: 20),
            // Play button
            Icon(_isPlaying ? Icons.graphic_eq : Icons.headphones, size: 80, color: Colors.purple),
            const SizedBox(height: 16),
            const Text('Dengarkan audio, lalu jawab pertanyaan', style: TextStyle(color: Colors.grey, fontSize: 13)),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: _isPlaying ? null : _play,
                  icon: const Icon(Icons.play_arrow),
                  label: Text(_hasListened ? 'Play Again' : 'Play Audio'),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
                ),
                const SizedBox(width: 12),
                if (_isPlaying) ElevatedButton.icon(onPressed: _stop, icon: const Icon(Icons.stop), label: const Text('Stop')),
              ],
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => setState(() => _showQuiz = true),
                child: const Text('Answer Questions'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuiz() {
    final questions = widget.section.questions;
    if (_qi >= questions.length) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(_score >= questions.length * 0.7 ? Icons.emoji_events : Icons.check_circle, size: 64, color: _score >= questions.length * 0.7 ? Colors.amber : Colors.green),
            Text('$_score/${questions.length}', style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
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
          Text('Q${_qi + 1}/${questions.length}', style: const TextStyle(color: Colors.grey)),
          const SizedBox(height: 8),
          Text(q.question, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          ...List.generate(q.options.length, (i) {
            Color? color;
            if (_showResult) { if (i == q.correctIndex) color = Colors.green[100]; else if (i == _selected) color = Colors.red[100]; }
            return Card(color: color, child: ListTile(title: Text(q.options[i]), leading: Icon(_selected == i ? Icons.radio_button_checked : Icons.radio_button_unchecked, color: _selected == i ? Colors.blue : null), onTap: _showResult ? null : () => setState(() => _selected = i)));
          }),
          if (_showResult) Container(margin: const EdgeInsets.only(top: 8), padding: const EdgeInsets.all(12), decoration: BoxDecoration(color: Colors.blue[50], borderRadius: BorderRadius.circular(8)), child: Text('💡 ${q.explanation}', style: const TextStyle(fontSize: 13))),
          const Spacer(),
          SizedBox(width: double.infinity, child: ElevatedButton(
            onPressed: _selected == null ? null : () {
              if (!_showResult) { setState(() { _showResult = true; if (_selected == q.correctIndex) _score++; }); }
              else { setState(() { _qi++; _selected = null; _showResult = false; }); }
            },
            child: Text(_showResult ? 'Next' : 'Check'),
          )),
        ],
      ),
    );
  }
}
