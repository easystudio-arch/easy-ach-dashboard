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
  final List<QuizQuestion> questions;

  const ReadingPassage({required this.title, required this.text, required this.questions});
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
