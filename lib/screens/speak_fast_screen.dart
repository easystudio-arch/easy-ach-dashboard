import 'dart:async';
import 'package:flutter/material.dart';
import '../services/progress_service.dart';
import '../services/tts_service.dart';

class SpeakFastScreen extends StatefulWidget {
  const SpeakFastScreen({super.key});

  @override
  State<SpeakFastScreen> createState() => _SpeakFastScreenState();
}

class _SpeakFastScreenState extends State<SpeakFastScreen> {
  final _tts = TtsService.instance;
  String _selectedLevel = 'Medium';
  late String _theme = ProgressService.getLastString('speakfast_theme').isEmpty ? 'Casual' : ProgressService.getLastString('speakfast_theme');
  double _speed = 1.0;
  late int _currentLine = ProgressService.getLastPosition('speakfast_line');
  bool _isPlaying = false;
  bool _soundOn = true;
  String _accent = TtsService.currentAccent;
  final ScrollController _scrollCtrl = ScrollController();

  static const Map<String, Map<String, List<String>>> _content = {
    'Easy': {
      'Casual': [
        "Hi! How are you?",
        "I am fine, thank you.",
        "What is your name?",
        "My name is John.",
        "Nice to meet you!",
        "Where are you from?",
        "I am from Indonesia.",
        "Do you like coffee?",
        "Yes, I love coffee.",
        "Let's go to the cafe.",
        "Okay, sounds good!",
        "See you tomorrow!",
        "Have a nice day!",
        "Goodbye, my friend!",
        "Take care!",
      ],
      'Reflection': [
        "I can do this.",
        "I am learning every day.",
        "Mistakes are okay.",
        "I will not give up.",
        "Small steps matter.",
        "I am getting better.",
        "Practice makes perfect.",
        "I believe in myself.",
        "Today is a good day to learn.",
        "I am proud of my progress.",
        "Keep trying. Keep going.",
        "One word at a time.",
        "I am brave for trying.",
        "Every day is a new chance.",
        "I love learning English!",
      ],
      'English is Easy': [
        "Hello. Goodbye. Thank you.",
        "Yes. No. Please.",
        "I like. I want. I need.",
        "This is a book.",
        "That is a cat.",
        "I go to school.",
        "She is my friend.",
        "He is a teacher.",
        "We are happy.",
        "They are nice people.",
        "I eat rice every day.",
        "I drink water.",
        "The sun is hot.",
        "The sky is blue.",
        "English is fun!",
      ],
      'Business': [
        "Hello, nice to meet you.",
        "My name is Sarah.",
        "I work in an office.",
        "Can I help you?",
        "Thank you very much.",
        "Please sit down.",
        "Here is my card.",
        "The meeting is at ten.",
        "I will send an email.",
        "Have a good day!",
        "See you on Monday.",
        "The report is ready.",
        "Can you call me back?",
        "I agree with you.",
        "Let's work together.",
      ],
      'Technology': [
        "I have a phone.",
        "I use the internet.",
        "This is my computer.",
        "I send messages online.",
        "I watch videos on YouTube.",
        "I take photos with my phone.",
        "Wi-Fi is very useful.",
        "I download apps.",
        "I play games on my tablet.",
        "Technology helps us.",
        "I charge my phone at night.",
        "Email is fast and easy.",
        "I search on Google.",
        "Smartphones are everywhere.",
        "I like using technology.",
      ],
    },
    'Medium': {
      'Casual': [
        "Hey, what's up? How's it going?",
        "I'm doing great, thanks for asking.",
        "Did you catch that new show on Netflix?",
        "Yeah, it's amazing. I binged it all weekend.",
        "We should hang out sometime this week.",
        "Let me grab a coffee first, then we'll talk.",
        "No worries, take your time.",
        "By the way, have you tried that new restaurant?",
        "Honestly, the food was incredible.",
        "I'll send you the location, you gotta try it.",
        "Sounds like a plan! Let's go Friday.",
        "Cool, I'll hit you up later then.",
        "Alright, catch you later! Take care.",
        "Oh wait, one more thing before you go.",
        "Can you pick me up on the way there?",
        "Sure thing, no problem at all.",
        "You're the best. See you Friday!",
        "Don't forget to bring your appetite!",
        "Ha! Trust me, I always do.",
        "Later, dude. Have a good one!",
      ],
      'Reflection': [
        "Learning a language is a journey, not a race.",
        "Every mistake you make is a step forward.",
        "Don't compare your chapter one to someone's chapter twenty.",
        "The fact that you're trying already makes you brave.",
        "Fluency is not about perfection, it's about connection.",
        "Speak even when you're scared. That's how you grow.",
        "Your accent is proof that you know more than one language.",
        "Small progress is still progress. Keep going.",
        "The best time to start was yesterday. The next best time is now.",
        "Be patient with yourself. You're doing better than you think.",
        "Confidence comes from practice, not from waiting.",
        "Every word you learn opens a new door.",
        "It's okay to pause. It's not okay to quit.",
        "Celebrate the small wins. They add up.",
        "You don't need to be perfect to be understood.",
        "Speaking is a muscle. The more you use it, the stronger it gets.",
        "Believe in your progress, even when it feels slow.",
        "One conversation at a time, you're getting there.",
        "The world needs your voice. Don't hold it back.",
        "You are capable of more than you imagine.",
      ],
      'English is Easy': [
        "English is easy when you stop overthinking it.",
        "Just speak. Grammar will fix itself over time.",
        "Use simple words. Simple is powerful.",
        "I go, you go, we go. See? Easy pattern.",
        "Don't memorize rules. Memorize sentences.",
        "Listen more, stress less. Your brain will adapt.",
        "Think in English. Don't translate from your language.",
        "Repeat after me: I can speak English fluently.",
        "Short sentences are not wrong. They are clear.",
        "Want, need, like, have, do. Start with these.",
        "Past tense? Just add '-ed'. Most of the time.",
        "Questions? Put 'do' or 'does' first. Done.",
        "Prepositions are tricky, but you'll get used to them.",
        "Read out loud every day. Five minutes is enough.",
        "Copy how native speakers say things. That's natural learning.",
        "Songs, movies, podcasts. English is everywhere.",
        "Mistakes are free lessons. Make as many as you can.",
        "You already know more English than you realize.",
        "Keep it fun. Boring study kills motivation.",
        "You're reading this in English. See? You're already good!",
      ],
      'Business': [
        "Let's schedule a meeting to discuss the proposal.",
        "I'd like to follow up on our previous conversation.",
        "Could you send me the report by end of day?",
        "We need to align our strategy with market trends.",
        "I appreciate your input on this project.",
        "Let's circle back on this after the quarterly review.",
        "The deadline has been moved to next Friday.",
        "Please find attached the updated budget forecast.",
        "We're looking at a fifteen percent growth this quarter.",
        "I'd like to propose a new approach to this challenge.",
        "Teamwork and communication are key to our success.",
        "Let's streamline the process to improve efficiency.",
        "The client requested a revision of the contract.",
        "We'll need stakeholder approval before moving forward.",
        "Can you prepare a brief summary for the board?",
        "Our competitive advantage lies in innovation.",
        "Let's leverage our resources to maximize output.",
        "I'll take the lead on the new product launch.",
        "Risk management should be our top priority.",
        "Thank you for your professionalism and dedication.",
      ],
      'Technology': [
        "Artificial intelligence is transforming every industry.",
        "Cloud computing allows us to scale without limits.",
        "Cybersecurity threats are evolving every single day.",
        "Machine learning models need massive amounts of data.",
        "The future of work is remote and digital.",
        "APIs connect different systems seamlessly together.",
        "Blockchain technology ensures transparency and security.",
        "User experience design puts people first.",
        "Automation reduces human error and saves time.",
        "Open source software drives collaborative innovation.",
        "Data privacy is a fundamental human right.",
        "The Internet of Things connects billions of devices.",
        "Agile methodology helps teams deliver faster.",
        "Version control keeps your codebase organized and safe.",
        "Responsive design works on any screen size.",
        "Clean code is readable, maintainable, and testable.",
        "DevOps bridges the gap between development and operations.",
        "Quantum computing will revolutionize problem solving.",
        "Digital literacy is essential in the modern workplace.",
        "Technology is a tool. People are the solution.",
      ],
    },
    'Hard': {
      'Casual': [
        "I've been meaning to touch base with you about that collaborative project we discussed at the conference last month.",
        "Absolutely, I've been mulling it over and I think there's tremendous potential if we approach it from a multidisciplinary angle.",
        "What struck me was how the participants seamlessly integrated theoretical frameworks with practical applications.",
        "The networking opportunities alone justified the investment, not to mention the intellectual stimulation.",
        "I've been contemplating whether we should pivot our methodology based on the feedback we received.",
        "That's a fair point. The constructive criticism highlighted some blind spots in our preliminary analysis.",
        "We should probably reconvene with the stakeholders before making any irreversible commitments.",
        "Agreed. Let me consolidate our findings and circulate a comprehensive brief before the end of the week.",
        "I appreciate your thoroughness. It's refreshing to work with someone who values meticulous preparation.",
        "Likewise. I've found that our complementary skill sets create a synergy that's genuinely productive.",
        "One thing I've noticed is that our communication style has evolved considerably since we started collaborating.",
        "That's the hallmark of a strong professional relationship — adaptability and mutual respect.",
        "Should we perhaps formalize our arrangement with a memorandum of understanding?",
        "That might be premature, but establishing clear expectations and deliverables would certainly be beneficial.",
        "Perfect. I'll draft something preliminary and we can iterate from there.",
      ],
      'Reflection': [
        "The acquisition of linguistic proficiency is fundamentally an exercise in cognitive resilience and sustained deliberate practice.",
        "Neuroplasticity research confirms that the adult brain retains remarkable capacity for language acquisition when subjected to consistent immersive input.",
        "The phenomenon of interlanguage development suggests that errors are not failures but rather systematic approximations toward target language competence.",
        "Metacognitive awareness — the ability to monitor and regulate one's own learning processes — distinguishes exceptional language learners from average ones.",
        "The psychological concept of 'flow state' applies perfectly to language learning: optimal challenge combined with adequate skill creates deeply engaging experiences.",
        "Embracing ambiguity tolerance allows learners to function effectively in communicative situations despite incomplete linguistic knowledge.",
        "The sociocultural dimension of language acquisition reminds us that communication is inherently collaborative and contextually situated.",
        "Intrinsic motivation, driven by genuine curiosity and personal relevance, sustains learning far more effectively than external rewards or punishments.",
        "The Dunning-Kruger effect manifests in language learning when beginners overestimate their abilities and intermediates underestimate their considerable progress.",
        "Cognitive load theory suggests that distributed practice with adequate retrieval intervals optimizes long-term retention of linguistic structures.",
        "The transformative potential of multilingualism extends beyond communication to encompass enhanced executive function and cognitive flexibility.",
        "Identity negotiation through a second language creates opportunities for personal reinvention that monolingual speakers rarely experience.",
        "The integration of productive and receptive skills creates a virtuous cycle wherein each modality reinforces and enriches the others.",
        "Longitudinal commitment to incremental improvement yields compounding returns that are imperceptible daily but transformative annually.",
        "The ultimate measure of communicative competence is not grammatical accuracy but rather the ability to achieve one's communicative intentions effectively.",
      ],
      'English is Easy': [
        "The underlying systematicity of English morphosyntax becomes apparent when you analyze patterns rather than memorizing isolated exceptions.",
        "Phrasal verbs, despite their apparent arbitrariness, often follow consistent metaphorical mappings that facilitate acquisition when made explicit.",
        "The distinction between stative and dynamic verbs governs aspect usage in ways that become intuitive through extensive contextualized exposure.",
        "Collocational patterns — the habitual co-occurrence of lexical items — account for much of what distinguishes proficient from intermediate usage.",
        "Discourse markers and hedging devices are the sophisticated tools that transform competent speech into genuinely fluent, nuanced communication.",
        "The prosodic features of English — stress, rhythm, and intonation — carry semantic and pragmatic information that transcends individual word meaning.",
        "Register sensitivity — knowing how to calibrate formality to context — represents a dimension of competence that grammar books rarely address adequately.",
        "Ellipsis and substitution patterns in English conversation reveal that native speakers routinely omit recoverable information to maintain communicative efficiency.",
        "The acquisition of formulaic sequences and lexical bundles accelerates fluency by providing ready-made chunks that reduce real-time processing demands.",
        "Pragmatic competence — understanding implicature, presupposition, and speech acts — distinguishes truly advanced speakers from those with merely grammatical accuracy.",
        "The recursive nature of English syntax allows infinite complexity through embedding, yet everyday communication rarely exploits more than two or three levels.",
        "Derivational morphology provides productive word-formation rules that enable speakers to decode and generate novel vocabulary through systematic affixation.",
        "The English tense-aspect system, while complex, becomes manageable when understood as expressing temporal relationships rather than absolute time reference.",
        "Cross-linguistic transfer operates bidirectionally: your first language both facilitates and occasionally interferes with second language acquisition in predictable ways.",
        "The ultimate insight is that language proficiency is not a destination but a continuum along which even native speakers continue to develop throughout their lives.",
      ],
      'Business': [
        "The quarterly earnings report indicates a substantial deviation from our projected revenue targets, necessitating a comprehensive reassessment of our go-to-market strategy.",
        "We need to synthesize the quantitative findings from the market research with the qualitative insights gathered during stakeholder consultations.",
        "The organizational restructuring initiative will require meticulous change management to minimize disruption and maintain employee engagement throughout the transition.",
        "Our fiduciary responsibility to shareholders demands that we conduct rigorous due diligence before proceeding with the proposed acquisition.",
        "The competitive landscape has shifted dramatically, compelling us to differentiate through operational excellence rather than price competition alone.",
        "Cross-functional collaboration between product development and customer success teams is essential for achieving sustainable product-market fit.",
        "The implementation of enterprise resource planning systems typically encounters resistance during the initial adoption phase before demonstrating measurable ROI.",
        "Strategic partnerships with complementary organizations can accelerate market penetration while distributing the associated financial and operational risks.",
        "The board of directors has expressed concerns regarding our exposure to geopolitical volatility and its potential impact on supply chain continuity.",
        "Talent acquisition and retention strategies must evolve to address the expectations of a multigenerational workforce with increasingly diverse professional aspirations.",
        "The intellectual property portfolio requires periodic valuation and strategic management to maximize its contribution to our overall enterprise value.",
        "Regulatory compliance in multiple jurisdictions introduces considerable complexity that necessitates dedicated legal counsel and systematic monitoring frameworks.",
        "Our sustainability commitments must be substantiated with measurable metrics and transparent reporting to maintain credibility with environmentally conscious stakeholders.",
        "The digital transformation roadmap should prioritize initiatives that deliver near-term operational efficiency while laying foundations for long-term strategic capabilities.",
        "Executive leadership alignment on organizational priorities is the prerequisite for cascading strategic objectives effectively throughout the operational hierarchy.",
      ],
      'Technology': [
        "The convergence of edge computing and fifth-generation wireless networks enables unprecedented real-time data processing capabilities at the network periphery.",
        "Federated learning architectures address data sovereignty concerns by enabling collaborative model training without centralizing sensitive information.",
        "The emergence of neuromorphic computing paradigms promises to overcome the fundamental energy efficiency limitations of traditional von Neumann architectures.",
        "Zero-trust security frameworks represent a paradigmatic shift from perimeter-based defense to continuous verification of every access request regardless of origin.",
        "The technical debt accumulated through expedient architectural decisions inevitably compounds, ultimately constraining an organization's capacity for innovation and adaptation.",
        "Containerized microservices architectures facilitate independent deployment and scaling but introduce distributed systems complexity that demands sophisticated observability tooling.",
        "The ethical implications of generative artificial intelligence extend beyond intellectual property concerns to encompass fundamental questions about authenticity and epistemic trust.",
        "Homomorphic encryption enables computation on encrypted data without decryption, potentially resolving the tension between data utility and privacy protection.",
        "The proliferation of Internet of Things devices exponentially expands the attack surface, necessitating security-by-design principles throughout the hardware and software development lifecycle.",
        "Quantum error correction remains the principal obstacle to achieving fault-tolerant quantum computation at scales sufficient for practical cryptanalytic applications.",
        "The sustainability implications of large language model training — measured in carbon emissions and water consumption — demand more energy-efficient algorithmic approaches.",
        "Platform engineering has emerged as a discipline focused on reducing cognitive load for development teams through curated self-service infrastructure abstractions.",
        "The intersection of computer vision and natural language processing has yielded multimodal systems capable of sophisticated cross-domain reasoning and generation.",
        "Observability-driven development practices integrate telemetry collection and analysis throughout the software lifecycle rather than treating monitoring as an operational afterthought.",
        "The democratization of machine learning through automated model selection and hyperparameter optimization is simultaneously empowering and potentially dangerous without adequate domain expertise.",
      ],
    },
  };

