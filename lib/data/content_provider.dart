import '../models/models.dart';

class ContentProvider {
  static const List<VocabWord> vocabularyB2 = [
    VocabWord(word: 'acknowledge', definition: 'To accept or admit the existence or truth of something', example: 'She acknowledged that the project had some flaws.', partOfSpeech: 'verb'),
    VocabWord(word: 'ambiguous', definition: 'Open to more than one interpretation; not clear', example: 'The contract was deliberately ambiguous.', partOfSpeech: 'adjective'),
    VocabWord(word: 'comprehensive', definition: 'Including all or nearly all elements or aspects', example: 'We need a comprehensive review of the policy.', partOfSpeech: 'adjective'),
    VocabWord(word: 'deteriorate', definition: 'To become progressively worse', example: 'His health continued to deteriorate.', partOfSpeech: 'verb'),
    VocabWord(word: 'elaborate', definition: 'Involving many carefully arranged parts; detailed', example: 'Could you elaborate on your proposal?', partOfSpeech: 'verb/adjective'),
    VocabWord(word: 'fluctuate', definition: 'To rise and fall irregularly in number or amount', example: 'Oil prices fluctuate according to demand.', partOfSpeech: 'verb'),
    VocabWord(word: 'genuine', definition: 'Truly what something is said to be; authentic', example: 'She showed genuine concern for her colleagues.', partOfSpeech: 'adjective'),
    VocabWord(word: 'hypothesis', definition: 'A proposed explanation made on limited evidence', example: 'The scientist tested her hypothesis through experiments.', partOfSpeech: 'noun'),
    VocabWord(word: 'inevitable', definition: 'Certain to happen; unavoidable', example: 'Change is inevitable in any growing organization.', partOfSpeech: 'adjective'),
    VocabWord(word: 'justify', definition: 'To show or prove to be right or reasonable', example: 'How can you justify such excessive spending?', partOfSpeech: 'verb'),
    VocabWord(word: 'legitimate', definition: 'Conforming to the law or to rules; valid', example: 'They raised legitimate concerns about safety.', partOfSpeech: 'adjective'),
    VocabWord(word: 'manipulate', definition: 'To control or influence cleverly or unscrupulously', example: 'He was accused of trying to manipulate the results.', partOfSpeech: 'verb'),
    VocabWord(word: 'negligible', definition: 'So small or unimportant as to be not worth considering', example: 'The difference in cost was negligible.', partOfSpeech: 'adjective'),
    VocabWord(word: 'obsolete', definition: 'No longer produced or used; out of date', example: 'Technology has made many traditional skills obsolete.', partOfSpeech: 'adjective'),
    VocabWord(word: 'predominant', definition: 'Present as the strongest or main element', example: 'English is the predominant language in international business.', partOfSpeech: 'adjective'),
    VocabWord(word: 'reluctant', definition: 'Unwilling and hesitant; disinclined', example: 'She was reluctant to share her personal information.', partOfSpeech: 'adjective'),
    VocabWord(word: 'substantial', definition: 'Of considerable importance, size, or worth', example: 'They made substantial progress on the project.', partOfSpeech: 'adjective'),
    VocabWord(word: 'tentative', definition: 'Not certain or fixed; provisional', example: 'We have a tentative agreement to meet next week.', partOfSpeech: 'adjective'),
    VocabWord(word: 'undermine', definition: 'To damage or weaken gradually', example: 'Constant criticism can undermine a person\'s confidence.', partOfSpeech: 'verb'),
    VocabWord(word: 'versatile', definition: 'Able to adapt to many different functions or activities', example: 'She is a versatile performer who can sing and act.', partOfSpeech: 'adjective'),
    VocabWord(word: 'widespread', definition: 'Found or distributed over a large area', example: 'There is widespread support for the new policy.', partOfSpeech: 'adjective'),
    VocabWord(word: 'yield', definition: 'To produce or provide; to give way', example: 'The investment yielded a 10% return.', partOfSpeech: 'verb'),
    VocabWord(word: 'advocate', definition: 'To publicly recommend or support', example: 'She advocates for equal rights in the workplace.', partOfSpeech: 'verb/noun'),
    VocabWord(word: 'bureaucracy', definition: 'A system of government with many complicated rules', example: 'The bureaucracy slowed down the approval process.', partOfSpeech: 'noun'),
    VocabWord(word: 'contemplate', definition: 'To think about something deeply and at length', example: 'He contemplated changing careers.', partOfSpeech: 'verb'),
    VocabWord(word: 'discrepancy', definition: 'A lack of compatibility between facts or claims', example: 'There was a discrepancy between the two reports.', partOfSpeech: 'noun'),
    VocabWord(word: 'empirical', definition: 'Based on observation or experience rather than theory', example: 'The study provides empirical evidence for the theory.', partOfSpeech: 'adjective'),
    VocabWord(word: 'feasible', definition: 'Possible and practical to do easily', example: 'Is it feasible to complete the project by Friday?', partOfSpeech: 'adjective'),
    VocabWord(word: 'gratitude', definition: 'The quality of being thankful; readiness to show appreciation', example: 'She expressed her gratitude for their support.', partOfSpeech: 'noun'),
    VocabWord(word: 'hierarchy', definition: 'A system in which people are ranked according to status', example: 'The company has a strict management hierarchy.', partOfSpeech: 'noun'),
  ];

