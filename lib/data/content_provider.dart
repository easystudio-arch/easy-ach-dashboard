import '../models/models.dart';

class ContentProvider {
  static const List<VocabWord> vocabularyB2 = [
    VocabWord(word: 'acknowledge', definition: 'To accept or admit the existence or truth of something', example: 'She acknowledged that the project had some flaws.', partOfSpeech: 'verb', translation: 'mengakui'),
    VocabWord(word: 'ambiguous', definition: 'Open to more than one interpretation; not clear', example: 'The contract was deliberately ambiguous.', partOfSpeech: 'adjective', translation: 'ambigu'),
    VocabWord(word: 'comprehensive', definition: 'Including all or nearly all elements or aspects', example: 'We need a comprehensive review of the policy.', partOfSpeech: 'adjective', translation: 'komprehensif'),
    VocabWord(word: 'deteriorate', definition: 'To become progressively worse', example: 'His health continued to deteriorate.', partOfSpeech: 'verb', translation: 'memburuk'),
    VocabWord(word: 'elaborate', definition: 'Involving many carefully arranged parts; detailed', example: 'Could you elaborate on your proposal?', partOfSpeech: 'verb/adjective', translation: 'menjelaskan lebih rinci'),
    VocabWord(word: 'fluctuate', definition: 'To rise and fall irregularly in number or amount', example: 'Oil prices fluctuate according to demand.', partOfSpeech: 'verb', translation: 'berfluktuasi'),
    VocabWord(word: 'genuine', definition: 'Truly what something is said to be; authentic', example: 'She showed genuine concern for her colleagues.', partOfSpeech: 'adjective', translation: 'asli'),
    VocabWord(word: 'hypothesis', definition: 'A proposed explanation made on limited evidence', example: 'The scientist tested her hypothesis through experiments.', partOfSpeech: 'noun', translation: 'hipotesis'),
    VocabWord(word: 'inevitable', definition: 'Certain to happen; unavoidable', example: 'Change is inevitable in any growing organization.', partOfSpeech: 'adjective', translation: 'tidak terhindarkan'),
    VocabWord(word: 'justify', definition: 'To show or prove to be right or reasonable', example: 'How can you justify such excessive spending?', partOfSpeech: 'verb', translation: 'membenarkan'),
    VocabWord(word: 'legitimate', definition: 'Conforming to the law or to rules; valid', example: 'They raised legitimate concerns about safety.', partOfSpeech: 'adjective', translation: 'sah'),
    VocabWord(word: 'manipulate', definition: 'To control or influence cleverly or unscrupulously', example: 'He was accused of trying to manipulate the results.', partOfSpeech: 'verb', translation: 'memanipulasi'),
    VocabWord(word: 'negligible', definition: 'So small or unimportant as to be not worth considering', example: 'The difference in cost was negligible.', partOfSpeech: 'adjective', translation: 'dapat diabaikan'),
    VocabWord(word: 'obsolete', definition: 'No longer produced or used; out of date', example: 'Technology has made many traditional skills obsolete.', partOfSpeech: 'adjective', translation: 'usang'),
    VocabWord(word: 'predominant', definition: 'Present as the strongest or main element', example: 'English is the predominant language in international business.', partOfSpeech: 'adjective', translation: 'dominan'),
    VocabWord(word: 'reluctant', definition: 'Unwilling and hesitant; disinclined', example: 'She was reluctant to share her personal information.', partOfSpeech: 'adjective', translation: 'enggan'),
    VocabWord(word: 'substantial', definition: 'Of considerable importance, size, or worth', example: 'They made substantial progress on the project.', partOfSpeech: 'adjective', translation: 'substansial'),
    VocabWord(word: 'tentative', definition: 'Not certain or fixed; provisional', example: 'We have a tentative agreement to meet next week.', partOfSpeech: 'adjective', translation: 'tentatif'),
    VocabWord(word: 'undermine', definition: 'To damage or weaken gradually', example: 'Constant criticism can undermine a person\'s confidence.', partOfSpeech: 'verb', translation: 'melemahkan'),
    VocabWord(word: 'versatile', definition: 'Able to adapt to many different functions or activities', example: 'She is a versatile performer who can sing and act.', partOfSpeech: 'adjective', translation: 'serbaguna'),
    VocabWord(word: 'widespread', definition: 'Found or distributed over a large area', example: 'There is widespread support for the new policy.', partOfSpeech: 'adjective', translation: 'meluas'),
    VocabWord(word: 'yield', definition: 'To produce or provide; to give way', example: 'The investment yielded a 10% return.', partOfSpeech: 'verb', translation: 'menghasilkan'),
    VocabWord(word: 'advocate', definition: 'To publicly recommend or support', example: 'She advocates for equal rights in the workplace.', partOfSpeech: 'verb/noun', translation: 'mengadvokasi'),
    VocabWord(word: 'bureaucracy', definition: 'A system of government with many complicated rules', example: 'The bureaucracy slowed down the approval process.', partOfSpeech: 'noun', translation: 'birokrasi'),
    VocabWord(word: 'contemplate', definition: 'To think about something deeply and at length', example: 'He contemplated changing careers.', partOfSpeech: 'verb', translation: 'merenungkan'),
    VocabWord(word: 'discrepancy', definition: 'A lack of compatibility between facts or claims', example: 'There was a discrepancy between the two reports.', partOfSpeech: 'noun', translation: 'ketidaksesuaian'),
    VocabWord(word: 'empirical', definition: 'Based on observation or experience rather than theory', example: 'The study provides empirical evidence for the theory.', partOfSpeech: 'adjective', translation: 'empiris'),
    VocabWord(word: 'feasible', definition: 'Possible and practical to do easily', example: 'Is it feasible to complete the project by Friday?', partOfSpeech: 'adjective', translation: 'layak'),
    VocabWord(word: 'gratitude', definition: 'The quality of being thankful; readiness to show appreciation', example: 'She expressed her gratitude for their support.', partOfSpeech: 'noun', translation: 'rasa syukur'),
    VocabWord(word: 'hierarchy', definition: 'A system in which people are ranked according to status', example: 'The company has a strict management hierarchy.', partOfSpeech: 'noun', translation: 'hierarki'),
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

  static const List<String> readingCategories = ['Technology', 'Environment', 'Business', 'Health', 'Education'];
  static const List<String> speakingCategories = ['Daily Life', 'Business', 'Academic', 'Travel', 'Technology'];

  static const List<ReadingPassage> readingPassages = [
    // --- Technology ---
    ReadingPassage(
      category: 'Technology',
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
      category: 'Technology',
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
      category: 'Technology',
      title: 'Cybersecurity in the Modern Age',
      text: '''In an era where virtually every aspect of our lives has a digital component, cybersecurity has emerged as one of the most critical challenges facing individuals, organizations, and governments alike. The frequency and sophistication of cyberattacks continue to escalate, with ransomware, phishing, and data breaches making headlines almost daily.

The shift to remote work has expanded the attack surface dramatically. Employees accessing corporate networks from home Wi-Fi connections, often on personal devices, have created vulnerabilities that cybercriminals are eager to exploit. A single compromised password can provide access to an entire organization's sensitive data.

Artificial intelligence is proving to be a double-edged sword in cybersecurity. While AI-powered tools can detect anomalies and respond to threats faster than human analysts, the same technology enables attackers to craft more convincing phishing emails and develop malware that can evade traditional detection methods.

The human factor remains the weakest link in any security chain. Studies consistently show that social engineering attacks—manipulating people into revealing confidential information—account for a significant majority of successful breaches. This underscores the importance of ongoing security awareness training for all employees.

Governments worldwide are responding with stricter data protection regulations. The European Union's GDPR and similar legislation in other jurisdictions have imposed substantial penalties for organizations that fail to protect personal data adequately, creating a financial incentive for better security practices.''',
      questions: [
        QuizQuestion(question: 'What has expanded the attack surface according to the passage?', options: ['More powerful computers', 'The shift to remote work', 'Faster internet', 'Social media'], correctIndex: 1, explanation: 'The passage states "The shift to remote work has expanded the attack surface dramatically."'),
        QuizQuestion(question: 'Why is AI described as a "double-edged sword" in cybersecurity?', options: ['It is expensive', 'It helps both defenders and attackers', 'It is unreliable', 'It replaces human workers'], correctIndex: 1, explanation: 'AI helps detect threats but also enables attackers to craft better attacks.'),
        QuizQuestion(question: 'What is the weakest link in security?', options: ['Software', 'Hardware', 'The human factor', 'Networks'], correctIndex: 2, explanation: 'The passage states "The human factor remains the weakest link in any security chain."'),
        QuizQuestion(question: 'The word "anomalies" means:', options: ['Normal patterns', 'Unusual deviations', 'Computer viruses', 'Security updates'], correctIndex: 1, explanation: '"Anomalies" refers to things that deviate from what is standard or expected.'),
      ],
    ),
    // --- Environment ---
    ReadingPassage(
      category: 'Environment',
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
    ReadingPassage(
      category: 'Environment',
      title: 'Ocean Plastic Pollution',
      text: '''Every year, approximately eight million metric tons of plastic waste enters the world's oceans, creating an environmental crisis of staggering proportions. This plastic does not biodegrade; instead, it breaks down into smaller and smaller pieces called microplastics, which have now been found in every corner of the ocean, from the deepest trenches to Arctic ice.

Marine life suffers enormously from this pollution. Sea turtles mistake plastic bags for jellyfish, seabirds feed plastic fragments to their chicks, and fish ingest microplastics that accumulate toxins. Scientists estimate that by 2050, there could be more plastic than fish in the ocean by weight if current trends continue.

The problem is not limited to marine ecosystems. Microplastics have been detected in drinking water, food products, and even human blood. The long-term health implications of this pervasive contamination remain poorly understood, but preliminary research suggests potential links to inflammation and cellular damage.

Several innovative solutions are being explored. The Ocean Cleanup project deploys massive floating barriers to collect surface plastic, while other initiatives focus on preventing plastic from reaching waterways in the first place. Biodegradable alternatives to conventional plastics are gaining market share, though they currently represent a tiny fraction of overall production.

Ultimately, addressing ocean plastic pollution requires a fundamental rethinking of our relationship with disposable materials. Extended producer responsibility laws, deposit-return schemes, and outright bans on single-use plastics are gaining momentum globally as governments recognize that voluntary measures alone are insufficient.''',
      questions: [
        QuizQuestion(question: 'How much plastic enters the oceans annually?', options: ['Two million tons', 'Five million tons', 'Eight million tons', 'Twelve million tons'], correctIndex: 2, explanation: 'The passage states "approximately eight million metric tons of plastic waste enters the world\'s oceans."'),
        QuizQuestion(question: 'What are microplastics?', options: ['A type of marine animal', 'Small broken-down plastic pieces', 'Biodegradable materials', 'A cleaning solution'], correctIndex: 1, explanation: 'Plastic "breaks down into smaller and smaller pieces called microplastics."'),
        QuizQuestion(question: 'By 2050, what could happen according to the passage?', options: ['Oceans will be clean', 'More plastic than fish in the ocean', 'Plastic will biodegrade naturally', 'All marine life will adapt'], correctIndex: 1, explanation: 'Scientists estimate "there could be more plastic than fish in the ocean by weight."'),
        QuizQuestion(question: 'The word "pervasive" is closest in meaning to:', options: ['Rare', 'Widespread', 'Temporary', 'Visible'], correctIndex: 1, explanation: '"Pervasive" means spreading widely throughout an area or group.'),
      ],
    ),
    ReadingPassage(
      category: 'Environment',
      title: 'Renewable Energy Revolution',
      text: '''The global energy landscape is undergoing a transformation that few predicted would happen so rapidly. Solar and wind power have become the cheapest sources of new electricity generation in most parts of the world, fundamentally altering the economics of energy production and challenging the dominance of fossil fuels.

The cost of solar panels has fallen by more than 90% since 2010, making solar energy accessible even in developing nations. Similarly, advances in wind turbine technology have dramatically increased efficiency, with modern offshore turbines now capable of powering thousands of homes from a single installation.

Battery storage technology represents the key to unlocking renewable energy's full potential. The intermittent nature of solar and wind—they only generate power when the sun shines or wind blows—has long been cited as their greatest limitation. However, rapidly improving battery technology is making it possible to store excess energy for use during peak demand periods.

The transition is creating winners and losers. Communities dependent on coal mining face economic upheaval, while regions rich in renewable resources are experiencing investment booms. Managing this transition fairly—ensuring that displaced workers receive retraining and support—is essential for maintaining public support for climate action.

Despite remarkable progress, challenges remain. Grid infrastructure in many countries was designed for centralized fossil fuel plants and needs significant upgrades to handle distributed renewable generation. Nevertheless, the direction of travel is clear: the age of fossil fuels is drawing to a close.''',
      questions: [
        QuizQuestion(question: 'By how much have solar panel costs fallen since 2010?', options: ['50%', '70%', '80%', 'More than 90%'], correctIndex: 3, explanation: 'The passage states costs have "fallen by more than 90% since 2010."'),
        QuizQuestion(question: 'What is the key to unlocking renewable energy\'s full potential?', options: ['More solar panels', 'Battery storage technology', 'Government subsidies', 'Nuclear power'], correctIndex: 1, explanation: '"Battery storage technology represents the key to unlocking renewable energy\'s full potential."'),
        QuizQuestion(question: 'What challenge does the energy transition create?', options: ['Higher energy costs', 'Economic upheaval for fossil fuel communities', 'Less reliable power', 'Increased pollution'], correctIndex: 1, explanation: '"Communities dependent on coal mining face economic upheaval."'),
        QuizQuestion(question: 'The word "intermittent" means:', options: ['Constant', 'Occurring at irregular intervals', 'Powerful', 'Invisible'], correctIndex: 1, explanation: '"Intermittent" means not continuous; stopping and starting at intervals.'),
      ],
    ),
    // --- Business ---
    ReadingPassage(
      category: 'Business',
      title: 'The Gig Economy',
      text: '''The rise of the gig economy represents one of the most significant shifts in labor markets since the Industrial Revolution. Platforms like Uber, Fiverr, and DoorDash have created a new class of worker—independent contractors who piece together income from multiple short-term engagements rather than relying on traditional full-time employment.

Proponents argue that the gig economy offers unprecedented flexibility. Workers can choose when, where, and how much they work, allowing them to balance professional responsibilities with personal commitments. For many, this autonomy is liberating and represents a preferable alternative to the rigid structures of conventional employment.

However, critics point to the precarious nature of gig work. Without access to benefits such as health insurance, paid leave, or retirement contributions, gig workers bear risks that were traditionally shared between employer and employee. The absence of a guaranteed minimum income means that earnings can fluctuate wildly based on demand, algorithm changes, or platform policy shifts.

The legal classification of gig workers remains hotly contested. In many jurisdictions, companies classify them as independent contractors to avoid providing benefits and protections mandated for employees. Courts and legislatures around the world are grappling with whether existing labor laws adequately address this new employment paradigm.

Some countries have begun creating intermediate categories—worker classifications that fall between full employment and independent contracting—to provide gig workers with some protections while preserving the flexibility that makes the model attractive. Whether this approach will prove sustainable remains to be seen.''',
      questions: [
        QuizQuestion(question: 'What do proponents say is the main advantage of gig work?', options: ['Higher pay', 'Unprecedented flexibility', 'Better benefits', 'Job security'], correctIndex: 1, explanation: 'Proponents argue it "offers unprecedented flexibility."'),
        QuizQuestion(question: 'What do critics highlight as a key problem?', options: ['Too much free time', 'Lack of benefits and income security', 'Boring work', 'Too many regulations'], correctIndex: 1, explanation: 'Critics point to lack of health insurance, paid leave, retirement contributions, and guaranteed income.'),
        QuizQuestion(question: 'Why do companies classify gig workers as independent contractors?', options: ['Workers prefer it', 'To avoid providing mandated benefits', 'It is legally required', 'For tax purposes only'], correctIndex: 1, explanation: 'Companies do this "to avoid providing benefits and protections mandated for employees."'),
        QuizQuestion(question: 'The word "precarious" means:', options: ['Stable', 'Uncertain and risky', 'Profitable', 'Common'], correctIndex: 1, explanation: '"Precarious" means not securely held; dependent on chance or uncertain conditions.'),
      ],
    ),
    ReadingPassage(
      category: 'Business',
      title: 'Corporate Social Responsibility',
      text: '''Corporate social responsibility (CSR) has evolved from a peripheral concern to a central element of business strategy. Consumers, investors, and employees increasingly expect companies to demonstrate commitment to environmental sustainability, social justice, and ethical governance—not merely to maximize shareholder profits.

Research consistently shows that companies with strong CSR programs enjoy tangible benefits. They attract and retain top talent more easily, as younger workers in particular seek employers whose values align with their own. Customer loyalty tends to be stronger when consumers believe a brand is making a genuine positive impact on society.

However, the line between authentic CSR and "greenwashing"—superficial or misleading claims about environmental practices—has become a significant concern. Companies that make bold sustainability pledges without substantive action risk severe reputational damage when the gap between rhetoric and reality is exposed by journalists or activists.

The concept of stakeholder capitalism suggests that businesses should serve not just shareholders but all stakeholders—employees, customers, communities, and the environment. This represents a fundamental challenge to the shareholder primacy doctrine that dominated corporate governance for decades.

Measuring the impact of CSR initiatives remains challenging. While financial performance is easily quantified, assessing social and environmental outcomes requires more nuanced metrics. Frameworks such as ESG (Environmental, Social, and Governance) reporting are becoming standardized, but critics argue they remain too subjective and inconsistent to enable meaningful comparisons between companies.''',
      questions: [
        QuizQuestion(question: 'What is "greenwashing"?', options: ['Eco-friendly cleaning', 'Misleading environmental claims', 'Green building standards', 'Recycling programs'], correctIndex: 1, explanation: 'Greenwashing is defined as "superficial or misleading claims about environmental practices."'),
        QuizQuestion(question: 'What does stakeholder capitalism propose?', options: ['Only shareholders matter', 'Businesses should serve all stakeholders', 'Government should own businesses', 'Profits are unimportant'], correctIndex: 1, explanation: 'It "suggests that businesses should serve not just shareholders but all stakeholders."'),
        QuizQuestion(question: 'Why do companies with strong CSR attract talent?', options: ['They pay more', 'Workers seek value-aligned employers', 'They offer remote work', 'They have fewer rules'], correctIndex: 1, explanation: '"Younger workers in particular seek employers whose values align with their own."'),
        QuizQuestion(question: 'The word "tangible" means:', options: ['Abstract', 'Clear and definite', 'Invisible', 'Temporary'], correctIndex: 1, explanation: '"Tangible" means perceptible by touch; clear and definite enough to be real.'),
      ],
    ),
    // --- Health ---
    ReadingPassage(
      category: 'Health',
      title: 'Mental Health in the Digital Age',
      text: '''The relationship between technology use and mental health has become one of the most debated topics in contemporary psychology. While digital tools have made mental health resources more accessible than ever, there is growing evidence that excessive screen time and social media use may be contributing to rising rates of anxiety and depression, particularly among young people.

Social media platforms are designed to maximize engagement through algorithms that prioritize emotionally provocative content. This creates an environment where users are constantly exposed to idealized portrayals of others' lives, potentially fostering feelings of inadequacy and social comparison. The dopamine-driven feedback loops of likes and comments can create patterns of use that resemble behavioral addiction.

Paradoxically, technology also offers promising solutions. Teletherapy has dramatically expanded access to mental health services, particularly for those in rural areas or with mobility limitations. Mental health apps providing cognitive behavioral therapy techniques, meditation guidance, and mood tracking have been shown to offer meaningful benefits when used as supplements to professional care.

The concept of "digital wellness" has emerged as a response to these concerns. Features like screen time limits, notification management, and grayscale modes aim to help users develop a healthier relationship with their devices. Some schools have implemented phone-free policies, reporting improvements in student attention and social interaction.

Experts emphasize that technology itself is neither inherently harmful nor beneficial to mental health—what matters is how we use it. Developing digital literacy skills that include awareness of manipulation techniques and the ability to curate one's online environment thoughtfully may be as important as traditional media literacy in the twenty-first century.''',
      questions: [
        QuizQuestion(question: 'What do social media algorithms prioritize?', options: ['Educational content', 'Emotionally provocative content', 'Local news', 'User privacy'], correctIndex: 1, explanation: 'Algorithms "prioritize emotionally provocative content."'),
        QuizQuestion(question: 'How has teletherapy helped mental health care?', options: ['Made it cheaper', 'Expanded access especially for rural areas', 'Replaced all in-person therapy', 'Eliminated waiting times'], correctIndex: 1, explanation: 'Teletherapy "has dramatically expanded access to mental health services, particularly for those in rural areas."'),
        QuizQuestion(question: 'What do experts say about technology and mental health?', options: ['Technology is always harmful', 'Technology is always beneficial', 'It depends on how we use it', 'Only young people are affected'], correctIndex: 2, explanation: '"Technology itself is neither inherently harmful nor beneficial—what matters is how we use it."'),
        QuizQuestion(question: 'The word "paradoxically" suggests:', options: ['Obviously', 'In a seemingly contradictory way', 'Unfortunately', 'Secretly'], correctIndex: 1, explanation: '"Paradoxically" means in a way that seems contradictory but may be true.'),
      ],
    ),
    ReadingPassage(
      category: 'Health',
      title: 'The Science of Sleep',
      text: '''Sleep science has undergone a revolution in recent decades, transforming our understanding of why we sleep and what happens when we don't get enough. Far from being a passive state, sleep is now recognized as an active process during which the brain performs essential maintenance functions, including memory consolidation, toxin removal, and emotional regulation.

Adults require between seven and nine hours of sleep per night for optimal health, yet studies indicate that a third of adults in developed countries regularly fall short of this target. The consequences extend far beyond daytime drowsiness. Chronic sleep deprivation has been linked to increased risks of heart disease, diabetes, obesity, weakened immunity, and cognitive decline.

The circadian rhythm—our internal biological clock—is regulated primarily by light exposure. The modern lifestyle, with its artificial lighting and screen use extending well into the evening, disrupts this natural cycle. Blue light emitted by phones and computers suppresses melatonin production, making it harder to fall asleep even when we feel tired.

Sleep architecture—the pattern of different sleep stages throughout the night—plays a crucial role in overall sleep quality. Deep slow-wave sleep is essential for physical recovery, while REM sleep supports learning and emotional processing. Alcohol, caffeine, and irregular schedules can all disrupt healthy sleep architecture even when total sleep duration appears adequate.

Cognitive behavioral therapy for insomnia (CBT-I) has emerged as the gold standard treatment, proving more effective than sleeping pills in the long term without the risks of dependency or side effects. This approach addresses the thoughts and behaviors that perpetuate poor sleep rather than simply masking symptoms with medication.''',
      questions: [
        QuizQuestion(question: 'How many hours of sleep do adults need per night?', options: ['5-6 hours', '6-7 hours', '7-9 hours', '10-12 hours'], correctIndex: 2, explanation: '"Adults require between seven and nine hours of sleep per night."'),
        QuizQuestion(question: 'How does blue light affect sleep?', options: ['It promotes sleep', 'It suppresses melatonin production', 'It has no effect', 'It increases REM sleep'], correctIndex: 1, explanation: '"Blue light emitted by phones and computers suppresses melatonin production."'),
        QuizQuestion(question: 'What is the gold standard treatment for insomnia?', options: ['Sleeping pills', 'Melatonin supplements', 'CBT-I', 'Exercise'], correctIndex: 2, explanation: '"Cognitive behavioral therapy for insomnia (CBT-I) has emerged as the gold standard treatment."'),
        QuizQuestion(question: 'The word "consolidation" in context means:', options: ['Deletion', 'Strengthening and stabilizing', 'Creating new', 'Forgetting'], correctIndex: 1, explanation: '"Consolidation" means the process of making something stronger or more solid.'),
      ],
    ),
    // --- Education ---
    ReadingPassage(
      category: 'Education',
      title: 'The Future of Higher Education',
      text: '''Traditional universities face unprecedented challenges as technology reshapes how knowledge is created, disseminated, and certified. The soaring cost of higher education, combined with the availability of high-quality online learning platforms, has prompted many to question whether the traditional four-year degree model remains the most effective path to career success.

Massive Open Online Courses (MOOCs) and micro-credential programs offer targeted skills training at a fraction of the cost of traditional degrees. Companies like Google, IBM, and Apple have begun accepting alternative credentials for certain positions, signaling a potential shift in how employers evaluate candidates.

However, defenders of traditional higher education argue that universities provide far more than vocational training. The development of critical thinking, exposure to diverse perspectives, and formation of lifelong networks are benefits that cannot be easily replicated in online settings. The university experience fosters personal growth and intellectual maturity in ways that purely skills-based training does not.

The most likely outcome is not the replacement of universities but their transformation. Hybrid models combining online and in-person learning, competency-based progression rather than time-based semesters, and closer partnerships with industry are already emerging at forward-thinking institutions.

Lifelong learning is becoming a necessity rather than a luxury. As automation and AI transform job markets, workers will need to continuously update their skills throughout their careers. This creates opportunities for universities to serve students well beyond the traditional 18-22 age bracket, offering modular programs that professionals can engage with at various career stages.''',
      questions: [
        QuizQuestion(question: 'What is challenging traditional universities?', options: ['Lack of students', 'High costs and online alternatives', 'Government regulations', 'Poor teaching quality'], correctIndex: 1, explanation: '"The soaring cost of higher education, combined with the availability of high-quality online learning platforms."'),
        QuizQuestion(question: 'What do defenders of traditional education emphasize?', options: ['Lower costs', 'Critical thinking and personal growth', 'Online flexibility', 'Technical skills'], correctIndex: 1, explanation: 'They argue universities provide "critical thinking, exposure to diverse perspectives, and formation of lifelong networks."'),
        QuizQuestion(question: 'Why is lifelong learning becoming necessary?', options: ['People live longer', 'Automation and AI transform job markets', 'Universities require it', 'It is cheaper'], correctIndex: 1, explanation: '"As automation and AI transform job markets, workers will need to continuously update their skills."'),
        QuizQuestion(question: 'The word "disseminated" means:', options: ['Created', 'Spread widely', 'Hidden', 'Sold'], correctIndex: 1, explanation: '"Disseminated" means spread or dispersed widely.'),
      ],
    ),
    ReadingPassage(
      category: 'Education',
      title: 'Multilingualism and Cognitive Benefits',
      text: '''Research in neuroscience and psychology has revealed that speaking multiple languages confers significant cognitive advantages beyond the obvious practical benefits of cross-cultural communication. Bilingual and multilingual individuals consistently demonstrate superior executive function—the mental processes that enable planning, focus, and task-switching.

The bilingual brain must constantly manage two or more language systems, suppressing one while activating another. This ongoing mental exercise strengthens the brain's executive control network, resulting in enhanced abilities in areas such as problem-solving, multitasking, and filtering irrelevant information. These benefits appear to persist even in tasks that have nothing to do with language.

Perhaps most remarkably, research suggests that bilingualism may delay the onset of dementia by four to five years compared to monolingual individuals. The cognitive reserve built through years of managing multiple languages appears to provide a buffer against age-related cognitive decline, though the exact mechanisms remain under investigation.

The critical period hypothesis suggests that language acquisition becomes significantly more difficult after puberty. However, recent research has challenged this view, demonstrating that adults can achieve high proficiency in new languages given sufficient motivation and appropriate learning methods. While pronunciation may be harder to perfect, grammatical competence and vocabulary can reach near-native levels at any age.

Educational systems that support early bilingual instruction—such as immersion programs and dual-language schools—not only produce students who are proficient in two languages but also tend to outperform monolingual peers in standardized tests, suggesting that the cognitive benefits of bilingualism transfer to general academic performance.''',
      questions: [
        QuizQuestion(question: 'What cognitive advantage do multilingual people have?', options: ['Better memory only', 'Superior executive function', 'Faster reading', 'Higher IQ scores'], correctIndex: 1, explanation: 'They "consistently demonstrate superior executive function."'),
        QuizQuestion(question: 'How much may bilingualism delay dementia?', options: ['1-2 years', '4-5 years', '10 years', 'It cannot delay dementia'], correctIndex: 1, explanation: '"Bilingualism may delay the onset of dementia by four to five years."'),
        QuizQuestion(question: 'What does recent research say about adult language learning?', options: ['It is impossible', 'Adults can achieve high proficiency', 'Only pronunciation can be learned', 'It requires living abroad'], correctIndex: 1, explanation: '"Adults can achieve high proficiency in new languages given sufficient motivation."'),
        QuizQuestion(question: 'The word "confers" means:', options: ['Removes', 'Grants or provides', 'Requires', 'Limits'], correctIndex: 1, explanation: '"Confers" means to grant or give a benefit or advantage.'),
      ],
    ),
    // === EASY ===
    ReadingPassage(
      category: 'Technology',
      level: 'Easy',
      title: 'Smartphones',
      text: '''Almost everyone has a smartphone today. We use it to call friends, send messages, and take photos. Smartphones can also help us find directions and play games. Many people use their phone more than their computer. It is important to be careful with screen time. Too much phone use can be bad for your eyes and sleep.''',
      questions: [
        QuizQuestion(question: 'What do we use smartphones for?', options: ['Only calling', 'Calling, messaging, photos, and more', 'Only games', 'Only work'], correctIndex: 1, explanation: 'The passage lists many uses: call, message, take photos, find directions, play games.'),
        QuizQuestion(question: 'What can too much phone use cause?', options: ['Happiness', 'Problems with eyes and sleep', 'Better health', 'More friends'], correctIndex: 1, explanation: 'The passage says too much use "can be bad for your eyes and sleep."'),
      ],
    ),
    ReadingPassage(
      category: 'Environment',
      level: 'Easy',
      title: 'Saving Water',
      text: '''Water is very important for life. We drink it, cook with it, and use it to clean. But clean water is limited. We should not waste it. Turn off the tap when you brush your teeth. Take shorter showers. Fix leaking pipes. If everyone saves a little water, it makes a big difference for our planet.''',
      questions: [
        QuizQuestion(question: 'Why should we save water?', options: ['Water is expensive', 'Clean water is limited', 'We do not need water', 'Water is dirty'], correctIndex: 1, explanation: 'The passage states "clean water is limited."'),
        QuizQuestion(question: 'What is one way to save water?', options: ['Take longer showers', 'Leave the tap on', 'Take shorter showers', 'Use more water'], correctIndex: 2, explanation: 'The passage suggests "Take shorter showers."'),
      ],
    ),
    ReadingPassage(
      category: 'Business',
      level: 'Easy',
      title: 'Working in an Office',
      text: '''Many people work in offices. They use computers and phones. Most offices have meeting rooms where people discuss ideas. It is important to be polite to your coworkers. Say good morning when you arrive. Help others when they need it. A good office has a friendly team that works well together.''',
      questions: [
        QuizQuestion(question: 'What do people use in offices?', options: ['Only paper', 'Computers and phones', 'Only their hands', 'Nothing'], correctIndex: 1, explanation: 'The passage says "They use computers and phones."'),
        QuizQuestion(question: 'What makes a good office?', options: ['Expensive furniture', 'A friendly team', 'A big building', 'Free food'], correctIndex: 1, explanation: '"A good office has a friendly team that works well together."'),
      ],
    ),
    ReadingPassage(
      category: 'Health',
      level: 'Easy',
      title: 'Eating Healthy',
      text: '''Eating healthy food is good for your body. Fruits and vegetables give you vitamins. Rice, bread, and pasta give you energy. Meat and fish help your muscles grow strong. Try to eat less sugar and salt. Drink plenty of water every day. A balanced diet keeps you healthy and happy.''',
      questions: [
        QuizQuestion(question: 'What do fruits and vegetables give you?', options: ['Energy', 'Vitamins', 'Protein', 'Sugar'], correctIndex: 1, explanation: '"Fruits and vegetables give you vitamins."'),
        QuizQuestion(question: 'What should you drink every day?', options: ['Soda', 'Coffee', 'Plenty of water', 'Juice only'], correctIndex: 2, explanation: 'The passage says "Drink plenty of water every day."'),
      ],
    ),
    ReadingPassage(
      category: 'Education',
      level: 'Easy',
      title: 'Learning English',
      text: '''English is spoken in many countries around the world. Learning English can help you travel, make friends, and get a better job. You can learn by reading books, watching movies, and talking to people. Practice every day, even for just ten minutes. Do not be afraid of mistakes. Mistakes help you learn faster.''',
      questions: [
        QuizQuestion(question: 'How can learning English help you?', options: ['Only for travel', 'Travel, friends, and better jobs', 'Only for school', 'It cannot help'], correctIndex: 1, explanation: 'The passage mentions travel, making friends, and getting a better job.'),
        QuizQuestion(question: 'What should you not be afraid of?', options: ['Teachers', 'Books', 'Mistakes', 'Speaking'], correctIndex: 2, explanation: '"Do not be afraid of mistakes. Mistakes help you learn faster."'),
      ],
    ),
    // === HARD ===
    ReadingPassage(
      category: 'Technology',
      level: 'Hard',
      title: 'The Epistemology of Artificial General Intelligence',
      text: '''The pursuit of artificial general intelligence (AGI) raises profound epistemological questions about the nature of understanding itself. Unlike narrow AI systems that excel within predefined domains, AGI would theoretically possess the capacity for cross-domain reasoning, abstraction, and genuine comprehension—capabilities that remain philosophically contentious even when attributed to biological intelligence.

The Chinese Room argument, proposed by John Searle in 1980, remains perhaps the most influential challenge to strong AI claims. Searle contends that syntactic manipulation of symbols—regardless of its sophistication—cannot constitute genuine semantic understanding. A system that processes inputs and generates contextually appropriate outputs may exhibit behavioral indistinguishability from understanding without possessing any subjective comprehension whatsoever.

Contemporary approaches to AGI, particularly large language models trained on massive corpora, have reinvigorated this debate. These systems demonstrate remarkable fluency across diverse domains, yet whether they genuinely "understand" language or merely exploit statistical regularities remains deeply contested. The phenomenon of hallucination—where models generate plausible but factually incorrect assertions with apparent confidence—suggests fundamental limitations in their relationship to truth and knowledge.

The alignment problem represents perhaps the most urgent practical concern surrounding AGI development. Ensuring that a superintelligent system's objectives remain consonant with human values presupposes that human values themselves are sufficiently coherent and stable to serve as alignment targets—an assumption that moral philosophy has consistently challenged throughout its history.

Whether AGI is achievable through scaling current architectures or requires fundamentally novel computational paradigms remains an open question. What seems certain is that its development—or the sustained attempt to develop it—will continue to illuminate fundamental questions about consciousness, understanding, and the nature of intelligence itself.''',
      questions: [
        QuizQuestion(question: 'What is the Chinese Room argument about?', options: ['Learning Chinese', 'Symbol manipulation cannot constitute genuine understanding', 'Building better computers', 'Language translation'], correctIndex: 1, explanation: 'Searle contends that "syntactic manipulation of symbols cannot constitute genuine semantic understanding."'),
        QuizQuestion(question: 'What does "hallucination" refer to in AI context?', options: ['Visual processing errors', 'Generating plausible but incorrect assertions', 'System crashes', 'Slow response times'], correctIndex: 1, explanation: '"Hallucination" is where models "generate plausible but factually incorrect assertions."'),
        QuizQuestion(question: 'What is the alignment problem?', options: ['Making AI faster', 'Ensuring AI objectives match human values', 'Training data quality', 'Hardware limitations'], correctIndex: 1, explanation: 'It involves "ensuring that a superintelligent system\'s objectives remain consonant with human values."'),
        QuizQuestion(question: 'The word "consonant" in this context means:', options: ['Musical', 'In agreement or harmony with', 'Contradictory', 'Alphabetical'], correctIndex: 1, explanation: '"Consonant with" means in agreement or compatible with.'),
      ],
    ),
    ReadingPassage(
      category: 'Environment',
      level: 'Hard',
      title: 'Anthropocene Extinction Dynamics',
      text: '''The contemporary biodiversity crisis—often characterized as the sixth mass extinction—differs fundamentally from its geological predecessors in both etiology and velocity. While previous extinction events were precipitated by asteroid impacts, volcanic cataclysms, or gradual atmospheric shifts occurring over millennia, the current crisis is anthropogenic in origin and is unfolding at rates estimated to be 100 to 1,000 times the background extinction rate.

The cascading effects of biodiversity loss extend far beyond the disappearance of individual species. Ecosystem services—pollination, water purification, carbon sequestration, nutrient cycling—depend upon complex webs of interspecific relationships that exhibit non-linear dynamics. The removal of keystone species can trigger trophic cascades with consequences that are difficult to predict and potentially irreversible.

The concept of planetary boundaries, developed by Johan Rockström and colleagues, identifies biosphere integrity as one of two core boundaries whose transgression could drive the Earth system into a fundamentally different state. Current trajectories suggest that genetic diversity loss has already exceeded the proposed safe operating space for humanity.

Conservation biology has evolved from preservationist paradigms focused on charismatic megafauna to more sophisticated frameworks incorporating landscape connectivity, functional redundancy, and evolutionary potential. Rewilding initiatives seek to restore ecological processes rather than merely preserving static assemblages, recognizing that ecosystems are dynamic entities requiring functional completeness to maintain resilience.

The intersection of climate change and habitat fragmentation creates a particularly pernicious synergy. Species that might otherwise adapt through range shifts find their migration corridors severed by agricultural and urban development, while those in protected areas face conditions increasingly divergent from those under which the reserves were established.''',
      questions: [
        QuizQuestion(question: 'How does the current extinction differ from previous ones?', options: ['It is slower', 'It is caused by humans and much faster', 'It affects fewer species', 'It is natural'], correctIndex: 1, explanation: 'It is "anthropogenic in origin and unfolding at rates 100 to 1,000 times the background rate."'),
        QuizQuestion(question: 'What are "trophic cascades"?', options: ['Water features', 'Chain reactions from removing keystone species', 'Types of extinction', 'Climate patterns'], correctIndex: 1, explanation: '"Removal of keystone species can trigger trophic cascades with consequences that are difficult to predict."'),
        QuizQuestion(question: 'What does modern conservation biology focus on?', options: ['Only large animals', 'Landscape connectivity and ecological processes', 'Zoos only', 'Tourism'], correctIndex: 1, explanation: 'It incorporates "landscape connectivity, functional redundancy, and evolutionary potential."'),
        QuizQuestion(question: 'The word "pernicious" means:', options: ['Beneficial', 'Harmless', 'Causing great harm gradually', 'Temporary'], correctIndex: 2, explanation: '"Pernicious" means having a harmful effect, especially in a subtle or gradual way.'),
      ],
    ),
    ReadingPassage(
      category: 'Business',
      level: 'Hard',
      title: 'Behavioral Economics and Market Irrationality',
      text: '''The efficient market hypothesis—the cornerstone of neoclassical financial theory—posits that asset prices fully reflect all available information, rendering consistent outperformance through active management theoretically impossible. However, decades of empirical research in behavioral economics have documented systematic deviations from rationality that challenge this foundational assumption.

Prospect theory, developed by Kahneman and Tversky, demonstrates that individuals evaluate outcomes relative to reference points rather than absolute values, exhibiting loss aversion (losses loom approximately twice as large as equivalent gains) and probability weighting (overweighting small probabilities while underweighting large ones). These cognitive biases generate predictable patterns in financial decision-making.

The phenomenon of herding behavior—wherein investors mimic the actions of larger groups regardless of their own information—can amplify market movements beyond what fundamentals justify, creating bubbles and subsequent crashes. The dot-com bubble and the 2008 financial crisis both exhibited characteristics consistent with collective cognitive biases overwhelming individual rationality.

Nudge architecture, which structures choice environments to exploit predictable irrationalities for prosocial ends, has gained considerable policy traction. Default enrollment in retirement savings plans, for instance, leverages status quo bias to dramatically increase participation rates without restricting individual freedom of choice.

The integration of behavioral insights into regulatory frameworks represents a paradigmatic shift from homo economicus—the perfectly rational agent of classical theory—toward a more empirically grounded understanding of human decision-making that acknowledges our cognitive limitations while respecting individual autonomy.''',
      questions: [
        QuizQuestion(question: 'What does the efficient market hypothesis claim?', options: ['Markets are unfair', 'Asset prices reflect all available information', 'Everyone can beat the market', 'Government controls prices'], correctIndex: 1, explanation: 'It "posits that asset prices fully reflect all available information."'),
        QuizQuestion(question: 'What is loss aversion?', options: ['Fear of investing', 'Losses feel twice as painful as equivalent gains feel good', 'Avoiding all risk', 'Selling too quickly'], correctIndex: 1, explanation: '"Losses loom approximately twice as large as equivalent gains."'),
        QuizQuestion(question: 'What is "nudge architecture"?', options: ['Building design', 'Structuring choices to exploit biases for good', 'Marketing strategy', 'Legal requirements'], correctIndex: 1, explanation: 'It "structures choice environments to exploit predictable irrationalities for prosocial ends."'),
        QuizQuestion(question: 'The word "paradigmatic" means:', options: ['Unimportant', 'Serving as a typical example or fundamental shift', 'Temporary', 'Controversial'], correctIndex: 1, explanation: '"Paradigmatic" relates to a fundamental change in approach or model.'),
      ],
    ),
    ReadingPassage(
      category: 'Health',
      level: 'Hard',
      title: 'The Gut-Brain Axis and Psychiatric Medicine',
      text: '''The bidirectional communication pathway between the gastrointestinal microbiome and the central nervous system—termed the gut-brain axis—has emerged as one of the most transformative discoveries in contemporary neuroscience. This complex signaling network, operating through neural, endocrine, and immunological mechanisms, suggests that psychiatric conditions traditionally conceptualized as purely neurological may have significant peripheral etiological components.

The human gut harbors approximately 100 trillion microorganisms comprising over 1,000 species, collectively encoding 150 times more genes than the human genome. This microbial ecosystem produces neurotransmitters—including approximately 95% of the body's serotonin—and metabolites that cross the blood-brain barrier, directly influencing neural function and behavior.

Clinical studies have demonstrated correlations between specific microbiome compositions and psychiatric conditions including depression, anxiety, autism spectrum disorder, and schizophrenia. Germ-free animal models exhibit altered stress responses and social behaviors that normalize upon colonization with conventional microbiota, providing compelling evidence for causal rather than merely correlational relationships.

The therapeutic implications are profound. Psychobiotics—probiotics administered for mental health benefits—represent a nascent but promising intervention modality. Fecal microbiota transplantation, while primarily validated for Clostridioides difficile infection, is being investigated for psychiatric applications with preliminary results suggesting potential efficacy.

However, the field faces significant methodological challenges. The microbiome's extraordinary complexity and individual variability, combined with the difficulty of establishing causality in observational studies, necessitate cautious interpretation of current findings. The translational pathway from correlational discoveries to validated clinical interventions remains substantially longer than public enthusiasm might suggest.''',
      questions: [
        QuizQuestion(question: 'What is the gut-brain axis?', options: ['A type of surgery', 'Bidirectional communication between gut microbiome and brain', 'A diet plan', 'A brain scan technique'], correctIndex: 1, explanation: 'It is "the bidirectional communication pathway between the gastrointestinal microbiome and the central nervous system."'),
        QuizQuestion(question: 'How much of the body\'s serotonin is produced in the gut?', options: ['About 50%', 'About 75%', 'Approximately 95%', '100%'], correctIndex: 2, explanation: 'The gut produces "approximately 95% of the body\'s serotonin."'),
        QuizQuestion(question: 'What are psychobiotics?', options: ['Antibiotics', 'Probiotics for mental health benefits', 'Antidepressants', 'Brain supplements'], correctIndex: 1, explanation: '"Psychobiotics—probiotics administered for mental health benefits."'),
        QuizQuestion(question: 'The word "nascent" means:', options: ['Dying', 'Just beginning to develop', 'Well-established', 'Controversial'], correctIndex: 1, explanation: '"Nascent" means just beginning to develop; in the earliest stage.'),
      ],
    ),
    ReadingPassage(
      category: 'Education',
      level: 'Hard',
      title: 'Critical Pedagogy and Epistemic Justice',
      text: '''Critical pedagogy, rooted in the work of Paulo Freire and subsequently elaborated by scholars including bell hooks, Henry Giroux, and Peter McLaren, fundamentally reconceptualizes education as a practice of freedom rather than a mechanism of social reproduction. This framework challenges the "banking model" of education—wherein students are treated as passive receptacles for deposited knowledge—advocating instead for dialogical praxis that empowers learners as co-constructors of meaning.

The concept of epistemic injustice, articulated by Miranda Fricker, identifies two primary forms of knowledge-related oppression: testimonial injustice, wherein speakers receive diminished credibility due to identity prejudice, and hermeneutical injustice, wherein marginalized groups lack the interpretive resources to render their experiences intelligible. Educational institutions can perpetuate both forms through curriculum design, assessment practices, and classroom dynamics.

Decolonizing the curriculum extends beyond diversifying reading lists to fundamentally questioning whose knowledge counts as legitimate, what methodologies are valorized, and which epistemological frameworks structure inquiry. This project requires interrogating the universalist assumptions embedded in Western academic traditions while avoiding the relativist position that all knowledge claims are equally valid.

The tension between standardization and culturally responsive pedagogy represents a persistent structural challenge. Accountability systems predicated on standardized assessment inevitably privilege particular cultural and linguistic competencies while marginalizing others, potentially reproducing the very inequities they purport to address.

Transformative educational practice, from this perspective, necessarily involves cultivating critical consciousness—the capacity to perceive and challenge systemic oppression—while simultaneously developing the disciplinary knowledge and skills that enable effective participation in existing social structures. Navigating this dual mandate without sacrificing either dimension constitutes the fundamental challenge of liberatory education.''',
      questions: [
        QuizQuestion(question: 'What is the "banking model" of education?', options: ['Teaching finance', 'Treating students as passive recipients of knowledge', 'Online learning', 'Self-directed study'], correctIndex: 1, explanation: 'Students are "treated as passive receptacles for deposited knowledge."'),
        QuizQuestion(question: 'What is testimonial injustice?', options: ['Lying in court', 'Speakers receiving less credibility due to identity prejudice', 'Bad test scores', 'Unfair grading'], correctIndex: 1, explanation: '"Testimonial injustice, wherein speakers receive diminished credibility due to identity prejudice."'),
        QuizQuestion(question: 'What does decolonizing the curriculum involve?', options: ['Removing all Western content', 'Questioning whose knowledge counts as legitimate', 'Teaching only local content', 'Eliminating exams'], correctIndex: 1, explanation: 'It involves "fundamentally questioning whose knowledge counts as legitimate."'),
        QuizQuestion(question: 'The word "praxis" means:', options: ['Theory only', 'Practice informed by theory', 'Testing', 'Memorization'], correctIndex: 1, explanation: '"Praxis" refers to the process of putting theoretical knowledge into practice.'),
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

  static const List<SpeakingText> speakingTexts = [
    // === EASY ===
    SpeakingText(category: 'Daily Life', title: 'My Morning', level: 'Easy', text: 'I wake up at seven o\'clock every day. I brush my teeth and take a shower. Then I eat breakfast with my family. I usually have bread and coffee.'),
    SpeakingText(category: 'Daily Life', title: 'My Favorite Food', level: 'Easy', text: 'I love eating pizza. It has cheese, tomato sauce, and many toppings. I eat pizza every Friday with my friends. It makes me happy.'),
    SpeakingText(category: 'Daily Life', title: 'Going Shopping', level: 'Easy', text: 'I go to the supermarket every weekend. I buy fruits, vegetables, and milk. Sometimes I buy chocolate too. I pay with my card.'),
    SpeakingText(category: 'Business', title: 'My Job', level: 'Easy', text: 'I work in an office. I start at nine and finish at five. I use a computer every day. My coworkers are very friendly.'),
    SpeakingText(category: 'Business', title: 'A Phone Call', level: 'Easy', text: 'Hello, this is John speaking. Can I help you? Please wait a moment. I will transfer your call. Thank you for calling.'),
    SpeakingText(category: 'Travel', title: 'At the Hotel', level: 'Easy', text: 'I have a reservation. My name is Sarah. I would like a room with a view. How much does it cost per night? Thank you very much.'),
    SpeakingText(category: 'Travel', title: 'Ordering Food', level: 'Easy', text: 'Can I see the menu please? I would like a chicken sandwich and a glass of water. How long will it take? The food is delicious. Can I have the bill?'),
    SpeakingText(category: 'Academic', title: 'My School', level: 'Easy', text: 'I study English at school. My teacher is very nice. We read books and practice speaking. I learn new words every day.'),
    SpeakingText(category: 'Technology', title: 'My Phone', level: 'Easy', text: 'I use my phone every day. I send messages to my friends. I also watch videos and listen to music. My phone is very useful.'),
    // === MEDIUM ===
    SpeakingText(category: 'Daily Life', title: 'Morning Routine', level: 'Medium', text: 'The ability to communicate effectively in English has become increasingly important in today\'s globalized world. Whether you\'re conducting business negotiations, presenting research findings, or simply traveling abroad, proficiency in English opens doors to countless opportunities.'),
    SpeakingText(category: 'Daily Life', title: 'Healthy Habits', level: 'Medium', text: 'Maintaining a balanced lifestyle requires conscious effort and daily discipline. Regular exercise, adequate sleep, and mindful eating are the foundations of physical well-being. Equally important is nurturing mental health through meditation, social connections, and engaging hobbies.'),
    SpeakingText(category: 'Daily Life', title: 'Weekend Plans', level: 'Medium', text: 'Planning your weekends in advance can significantly improve your quality of life. Whether you prefer outdoor adventures, cultural experiences, or simply relaxing at home, having something to look forward to helps maintain motivation throughout the busy workweek.'),
    SpeakingText(category: 'Business', title: 'Job Interview', level: 'Medium', text: 'Education systems around the world are undergoing significant reforms as societies recognize the need to prepare students for a rapidly changing job market. Traditional models of rote learning are giving way to approaches that emphasize critical thinking, creativity, and collaboration.'),
    SpeakingText(category: 'Business', title: 'Team Meeting', level: 'Medium', text: 'Effective meetings require clear agendas, defined objectives, and active participation from all team members. The most productive teams establish ground rules that encourage open communication while respecting time constraints. Follow-up action items ensure accountability and progress.'),
    SpeakingText(category: 'Business', title: 'Client Presentation', level: 'Medium', text: 'Delivering a compelling presentation requires thorough preparation and audience awareness. Structure your content with a clear introduction, supporting evidence, and a memorable conclusion. Engage your audience through storytelling, relevant data, and confident body language.'),
    SpeakingText(category: 'Academic', title: 'Research Discussion', level: 'Medium', text: 'The concept of sustainable development seeks to balance economic growth with environmental protection and social equity. It recognizes that the resources of our planet are finite and that current patterns of consumption cannot continue indefinitely without severe consequences for future generations.'),
    SpeakingText(category: 'Academic', title: 'Lecture Summary', level: 'Medium', text: 'The digital revolution has transformed virtually every aspect of modern life. From how we communicate and consume information to how we work and entertain ourselves, technology has reshaped our daily routines in ways that would have been unimaginable just a few decades ago.'),
    SpeakingText(category: 'Academic', title: 'Thesis Defense', level: 'Medium', text: 'Presenting academic research effectively requires clarity of argument and command of evidence. A successful thesis defense demonstrates not only deep knowledge of the subject matter but also awareness of its limitations and potential directions for future investigation.'),
    SpeakingText(category: 'Travel', title: 'At the Airport', level: 'Medium', text: 'Navigating international airports can be overwhelming for first-time travelers. Understanding the process from check-in through security screening to boarding helps reduce anxiety. Arriving early allows time for unexpected delays and provides opportunities to explore duty-free shops and airport lounges.'),
    SpeakingText(category: 'Travel', title: 'Hotel Check-in', level: 'Medium', text: 'When checking into a hotel abroad, clear communication ensures a smooth experience. Confirm your reservation details, ask about available amenities, and inquire about local recommendations. Most hotel staff are happy to suggest restaurants, attractions, and transportation options.'),
    SpeakingText(category: 'Travel', title: 'Asking Directions', level: 'Medium', text: 'Getting lost in a foreign city can be frustrating but also adventurous. Learning key phrases for asking directions politely shows respect for local culture. Always confirm your understanding by repeating the instructions back, and don\'t hesitate to ask multiple people if needed.'),
    SpeakingText(category: 'Technology', title: 'Tech Review', level: 'Medium', text: 'Climate change represents one of the most significant challenges facing humanity today. Scientists have reached a consensus that human activities, particularly the burning of fossil fuels, are the primary drivers of global warming. The consequences include rising sea levels, more frequent extreme weather events, and disruptions to ecosystems worldwide.'),
    SpeakingText(category: 'Technology', title: 'App Development', level: 'Medium', text: 'Building a successful application requires understanding user needs and delivering intuitive experiences. The best developers combine technical expertise with empathy for end users. Iterative testing and feedback loops ensure the final product meets real-world requirements effectively.'),
    SpeakingText(category: 'Technology', title: 'Future of AI', level: 'Medium', text: 'Artificial intelligence is transforming industries at an unprecedented pace. From healthcare diagnostics to autonomous vehicles, machine learning algorithms are solving problems that once seemed impossible. However, responsible development requires careful consideration of ethical implications and societal impact.'),
    // === HARD ===
    SpeakingText(category: 'Daily Life', title: 'Work-Life Integration', level: 'Hard', text: 'The contemporary discourse surrounding work-life balance has evolved considerably, with many organizational psychologists now advocating for the concept of work-life integration rather than strict separation. This paradigm acknowledges that the boundaries between professional obligations and personal fulfillment are increasingly permeable in our hyperconnected society, necessitating adaptive strategies for maintaining psychological equilibrium.'),
    SpeakingText(category: 'Business', title: 'Strategic Innovation', level: 'Hard', text: 'Disruptive innovation fundamentally alters the competitive landscape by introducing products or services that initially target overlooked market segments before eventually displacing established incumbents. Organizations must cultivate ambidextrous capabilities, simultaneously exploiting existing competencies while exploring transformative opportunities, to navigate the inherent tensions between operational efficiency and strategic adaptability.'),
    SpeakingText(category: 'Business', title: 'Corporate Governance', level: 'Hard', text: 'Effective corporate governance encompasses the mechanisms, processes, and relations by which corporations are controlled and directed. The principal-agent problem, wherein the interests of shareholders diverge from those of management, necessitates robust oversight frameworks including independent board composition, transparent executive compensation structures, and rigorous audit procedures.'),
    SpeakingText(category: 'Academic', title: 'Epistemological Frameworks', level: 'Hard', text: 'The epistemological foundations of empirical research rest upon the assumption that observable phenomena can be systematically investigated through reproducible methodologies. However, post-positivist critiques have illuminated the inherent subjectivity embedded within ostensibly objective inquiry, suggesting that researchers\' theoretical commitments inevitably shape their interpretations of empirical evidence.'),
    SpeakingText(category: 'Academic', title: 'Sociolinguistic Variation', level: 'Hard', text: 'Sociolinguistic research has demonstrated that language variation is not random but systematically correlated with social variables including socioeconomic status, ethnicity, gender, and contextual formality. Code-switching between linguistic varieties serves as a sophisticated communicative strategy through which speakers negotiate identity, establish solidarity, and exercise agency within hierarchical social structures.'),
    SpeakingText(category: 'Travel', title: 'Cultural Immersion', level: 'Hard', text: 'Anthropological approaches to travel emphasize the distinction between superficial tourism and genuine cultural immersion, wherein the traveler transcends the role of passive observer to become an active participant in local meaning-making systems. This transformative engagement requires linguistic competence, ethnographic sensitivity, and willingness to confront one\'s own ethnocentric assumptions about normalcy and social organization.'),
    SpeakingText(category: 'Technology', title: 'Quantum Computing Ethics', level: 'Hard', text: 'The advent of quantum computing presents unprecedented implications for cryptographic security, computational biology, and materials science. The potential for quantum supremacy to render current encryption protocols obsolete necessitates proactive development of post-quantum cryptographic standards, while simultaneously raising profound questions about the equitable distribution of transformative computational capabilities across geopolitical boundaries.'),
    SpeakingText(category: 'Technology', title: 'Neural Architecture', level: 'Hard', text: 'Contemporary advances in transformer-based neural architectures have fundamentally reconceptualized the boundaries of natural language processing. The emergence of attention mechanisms and self-supervised pre-training paradigms has demonstrated that statistical regularities within massive corpora can approximate sophisticated linguistic competencies, challenging long-held assumptions about the necessity of innate grammatical knowledge.'),
  ];

  // Keep listeningTexts for backward compatibility with listening screen
  static List<String> get listeningTexts => speakingTexts.map((s) => s.text).toList();
}