  List<String> get _lines => _content[_selectedLevel]![_theme]!;

  @override
  void initState() {
    super.initState();
    _tts.awaitSpeakCompletion(true);
  }

  @override
  void dispose() {
    _tts.stop();
    _scrollCtrl.dispose();
    super.dispose();
  }

  Future<void> _play() async {
    setState(() => _isPlaying = true);
    await _tts.setSpeechRate(_speed * 0.5);

    for (int i = _currentLine; i < _lines.length && _isPlaying; i++) {
      if (!mounted) return;
      setState(() => _currentLine = i);
      ProgressService.saveLastPosition('speakfast_line', i);
      _scrollToLine(i);
      if (_soundOn) {
        await _tts.speak(_lines[i]);
      } else {
        await Future.delayed(Duration(milliseconds: (2000 / _speed).round()));
      }
      if (!_isPlaying) break;
    }
    if (mounted) setState(() => _isPlaying = false);
  }

  void _stop() {
    _tts.stop();
    setState(() => _isPlaying = false);
  }

  void _reset() {
    _stop();
    setState(() => _currentLine = 0);
    _scrollCtrl.animateTo(0, duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  void _scrollToLine(int index) {
    final target = index * 56.0;
    if (_scrollCtrl.hasClients) {
      _scrollCtrl.animateTo(target, duration: const Duration(milliseconds: 400), curve: Curves.ease);
    }
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: const Text('Speak Fast & Clear'),
        actions: [
          DropdownButton<String>(
            value: _accent,
            underline: const SizedBox(),
            items: TtsService.accents.keys.map((a) => DropdownMenuItem(value: a, child: Text(a, style: const TextStyle(fontSize: 13)))).toList(),
            onChanged: (v) { TtsService.setAccent(v!); setState(() => _accent = v); },
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Column(
        children: [
          // Theme selector
          // Level selector
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
            child: Row(
              children: ['Easy', 'Medium', 'Hard'].map((l) => Padding(
                padding: const EdgeInsets.only(right: 8),
                child: ChoiceChip(
                  label: Text(l, style: TextStyle(fontSize: 12, color: _selectedLevel == l ? Colors.white : null)),
                  selected: _selectedLevel == l,
                  selectedColor: l == 'Easy' ? Colors.green : l == 'Medium' ? Colors.orange : Colors.red,
                  onSelected: (_) { _stop(); setState(() { _selectedLevel = l; _currentLine = 0; }); ProgressService.saveLastPosition('speakfast_line', 0); },
                ),
              )).toList(),
            ),
          ),
          // Theme selector
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 4, offset: const Offset(0, 2))],
            ),
            child: SizedBox(
              height: 36,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: _content[_selectedLevel]!.keys.map((t) => Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: ChoiceChip(
                    label: Text(t, style: TextStyle(fontSize: 12, fontWeight: _theme == t ? FontWeight.w600 : FontWeight.normal, color: _theme == t ? Colors.white : cs.onSurfaceVariant)),
                    selected: _theme == t,
                    selectedColor: const Color(0xFF1E293B),
                    onSelected: (_) { _stop(); setState(() { _theme = t; _currentLine = 0; }); ProgressService.saveLastString('speakfast_theme', t); ProgressService.saveLastPosition('speakfast_line', 0); },
                  ),
                )).toList(),
              ),
            ),
          ),
          // Speed control
          Container(
            margin: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: Row(
              children: [
                Icon(Icons.speed, color: cs.primary, size: 18),
                const SizedBox(width: 8),
                Text('${_speed.toStringAsFixed(1)}x', style: TextStyle(color: cs.primary, fontWeight: FontWeight.bold, fontSize: 13)),
                Expanded(
                  child: Slider(
                    value: _speed,
                    min: 0.5,
                    max: 2.0,
                    divisions: 6,
                    onChanged: (v) => setState(() => _speed = v),
                  ),
                ),
              ],
            ),
          ),
          // Running text area
          Expanded(
            child: Container(
              margin: const EdgeInsets.fromLTRB(16, 8, 16, 0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey.shade200),
                boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.03), blurRadius: 8, offset: const Offset(0, 2))],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: ListView.builder(
                  controller: _scrollCtrl,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                  itemCount: _lines.length,
                  itemBuilder: (ctx, i) {
                    final isActive = i == _currentLine && _isPlaying;
                    final isPast = i < _currentLine;
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      height: 56,
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.symmetric(horizontal: isActive ? 12 : 0, vertical: 4),
                      decoration: BoxDecoration(
                        color: isActive ? cs.primary.withValues(alpha: 0.08) : Colors.transparent,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        _lines[i],
                        style: TextStyle(
                          fontSize: isActive ? 18 : 15,
                          height: 1.5,
                          fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
                          color: isActive ? cs.primary : isPast ? cs.onSurface.withValues(alpha: 0.35) : cs.onSurface.withValues(alpha: 0.85),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          // Controls
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 8, offset: const Offset(0, -2))],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.restart_alt, color: cs.onSurfaceVariant, size: 28),
                  onPressed: _reset,
                ),
                const SizedBox(width: 16),
                IconButton(
                  icon: Icon(_soundOn ? Icons.volume_up : Icons.volume_off, color: _soundOn ? cs.primary : Colors.grey, size: 28),
                  onPressed: () { if (_soundOn) _tts.stop(); setState(() => _soundOn = !_soundOn); },
                ),
                const SizedBox(width: 16),
                FloatingActionButton(
                  backgroundColor: const Color(0xFF1E293B),
                  foregroundColor: Colors.white,
                  onPressed: _isPlaying ? _stop : _play,
                  child: Icon(_isPlaying ? Icons.pause : Icons.play_arrow),
                ),
                const SizedBox(width: 16),
                IconButton(
                  icon: Icon(Icons.skip_next, color: cs.onSurfaceVariant, size: 28),
                  onPressed: _currentLine < _lines.length - 1
                      ? () { _stop(); setState(() => _currentLine++); ProgressService.saveLastPosition('speakfast_line', _currentLine); _scrollToLine(_currentLine); }
                      : null,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