  static const List<GrammarLesson> grammarLessons = [
    GrammarLesson(
      title: 'Mixed Conditionals',
      explanation: 'Mixed conditionals combine different time references in the if-clause and main clause. Type 3 + Type 2: If + past perfect, would + infinitive (past condition, present result). Type 2 + Type 3: If + past simple, would have + past participle (present condition, past result).',
      examples: [
        'If I had studied medicine (past), I would be a doctor now (present). [3+2]',
        'If she spoke French (present), she would have got the job (past). [2+3]',
        'If they hadn\'t moved abroad, they would still live here.',
      ],
      exercises: [
        GrammarExercise(question: 'If I ___ harder at school, I ___ a better job now.', options: ['had worked / would have', 'had worked / would have had', 'worked / would have', 'had worked / would have'], correctIndex: 0),
        GrammarExercise(question: 'If she ___ so shy, she ___ to him at the party last night.', options: ['wasn\'t / would have talked', 'weren\'t / would have talked', 'hadn\'t been / would talk', 'weren\'t / would talk'], correctIndex: 1),
        GrammarExercise(question: 'If he ___ the train, he ___ here by now.', options: ['didn\'t miss / would be', 'hadn\'t missed / would be', 'hasn\'t missed / will be', 'wouldn\'t miss / would be'], correctIndex: 1),
      ],
    ),
    GrammarLesson(
      title: 'Reported Speech (Advanced)',
      explanation: 'In reported speech, we shift tenses back, change pronouns, and adjust time/place references. Advanced patterns include reporting questions, commands, suggestions, and using reporting verbs like claim, deny, insist, suggest, warn.',
      examples: [
        '"I\'ll finish it tomorrow" → He promised he would finish it the following day.',
        '"Don\'t touch that!" → She warned me not to touch that.',
        '"Why don\'t we go out?" → He suggested going out / that we go out.',
      ],
      exercises: [
        GrammarExercise(question: 'She said, "I have been waiting for two hours." → She said she ___ for two hours.', options: ['has been waiting', 'had been waiting', 'was waiting', 'waited'], correctIndex: 1),
        GrammarExercise(question: '"You should see a doctor," he said. → He ___ me to see a doctor.', options: ['told', 'said', 'advised', 'informed'], correctIndex: 2),
        GrammarExercise(question: '"I didn\'t steal the money," he said. → He ___ stealing the money.', options: ['refused', 'denied', 'rejected', 'declined'], correctIndex: 1),
      ],
    ),
    GrammarLesson(
      title: 'Passive Voice (Advanced)',
      explanation: 'Advanced passive constructions include: causative have/get (have something done), impersonal passive (It is said that...), passive with reporting verbs, and double object passives.',
      examples: [
        'It is believed that the company will merge. / The company is believed to be merging.',
        'I had my car repaired. (causative)',
        'She is said to have left the country.',
      ],
      exercises: [
        GrammarExercise(question: 'People believe he is innocent. → He ___ innocent.', options: ['is believed to be', 'is believed being', 'believes to be', 'was believed to be'], correctIndex: 0),
        GrammarExercise(question: 'I didn\'t fix my computer myself. I ___ it ___.', options: ['got / fixed', 'had / fix', 'got / fix', 'had / fixed'], correctIndex: 3),
        GrammarExercise(question: 'They say she left the country. → She is said ___ the country.', options: ['to leave', 'to have left', 'leaving', 'having left'], correctIndex: 1),
      ],
    ),
    GrammarLesson(
      title: 'Relative Clauses (Defining & Non-defining)',
      explanation: 'Defining clauses identify which person/thing we mean (no commas). Non-defining clauses add extra information (with commas). In defining clauses, who/which/that can be omitted when they are the object. Reduced relative clauses use participles.',
      examples: [
        'The book (that) I bought yesterday is fascinating. (defining, object - can omit)',
        'My sister, who lives in London, is visiting next week. (non-defining)',
        'The man standing at the door is my uncle. (reduced relative)',
      ],
      exercises: [
        GrammarExercise(question: 'The woman ___ car was stolen reported it to the police.', options: ['who', 'whose', 'which', 'whom'], correctIndex: 1),
        GrammarExercise(question: 'Paris, ___ is the capital of France, attracts millions of tourists.', options: ['that', 'which', 'where', 'what'], correctIndex: 1),
        GrammarExercise(question: 'The students ___ in the exam all passed.', options: ['participating', 'who participating', 'which participated', 'participated'], correctIndex: 0),
      ],
    ),
    GrammarLesson(
      title: 'Inversion for Emphasis',
      explanation: 'Inversion (putting auxiliary before subject) is used after negative/restrictive adverbials for emphasis: Never, Rarely, Seldom, Not only...but also, Hardly...when, No sooner...than, Only after/when, Under no circumstances.',
      examples: [
        'Never have I seen such a beautiful sunset.',
        'Not only did she win the race, but she also broke the record.',
        'Hardly had I arrived when the meeting started.',
      ],
      exercises: [
        GrammarExercise(question: 'Rarely ___ such talent in a young musician.', options: ['I have seen', 'have I seen', 'I saw', 'did I seen'], correctIndex: 1),
        GrammarExercise(question: 'Not only ___ the exam, but she also got the highest score.', options: ['she passed', 'did she pass', 'she did pass', 'passed she'], correctIndex: 1),
        GrammarExercise(question: 'No sooner ___ the door than the phone rang.', options: ['I had opened', 'had I opened', 'I opened', 'did I open'], correctIndex: 1),
      ],
    ),
  ];

