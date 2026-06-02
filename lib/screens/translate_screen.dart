import 'package:flutter/material.dart';

class TranslateScreen extends StatefulWidget {
  const TranslateScreen({super.key});

  @override
  State<TranslateScreen> createState() => _TranslateScreenState();
}

class _TranslateScreenState extends State<TranslateScreen> {
  String? _level;

  @override
  Widget build(BuildContext context) {
    if (_level == null) return _LevelSelect(onSelect: (l) => setState(() => _level = l));
    return _TranslatePlay(level: _level!, onBack: () => setState(() => _level = null));
  }
}

class _LevelSelect extends StatelessWidget {
  final ValueChanged<String> onSelect;
  const _LevelSelect({required this.onSelect});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Translate to English')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text('Choose your level:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          _levelCard('Beginner', 'A1-A2', 'Simple daily sentences', Colors.green, Icons.eco),
          _levelCard('Intermediate', 'B1-B2', 'Work, travel, opinions', Colors.orange, Icons.trending_up),
          _levelCard('Advanced', 'C1-C2', 'Complex grammar & idioms', Colors.red, Icons.psychology),
        ],
      ),
    );
  }

  Widget _levelCard(String title, String code, String desc, Color color, IconData icon) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: CircleAvatar(backgroundColor: color.withValues(alpha: 0.15), child: Icon(icon, color: color)),
        title: Text('$title ($code)', style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(desc),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () => onSelect(title),
      ),
    );
  }
}

class _TranslatePlay extends StatefulWidget {
  final String level;
  final VoidCallback onBack;
  const _TranslatePlay({required this.level, required this.onBack});

  @override
  State<_TranslatePlay> createState() => _TranslatePlayState();
}

class _TranslatePlayState extends State<_TranslatePlay> {
  final _ctrl = TextEditingController();
  int _index = 0;
  int _score = 0;
  String? _result;

  List<_QA> get _questions => _data[widget.level]!;
  _QA get _current => _questions[_index];

  void _check() {
    final input = _ctrl.text.trim().toLowerCase().replaceAll(RegExp(r'[^\w\s]'), '');
    final accepted = _current.answers.map((a) => a.toLowerCase().replaceAll(RegExp(r'[^\w\s]'), '')).toList();
    setState(() {
      _result = accepted.any((a) => a == input) ? 'correct' : 'wrong';
      if (_result == 'correct') _score++;
    });
  }

  void _next() {
    _ctrl.clear();
    setState(() { _index = (_index + 1) % _questions.length; _result = null; });
  }

