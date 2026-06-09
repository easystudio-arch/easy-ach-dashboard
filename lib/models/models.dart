class VocabWord {
  final String word;
  final String definition;
  final String example;
  final String partOfSpeech;
  final String translation;

  const VocabWord({required this.word, required this.definition, required this.example, required this.partOfSpeech, this.translation = ''});
}

class GrammarLesson {
  final String title;
  final String explanation;
  final List<String> examples;
  final List<GrammarExercise> exercises;

  const GrammarLesson({required this.title, required this.explanation, required this.examples, required this.exercises});
}

class GrammarExercise {
  final String question;
  final List<String> options;
  final int correctIndex;

  const GrammarExercise({required this.question, required this.options, required this.correctIndex});
}

class ReadingPassage {
  final String title;
  final String text;
  final String category;
  final String level;
  final List<QuizQuestion> questions;

  const ReadingPassage({required this.title, required this.text, required this.category, required this.questions, this.level = 'Medium'});
}

class SpeakingText {
  final String title;
  final String text;
  final String category;
  final String level;

  const SpeakingText({required this.title, required this.text, required this.category, this.level = 'Medium'});
}

class QuizQuestion {
  final String question;
  final List<String> options;
  final int correctIndex;
  final String? explanation;

  const QuizQuestion({required this.question, required this.options, required this.correctIndex, this.explanation});
}

class LessonUnit {
  final String title;
  final String description;
  final int unitNumber;

  const LessonUnit({required this.title, required this.description, required this.unitNumber});
}


// --- IELTS Models ---
class IeltsReadingPassage {
  final String title;
  final String passage;
  final String category; // Academic / General Training
  final List<IeltsQuestion> questions;
  final String tip;

  const IeltsReadingPassage({required this.title, required this.passage, required this.category, required this.questions, required this.tip});
}

class IeltsQuestion {
  final String question;
  final String type; // multiple_choice, true_false_ng, fill_blank
  final List<String> options;
  final int correctIndex;
  final String explanation;

  const IeltsQuestion({required this.question, required this.type, required this.options, required this.correctIndex, required this.explanation});
}

class IeltsListeningSection {
  final String title;
  final String audioText; // text for TTS
  final String context; // description of scenario
  final List<IeltsQuestion> questions;
  final Map<String, String> keyVocabulary; // word -> meaning in Indonesian

  const IeltsListeningSection({required this.title, required this.audioText, required this.context, required this.questions, this.keyVocabulary = const {}});
}

class IeltsWritingTask {
  final String taskType; // Task 1 / Task 2
  final String prompt;
  final String sampleAnswer;
  final List<String> tips;
  final List<String> usefulPhrases;

  const IeltsWritingTask({required this.taskType, required this.prompt, required this.sampleAnswer, required this.tips, required this.usefulPhrases});
}

class IeltsSpeakingPart {
  final String part; // Part 1, 2, 3
  final String topic;
  final List<String> questions;
  final List<String> sampleAnswers;
  final List<String> vocabulary;

  const IeltsSpeakingPart({required this.part, required this.topic, required this.questions, required this.sampleAnswers, required this.vocabulary});
}