  static const List<ReadingPassage> readingPassages = [
    ReadingPassage(
      title: 'The Future of Remote Work',
      text: '''The COVID-19 pandemic fundamentally transformed how we think about work. What was once considered a temporary measure has evolved into a permanent shift in workplace culture. Companies worldwide have discovered that remote work can be just as productive as traditional office-based work, if not more so.

However, this transition has not been without challenges. Many employees report feeling isolated and struggling to maintain work-life boundaries when their home doubles as their office. The lack of spontaneous interactions that occur naturally in physical workplaces has led some to question whether innovation and creativity might suffer in the long run.

Research from Stanford University suggests that hybrid models—combining remote and in-office work—may offer the best of both worlds. Employees benefit from the flexibility of working from home while still maintaining the social connections and collaborative opportunities that come with face-to-face interaction.

Critics argue that remote work exacerbates existing inequalities. Not everyone has access to a quiet workspace or reliable internet connection. Furthermore, younger employees who are just starting their careers may miss out on valuable mentoring opportunities that typically occur through informal office interactions.

Despite these concerns, the trend toward flexible work arrangements appears irreversible. Companies that refuse to adapt risk losing talent to more progressive competitors. The challenge now lies in developing management practices and technologies that support distributed teams effectively while preserving organizational culture and employee well-being.''',
      questions: [
        QuizQuestion(question: 'What does the passage suggest about the shift to remote work?', options: ['It is temporary', 'It is permanent', 'It has failed', 'It only works for tech companies'], correctIndex: 1, explanation: 'The passage states it "has evolved into a permanent shift in workplace culture."'),
        QuizQuestion(question: 'According to Stanford research, what model works best?', options: ['Fully remote', 'Fully in-office', 'Hybrid model', 'Rotating shifts'], correctIndex: 2, explanation: 'The passage mentions Stanford research suggesting "hybrid models may offer the best of both worlds."'),
        QuizQuestion(question: 'What concern is raised about younger employees?', options: ['They are less productive', 'They miss mentoring opportunities', 'They prefer office work', 'They lack technical skills'], correctIndex: 1, explanation: 'The passage states younger employees "may miss out on valuable mentoring opportunities."'),
        QuizQuestion(question: 'What does "exacerbates" mean in this context?', options: ['Reduces', 'Makes worse', 'Eliminates', 'Highlights'], correctIndex: 1, explanation: '"Exacerbates" means to make a problem or situation worse.'),
      ],
    ),
    ReadingPassage(
      title: 'Artificial Intelligence and Ethics',
      text: '''As artificial intelligence becomes increasingly integrated into our daily lives, questions about its ethical implications have moved from academic discussions to urgent policy debates. From facial recognition systems used by law enforcement to algorithms that determine creditworthiness, AI systems are making decisions that profoundly affect people's lives.

One of the most pressing concerns is algorithmic bias. AI systems learn from historical data, which often reflects existing societal prejudices. When these biased datasets are used to train algorithms, the resulting systems can perpetuate and even amplify discrimination. Studies have shown that facial recognition technology, for instance, has significantly higher error rates for people with darker skin tones.

Transparency presents another significant challenge. Many modern AI systems, particularly deep learning models, operate as "black boxes"—their decision-making processes are opaque even to their creators. This lack of explainability raises serious concerns in contexts where individuals have a right to understand why a particular decision was made about them.

The question of accountability is equally complex. When an autonomous vehicle causes an accident or an AI system denies someone a loan unfairly, determining who bears responsibility—the developer, the company deploying the system, or the system itself—remains legally and philosophically unresolved.

Proponents of AI regulation argue that without proper oversight, the technology could undermine fundamental rights and democratic values. Others contend that excessive regulation could stifle innovation and put countries at a competitive disadvantage. Finding the right balance between fostering innovation and protecting citizens will be one of the defining challenges of our era.''',
      questions: [
        QuizQuestion(question: 'What is "algorithmic bias" according to the passage?', options: ['A programming error', 'AI learning from prejudiced historical data', 'A type of computer virus', 'Intentional discrimination by programmers'], correctIndex: 1, explanation: 'The passage explains that AI systems "learn from historical data, which often reflects existing societal prejudices."'),
        QuizQuestion(question: 'Why are deep learning models called "black boxes"?', options: ['They are painted black', 'Their processes are opaque even to creators', 'They are stored in black containers', 'They only work in the dark'], correctIndex: 1, explanation: 'The passage states their "decision-making processes are opaque even to their creators."'),
        QuizQuestion(question: 'What is the main argument against AI regulation?', options: ['It is unnecessary', 'It could stifle innovation', 'AI is always fair', 'Regulation is too expensive'], correctIndex: 1, explanation: 'Critics "contend that excessive regulation could stifle innovation and put countries at a competitive disadvantage."'),
        QuizQuestion(question: 'The word "opaque" in the passage is closest in meaning to:', options: ['Transparent', 'Not clear or understandable', 'Colorful', 'Simple'], correctIndex: 1, explanation: '"Opaque" means not transparent; difficult to understand.'),
      ],
    ),
    ReadingPassage(
      title: 'Climate Change and Urban Planning',
      text: '''Cities around the world are grappling with the dual challenge of reducing their carbon footprint while simultaneously adapting to the effects of climate change that are already underway. Urban areas account for approximately 70% of global carbon emissions, making them both a major contributor to the problem and a crucial part of the solution.

Progressive cities have begun implementing ambitious plans to transform their infrastructure. Copenhagen aims to become carbon-neutral by 2025, while Paris has introduced sweeping changes to reduce car dependency, including converting major roads into pedestrian and cycling zones. Singapore is pioneering the concept of a "city in a garden," integrating green spaces into every aspect of urban design.

Green building standards have evolved significantly in recent years. Modern sustainable architecture goes beyond simple energy efficiency to encompass the entire lifecycle of a building, from the sourcing of materials to eventual demolition. Living walls, rooftop gardens, and passive cooling systems are becoming standard features rather than luxury additions.

Public transportation remains the backbone of sustainable urban mobility. Cities that have invested heavily in metro systems, bus rapid transit, and cycling infrastructure have seen measurable reductions in per-capita emissions. However, the transition away from private vehicles requires not just infrastructure investment but also a fundamental shift in cultural attitudes toward car ownership.

The concept of the "15-minute city"—where all essential services are accessible within a 15-minute walk or bike ride—has gained considerable traction. This model not only reduces emissions but also enhances quality of life by fostering stronger community connections and reducing time spent commuting.''',
      questions: [
        QuizQuestion(question: 'What percentage of global carbon emissions do urban areas account for?', options: ['50%', '60%', '70%', '80%'], correctIndex: 2, explanation: 'The passage states "Urban areas account for approximately 70% of global carbon emissions."'),
        QuizQuestion(question: 'What is Copenhagen\'s carbon-neutral target year?', options: ['2020', '2025', '2030', '2050'], correctIndex: 1, explanation: 'The passage mentions "Copenhagen aims to become carbon-neutral by 2025."'),
        QuizQuestion(question: 'What does the "15-minute city" concept mean?', options: ['A city built in 15 minutes', 'All services accessible within 15-minute walk/bike', 'A city with 15-minute commutes by car', 'A city planning model taking 15 minutes to design'], correctIndex: 1, explanation: 'The passage defines it as where "all essential services are accessible within a 15-minute walk or bike ride."'),
        QuizQuestion(question: 'The word "grappling" in the first paragraph means:', options: ['Ignoring', 'Struggling to deal with', 'Celebrating', 'Measuring'], correctIndex: 1, explanation: '"Grappling" means struggling or wrestling with a difficult problem.'),
      ],
    ),
  ];