  @override
  void dispose() { _ctrl.dispose(); super.dispose(); }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: widget.onBack),
        title: Text('${widget.level} Level'),
        actions: [Center(child: Padding(padding: const EdgeInsets.only(right: 16), child: Text('Score: $_score', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold))))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            LinearProgressIndicator(value: (_index + 1) / _questions.length),
            const SizedBox(height: 8),
            Text('${_index + 1} / ${_questions.length}', textAlign: TextAlign.center, style: TextStyle(color: Colors.grey[600])),
            const SizedBox(height: 24),
            Card(
              color: Colors.amber[50],
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(children: [
                  const Text('🇮🇩 Translate this:', style: TextStyle(fontSize: 14, color: Colors.grey)),
                  const SizedBox(height: 8),
                  Text(_current.indo, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                ]),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _ctrl,
              enabled: _result == null,
              decoration: InputDecoration(
                hintText: 'Type in English...',
                border: const OutlineInputBorder(),
                prefixIcon: const Icon(Icons.translate),
                suffixIcon: _result == null ? IconButton(icon: const Icon(Icons.send), onPressed: _ctrl.text.isNotEmpty ? _check : null) : null,
              ),
              onSubmitted: (_) => _result == null ? _check() : null,
              onChanged: (_) => setState(() {}),
              textInputAction: TextInputAction.done,
            ),
            const SizedBox(height: 16),
            if (_result == 'correct')
              Card(
                color: Colors.green[50],
                child: const Padding(
                  padding: EdgeInsets.all(16),
                  child: Row(children: [Icon(Icons.check_circle, color: Colors.green, size: 28), SizedBox(width: 12), Text('Correct! 🎉', style: TextStyle(fontSize: 18, color: Colors.green, fontWeight: FontWeight.bold))]),
                ),
              ),
            if (_result == 'wrong')
              Card(
                color: Colors.red[50],
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    const Row(children: [Icon(Icons.close, color: Colors.red, size: 28), SizedBox(width: 12), Text('Not quite! Correct answer:', style: TextStyle(fontSize: 16, color: Colors.red))]),
                    const SizedBox(height: 12),
                    ...(_current.answers.take(2).map((a) => Padding(padding: const EdgeInsets.only(bottom: 4), child: Text('✓ $a', style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.green))))),
                  ]),
                ),
              ),
            const Spacer(),
            if (_result != null)
              ElevatedButton.icon(onPressed: _next, icon: const Icon(Icons.arrow_forward), label: const Text('Next'), style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(14)))
            else
              ElevatedButton.icon(onPressed: _ctrl.text.isNotEmpty ? _check : null, icon: const Icon(Icons.check), label: const Text('Check Answer'), style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(14))),
          ],
        ),
      ),
    );
  }

  static const Map<String, List<_QA>> _data = {
    'Beginner': [
      _QA('Saya suka makan nasi', ['i like to eat rice', 'i like eating rice']),
      _QA('Ini adalah kucing saya', ['this is my cat']),
      _QA('Dia tinggal di Jakarta', ['she lives in jakarta', 'he lives in jakarta']),
      _QA('Saya punya dua saudara', ['i have two siblings', 'i have two brothers', 'i have two sisters']),
      _QA('Hari ini cuacanya cerah', ['today the weather is sunny', 'the weather is sunny today', 'it is sunny today']),
      _QA('Saya pergi ke sekolah', ['i go to school']),
      _QA('Air ini sangat dingin', ['this water is very cold', 'the water is very cold']),
      _QA('Ibu saya sedang memasak', ['my mother is cooking', 'my mom is cooking']),
      _QA('Saya bangun jam enam pagi', ['i wake up at six in the morning', 'i wake up at 6 am']),
      _QA('Mereka bermain di taman', ['they play in the park', 'they are playing in the park']),
      _QA('Buku itu di atas meja', ['the book is on the table']),
      _QA('Saya tidak suka kopi', ['i do not like coffee', 'i dont like coffee']),
      _QA('Dia adalah teman saya', ['she is my friend', 'he is my friend']),
      _QA('Kami pergi ke pantai kemarin', ['we went to the beach yesterday']),
      _QA('Tolong bantu saya', ['please help me']),
      _QA('Saya lapar', ['i am hungry']),
      _QA('Berapa umurmu?', ['how old are you']),
      _QA('Rumah saya dekat sini', ['my house is near here', 'my home is near here']),
      _QA('Dia sedang tidur', ['she is sleeping', 'he is sleeping']),
      _QA('Saya bisa berbicara bahasa Inggris', ['i can speak english']),
    ],
    'Intermediate': [
      _QA('Saya pergi ke pasar setiap hari Minggu', ['i go to the market every sunday']),
      _QA('Dia sedang membaca buku di perpustakaan', ['she is reading a book in the library', 'he is reading a book in the library']),
      _QA('Kami makan malam bersama keluarga', ['we have dinner with family', 'we eat dinner with family']),
      _QA('Saya harus pergi sekarang', ['i have to go now', 'i must go now']),
      _QA('Apakah kamu sudah makan?', ['have you eaten', 'have you eaten yet', 'did you eat yet']),
      _QA('Saya bekerja di sebuah perusahaan teknologi', ['i work at a technology company', 'i work in a tech company']),
      _QA('Dia lulus dari universitas tahun lalu', ['she graduated from university last year', 'he graduated from university last year']),
      _QA('Bos saya meminta saya untuk lembur', ['my boss asked me to work overtime']),
      _QA('Saya ingin melamar pekerjaan itu', ['i want to apply for that job', 'i would like to apply for that job']),
      _QA('Di mana stasiun kereta terdekat?', ['where is the nearest train station', 'where is the closest train station']),
      _QA('Pesawatnya terlambat dua jam', ['the flight is delayed two hours', 'the flight was delayed by two hours']),
      _QA('Saya kehilangan paspor saya', ['i lost my passport', 'i have lost my passport']),
      _QA('Menurut saya, pendidikan itu sangat penting', ['in my opinion education is very important', 'i think education is very important']),
      _QA('Film itu sangat membosankan', ['that movie was very boring', 'the movie was very boring']),
      _QA('Dia marah karena temannya berbohong', ['she is angry because her friend lied', 'he is angry because his friend lied']),
      _QA('Saya tidak mengerti apa yang kamu katakan', ['i do not understand what you said', 'i dont understand what you are saying']),
      _QA('Bisakah kamu menunjukkan jalan ke museum?', ['can you show me the way to the museum']),
      _QA('Saya sudah tinggal di sini selama lima tahun', ['i have lived here for five years', 'i have been living here for five years']),
      _QA('Kami sedang mengerjakan proyek baru', ['we are working on a new project']),
      _QA('Tolong sampaikan salam saya kepadanya', ['please give my regards to him', 'please give my regards to her', 'please say hello to him for me']),
    ],
    'Advanced': [
      _QA('Jika saya punya uang lebih, saya akan traveling keliling dunia', ['if i had more money i would travel around the world']),
      _QA('Masalah ini harus diselesaikan secepatnya', ['this problem must be solved as soon as possible', 'this issue must be resolved as soon as possible']),
      _QA('Dia disarankan untuk istirahat oleh dokter', ['she was advised to rest by the doctor', 'he was advised to rest by the doctor']),
      _QA('Semakin banyak kamu berlatih, semakin baik hasilnya', ['the more you practice the better the result', 'the more you practice the better the results']),
      _QA('Andai saya belajar lebih giat waktu sekolah', ['i wish i had studied harder in school', 'if only i had studied harder in school']),
      _QA('Bukan hanya dia yang bertanggung jawab, tetapi juga timnya', ['not only is he responsible but also his team', 'not only is she responsible but also her team']),
      _QA('Seandainya saya tidak terlambat, saya tidak akan ketinggalan kereta', ['if i had not been late i would not have missed the train']),
      _QA('Dia mengaku tidak terlibat dalam insiden itu', ['he denied being involved in the incident', 'she denied being involved in the incident']),
      _QA('Perusahaan itu dikabarkan akan merger bulan depan', ['the company is reported to be merging next month', 'the company is said to be merging next month']),
      _QA('Tidak pernah sekalipun saya merasa sefrustasi ini', ['never have i felt so frustrated', 'never have i felt this frustrated']),
      _QA('Meskipun hujan deras, mereka tetap pergi', ['despite the heavy rain they still went', 'although it was raining heavily they still went', 'in spite of the heavy rain they still went']),
      _QA('Dia terlalu bangga untuk meminta maaf', ['she is too proud to apologize', 'he is too proud to apologize']),
      _QA('Kita harus mempertimbangkan semua kemungkinan sebelum mengambil keputusan', ['we must consider all possibilities before making a decision', 'we should consider all possibilities before making a decision']),
      _QA('Proyek itu akan selesai pada saat kamu kembali', ['the project will have been completed by the time you return', 'the project will be finished by the time you come back']),
      _QA('Dia berperilaku seolah-olah tidak terjadi apa-apa', ['she behaved as if nothing had happened', 'he acted as if nothing happened']),
      _QA('Sudah saatnya pemerintah mengambil tindakan tegas', ['it is high time the government took firm action', 'it is about time the government took decisive action']),
      _QA('Saya lebih suka diberi tahu daripada dibohongi', ['i would rather be told the truth than be lied to', 'i prefer being told the truth to being lied to']),
      _QA('Kalau bukan karena bantuanmu, saya pasti gagal', ['if it had not been for your help i would have failed', 'had it not been for your help i would have failed']),
      _QA('Dia dianggap sebagai ahli di bidangnya', ['she is considered an expert in her field', 'he is regarded as an expert in his field']),
      _QA('Keputusan itu tidak seharusnya diambil tanpa persetujuan semua pihak', ['that decision should not have been made without the consent of all parties', 'the decision should not have been taken without everyones approval']),
    ],
  };
}

class _QA {
  final String indo;
  final List<String> answers;
  const _QA(this.indo, this.answers);
}
