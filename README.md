# EasyEnglish-B2

Interactive offline English learning app for B2 level (Upper-Intermediate). Built with Flutter for web deployment via GitHub Pages.

## Features

| Module | Description |
|--------|-------------|
| 📚 **Vocabulary** | 489 unique words across 10 topics with flashcards (flip to reveal). 49 daily sets mixing all topics. |
| 📖 **Grammar** | 5 advanced lessons: Mixed Conditionals, Reported Speech, Passive Voice, Relative Clauses, Inversion. |
| 📄 **Reading** | 3 passages with comprehension questions (Remote Work, AI Ethics, Climate Change). |
| 🎧 **Listening** | Text-to-Speech dictation with playback controls. |
| 🗣️ **Speaking** | Karaoke-style shadowing with word-by-word highlighting. |
| 💬 **Conversation** | Role-play dialogues with turn-based practice. |
| ❓ **Quiz** | 15 mixed grammar & vocabulary questions. |
| ⚡ **Speak Fast** | Running text (bottom→top) with TTS at adjustable speed (0.5x–2.0x). 5 themes: Casual, Reflection, English is Easy, Business, Technology. |
| 🔄 **Translate** | Indonesian→English translation practice. 3 levels: Beginner (A1-A2), Intermediate (B1-B2), Advanced (C1-C2). |
| 📊 **Progress** | Track vocabulary learned, quizzes completed, and study streaks. |

## Tech Stack

- **Flutter** (web)
- **flutter_tts** – browser-based Text-to-Speech (offline)
- **shared_preferences** – local progress storage
- **flip_card** – vocabulary flashcard animations
- **Material 3** – blue color scheme, consistent theming

## 100% Offline

No internet required after initial load. All content is bundled in the compiled app:
- Vocabulary, grammar, reading passages are hardcoded
- TTS uses the browser's built-in `speechSynthesis` API
- Progress saved in `localStorage`

## Build & Deploy

```bash
flutter clean
flutter pub get
flutter build web --base-href /english-course/ --release
```

> ⚠️ If using Git Bash, prefix with `MSYS_NO_PATHCONV=1` to avoid path conversion.

### Deploy to GitHub Pages

```bash
robocopy build\web docs /MIR
git add .
git commit -m "deploy web"
git push
```

Configure GitHub Pages to serve from `/docs` folder on `master` branch.

## Project Structure

```
lib/
├── main.dart                  # App entry, Material 3 theme
├── data/
│   ├── content_provider.dart  # Grammar, reading, quiz, listening data
│   ├── vocab_data.dart        # Daily words logic & Business/Travel words
│   ├── vocab_academic_health.dart
│   ├── vocab_tech_media.dart
│   ├── vocab_env_relationships.dart
│   └── vocab_law_food.dart
├── models/
│   └── models.dart            # VocabWord, GrammarLesson, etc.
├── screens/
│   ├── home_screen.dart       # Main grid navigation
│   ├── vocabulary_screen.dart # Daily & topic flashcards
│   ├── grammar_screen.dart
│   ├── reading_screen.dart
│   ├── listening_screen.dart
│   ├── speaking_screen.dart
│   ├── conversation_screen.dart
│   ├── quiz_screen.dart
│   ├── speak_fast_screen.dart # Running text + TTS speed practice
│   ├── translate_screen.dart  # Indonesian→English with levels
│   └── progress_screen.dart
└── services/
    └── progress_service.dart  # SharedPreferences wrapper
```

## Vocabulary Topics (10)

Business, Travel, Academic, Health, Technology, Media, Environment, Relationships, Law, Food & Culture

Each topic has 50 words. Daily words are interleaved across all topics for variety.

## License

MIT