  static const List<QuizQuestion> generalQuiz = [
    QuizQuestion(question: 'Choose the correct sentence:', options: ['If I would have known, I would have come.', 'If I had known, I would have come.', 'If I knew, I would have come.', 'If I have known, I would come.'], correctIndex: 1, explanation: 'Third conditional: If + past perfect, would have + past participle.'),
    QuizQuestion(question: 'The report ___ by the time the meeting starts.', options: ['will be finished', 'will have been finished', 'is finished', 'has been finished'], correctIndex: 1, explanation: 'Future perfect passive for an action completed before a future time.'),
    QuizQuestion(question: '"I didn\'t take the money," he said. → He ___ taking the money.', options: ['refused', 'denied', 'rejected', 'objected'], correctIndex: 1, explanation: 'Deny + gerund is used for reported denials.'),
    QuizQuestion(question: 'Not until I got home ___ I had left my wallet at the office.', options: ['I realized', 'did I realize', 'I did realize', 'realized I'], correctIndex: 1, explanation: 'Inversion after "Not until" - auxiliary before subject.'),
    QuizQuestion(question: 'She ___ have left already; her coat is still here.', options: ['must', 'can\'t', 'might', 'should'], correctIndex: 1, explanation: 'Can\'t have + past participle expresses impossibility about the past.'),
    QuizQuestion(question: 'The project was completed ___ schedule and ___ budget.', options: ['ahead of / under', 'before / below', 'in front of / beneath', 'prior / less'], correctIndex: 0, explanation: '"Ahead of schedule" and "under budget" are fixed collocations.'),
    QuizQuestion(question: 'I wish I ___ more time to prepare for the presentation.', options: ['have', 'had', 'would have', 'had had'], correctIndex: 1, explanation: 'Wish + past simple for present unreal situations.'),
    QuizQuestion(question: 'The more you practice, ___', options: ['the better you get.', 'you get better.', 'the best you get.', 'better you get.'], correctIndex: 0, explanation: 'Comparative correlative structure: The more...the more/better.'),
    QuizQuestion(question: 'He acted as if he ___ the owner of the company.', options: ['is', 'were', 'has been', 'would be'], correctIndex: 1, explanation: 'As if/as though + past subjunctive (were) for unreal present.'),
    QuizQuestion(question: 'By this time next year, I ___ here for a decade.', options: ['will work', 'will be working', 'will have been working', 'am working'], correctIndex: 2, explanation: 'Future perfect continuous for duration up to a future point.'),
    QuizQuestion(question: '___ the weather, we decided to go hiking.', options: ['Despite of', 'In spite of', 'Although', 'However'], correctIndex: 1, explanation: '"In spite of" + noun/gerund. "Despite of" is incorrect.'),
    QuizQuestion(question: 'She\'s the kind of person ___ everyone trusts.', options: ['who', 'whom', 'which', 'whose'], correctIndex: 1, explanation: '"Whom" is the object of "trusts" in the relative clause (formal).'),
    QuizQuestion(question: 'It\'s high time we ___ a decision.', options: ['make', 'made', 'have made', 'will make'], correctIndex: 1, explanation: '"It\'s high time" + past simple for something that should happen now.'),
    QuizQuestion(question: 'The CEO, along with the board members, ___ to attend.', options: ['are expected', 'is expected', 'were expected', 'have been expected'], correctIndex: 1, explanation: 'Subject-verb agreement: "along with" doesn\'t change the singular subject.'),
    QuizQuestion(question: 'Under no circumstances ___ this information to anyone.', options: ['you should reveal', 'should you reveal', 'you reveal', 'reveal you'], correctIndex: 1, explanation: 'Inversion after "Under no circumstances" - auxiliary before subject.'),
  ];

  static const List<String> listeningTexts = [
    'The ability to communicate effectively in English has become increasingly important in today\'s globalized world. Whether you\'re conducting business negotiations, presenting research findings, or simply traveling abroad, proficiency in English opens doors to countless opportunities.',
    'Climate change represents one of the most significant challenges facing humanity today. Scientists have reached a consensus that human activities, particularly the burning of fossil fuels, are the primary drivers of global warming. The consequences include rising sea levels, more frequent extreme weather events, and disruptions to ecosystems worldwide.',
    'The digital revolution has transformed virtually every aspect of modern life. From how we communicate and consume information to how we work and entertain ourselves, technology has reshaped our daily routines in ways that would have been unimaginable just a few decades ago.',
    'Education systems around the world are undergoing significant reforms as societies recognize the need to prepare students for a rapidly changing job market. Traditional models of rote learning are giving way to approaches that emphasize critical thinking, creativity, and collaboration.',
    'The concept of sustainable development seeks to balance economic growth with environmental protection and social equity. It recognizes that the resources of our planet are finite and that current patterns of consumption cannot continue indefinitely without severe consequences for future generations.',
  ];
}
