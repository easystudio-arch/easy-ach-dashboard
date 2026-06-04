import '../models/models.dart';

class IeltsData {
  // ============ READING ============
  static const List<IeltsReadingPassage> readingPassages = [
    IeltsReadingPassage(
      category: 'Academic',
      title: 'The Impact of Urbanization on Biodiversity',
      tip: 'Skim the passage first for main ideas, then scan for specific answers. Watch for paraphrasing!',
      passage: '''Urbanization is one of the most significant drivers of biodiversity loss worldwide. As cities expand, natural habitats are fragmented or destroyed entirely, forcing wildlife to adapt, migrate, or perish. Research indicates that urban areas, which cover approximately 3% of the Earth's land surface, have a disproportionate impact on ecosystems far beyond their physical boundaries.

The concept of "urban heat islands" illustrates one mechanism through which cities affect local biodiversity. Cities tend to be several degrees warmer than surrounding rural areas due to the prevalence of heat-absorbing surfaces such as asphalt and concrete. This temperature differential can alter the behavior and distribution of species, favoring heat-tolerant organisms while disadvantaging others.

However, recent studies have challenged the simplistic narrative that urbanization is universally detrimental to biodiversity. Some cities have become unexpected refuges for certain species. Urban green spaces, gardens, and even building facades can support diverse communities of plants, insects, and birds. The phenomenon of "synurbanization"—the adaptation of wild species to urban environments—has been documented across numerous taxa.

Urban planners are increasingly incorporating biodiversity considerations into city design. Green corridors connecting isolated patches of habitat allow species to move through urban landscapes. Green roofs and walls provide additional habitat, while sustainable urban drainage systems create wetland environments within city boundaries.

The relationship between urbanization and biodiversity is thus more nuanced than previously understood. While unplanned urban sprawl undoubtedly threatens ecosystems, thoughtful urban design can mitigate these impacts and even create novel ecological opportunities. The challenge lies in scaling these approaches to match the rapid pace of global urbanization.''',
      questions: [
        IeltsQuestion(question: 'Urban areas cover what percentage of Earth\'s land surface?', type: 'multiple_choice', options: ['1%', '3%', '5%', '10%'], correctIndex: 1, explanation: 'The passage states "urban areas, which cover approximately 3% of the Earth\'s land surface."'),
        IeltsQuestion(question: '"Urban heat islands" cause cities to be cooler than rural areas.', type: 'true_false_ng', options: ['True', 'False', 'Not Given'], correctIndex: 1, explanation: 'The passage says cities "tend to be several degrees warmer than surrounding rural areas" — so the statement is FALSE.'),
        IeltsQuestion(question: 'Synurbanization refers to:', type: 'multiple_choice', options: ['Cities merging together', 'Wild species adapting to urban environments', 'Urban planning for biodiversity', 'Heat island effects'], correctIndex: 1, explanation: 'Defined as "the adaptation of wild species to urban environments."'),
        IeltsQuestion(question: 'Green corridors help species to:', type: 'multiple_choice', options: ['Stay in one location', 'Move through urban landscapes', 'Avoid predators', 'Find food more easily'], correctIndex: 1, explanation: 'Green corridors "connecting isolated patches of habitat allow species to move through urban landscapes."'),
        IeltsQuestion(question: 'All forms of urbanization are harmful to biodiversity.', type: 'true_false_ng', options: ['True', 'False', 'Not Given'], correctIndex: 1, explanation: 'The passage states "thoughtful urban design can mitigate these impacts and even create novel ecological opportunities" — so FALSE.'),
      ],
    ),
    IeltsReadingPassage(
      category: 'Academic',
      title: 'The Psychology of Decision Making',
      tip: 'For True/False/Not Given: TRUE = passage confirms it. FALSE = passage contradicts it. NG = passage doesn\'t mention it.',
      passage: '''Human decision-making is far less rational than classical economic theory suggests. Behavioral economists Daniel Kahneman and Amos Tversky revolutionized our understanding of how people actually make choices, revealing systematic biases that influence judgments across virtually all domains of life.

One of their most influential findings concerns "loss aversion"—the tendency for people to feel the pain of a loss approximately twice as strongly as the pleasure of an equivalent gain. This asymmetry explains why investors hold onto losing stocks too long and sell winning ones too quickly, and why consumers are more motivated by the fear of missing a discount than by the prospect of a future saving.

The "anchoring effect" demonstrates how initial information disproportionately influences subsequent judgments. When people are exposed to a number—even a random one—before making an estimate, their answers tend to gravitate toward that anchor. Real estate agents, car salespeople, and negotiators routinely exploit this bias by setting high initial prices or opening offers.

"Confirmation bias" refers to our tendency to seek out information that confirms our existing beliefs while ignoring contradictory evidence. In the age of social media algorithms that curate content based on past engagement, this bias has become amplified, creating "echo chambers" that reinforce polarized viewpoints.

Understanding these biases does not make us immune to them. Research shows that even experts in behavioral economics fall prey to the same cognitive shortcuts in their daily lives. However, awareness of these tendencies can inform the design of "choice architectures"—environments structured to nudge people toward better decisions without restricting their freedom of choice.''',
      questions: [
        IeltsQuestion(question: 'Loss aversion means people feel losses ___ as strongly as equivalent gains.', type: 'multiple_choice', options: ['Equally', 'Half', 'Twice', 'Three times'], correctIndex: 2, explanation: '"The pain of a loss approximately twice as strongly as the pleasure of an equivalent gain."'),
        IeltsQuestion(question: 'Kahneman and Tversky were psychologists, not economists.', type: 'true_false_ng', options: ['True', 'False', 'Not Given'], correctIndex: 2, explanation: 'The passage calls them "behavioral economists" but doesn\'t specify their original field — Not Given.'),
        IeltsQuestion(question: 'The anchoring effect can only be triggered by relevant numbers.', type: 'true_false_ng', options: ['True', 'False', 'Not Given'], correctIndex: 1, explanation: 'The passage says "even a random one" can trigger anchoring — so FALSE.'),
        IeltsQuestion(question: 'What are "echo chambers" in this context?', type: 'multiple_choice', options: ['Recording studios', 'Environments reinforcing polarized viewpoints', 'Social media companies', 'Psychology labs'], correctIndex: 1, explanation: 'Echo chambers "reinforce polarized viewpoints" through curated content.'),
        IeltsQuestion(question: 'Experts in behavioral economics are immune to cognitive biases.', type: 'true_false_ng', options: ['True', 'False', 'Not Given'], correctIndex: 1, explanation: '"Even experts in behavioral economics fall prey to the same cognitive shortcuts" — FALSE.'),
      ],
    ),
    IeltsReadingPassage(
      category: 'Academic',
      title: 'Water Scarcity: A Global Crisis',
      tip: 'Pay attention to qualifying words like "some", "most", "all", "never" — they change meaning significantly in T/F/NG questions.',
      passage: '''Water scarcity affects more than 40% of the global population, a figure that is projected to rise significantly as climate change intensifies and populations grow. The United Nations has identified water stress as one of the greatest risks facing humanity in the twenty-first century, with implications for food security, economic development, and geopolitical stability.

The distinction between physical and economic water scarcity is crucial for understanding the nature of the crisis. Physical scarcity occurs when natural water resources are insufficient to meet demand—a situation common in arid regions of the Middle East and North Africa. Economic scarcity, by contrast, exists where water is physically available but infrastructure or governance failures prevent equitable access, as seen in parts of Sub-Saharan Africa and South Asia.

Agriculture accounts for approximately 70% of global freshwater withdrawals, making it the primary driver of water stress in many regions. Inefficient irrigation practices, including flood irrigation that wastes up to 60% of water applied, contribute substantially to the problem. Precision agriculture and drip irrigation technologies offer significant water savings but require capital investment that smallholder farmers often cannot afford.

Desalination technology has advanced considerably, with reverse osmosis now capable of producing freshwater from seawater at a fraction of historical costs. However, desalination remains energy-intensive and generates brine waste that can harm marine ecosystems. Its application is therefore most viable in coastal areas with access to affordable renewable energy.

International cooperation on shared water resources remains inadequate. Transboundary rivers and aquifers supply water to multiple nations, yet governance frameworks rarely keep pace with growing demand. The potential for "water wars" has been widely discussed, though historically, water scarcity has more often led to cooperation than conflict between nations.''',
      questions: [
        IeltsQuestion(question: 'What percentage of the global population is affected by water scarcity?', type: 'multiple_choice', options: ['20%', '30%', '40%', '50%'], correctIndex: 2, explanation: '"Water scarcity affects more than 40% of the global population."'),
        IeltsQuestion(question: 'Economic water scarcity means there is no water physically available.', type: 'true_false_ng', options: ['True', 'False', 'Not Given'], correctIndex: 1, explanation: '"Economic scarcity exists where water is physically available but infrastructure or governance failures prevent equitable access" — FALSE.'),
        IeltsQuestion(question: 'Agriculture accounts for approximately ___ of freshwater withdrawals.', type: 'multiple_choice', options: ['50%', '60%', '70%', '80%'], correctIndex: 2, explanation: '"Agriculture accounts for approximately 70% of global freshwater withdrawals."'),
        IeltsQuestion(question: 'Desalination is suitable for all regions.', type: 'true_false_ng', options: ['True', 'False', 'Not Given'], correctIndex: 1, explanation: '"Its application is therefore most viable in coastal areas" — not all regions, so FALSE.'),
        IeltsQuestion(question: 'Water scarcity has historically led to wars between nations.', type: 'true_false_ng', options: ['True', 'False', 'Not Given'], correctIndex: 1, explanation: '"Water scarcity has more often led to cooperation than conflict between nations" — FALSE.'),
      ],
    ),
  ];

  // ============ LISTENING ============
  static const List<IeltsListeningSection> listeningSections = [
    IeltsListeningSection(
      title: 'Section 1: University Accommodation',
      context: 'A conversation between a student and an accommodation officer about housing options.',
      audioText: '''Good morning, how can I help you today? Hi, I'm looking for accommodation for next semester. I'm a second-year student studying engineering. Of course. We have several options available. First, there's the new hall of residence on campus called Parkview. It's a single room with an en-suite bathroom, and includes all meals. The cost is eight hundred and fifty pounds per month. Alternatively, we have shared apartments off campus on Bridge Street. You'd share with three other students. Each person has their own bedroom, but the kitchen and bathroom are shared. That's five hundred and twenty pounds per month, and you arrange your own meals. There's also a homestay option where you live with a local family. That includes breakfast and dinner, and it's six hundred and seventy-five pounds per month. When would I need to move in? The semester starts on the fifteenth of September, but you can move in from the tenth. I'd recommend the earlier date so you can settle in before classes begin.''',
      questions: [
        IeltsQuestion(question: 'What subject is the student studying?', type: 'multiple_choice', options: ['Medicine', 'Engineering', 'Business', 'Architecture'], correctIndex: 1, explanation: 'The student says "I\'m a second-year student studying engineering."'),
        IeltsQuestion(question: 'How much does Parkview cost per month?', type: 'multiple_choice', options: ['£520', '£675', '£850', '£900'], correctIndex: 2, explanation: '"The cost is eight hundred and fifty pounds per month."'),
        IeltsQuestion(question: 'The shared apartment includes meals.', type: 'true_false_ng', options: ['True', 'False', 'Not Given'], correctIndex: 1, explanation: '"You arrange your own meals" for the shared apartment — FALSE.'),
        IeltsQuestion(question: 'When does the semester start?', type: 'multiple_choice', options: ['September 10', 'September 15', 'September 20', 'October 1'], correctIndex: 1, explanation: '"The semester starts on the fifteenth of September."'),
      ],
    ),
    IeltsListeningSection(
      title: 'Section 2: Museum Tour',
      context: 'A guide giving information about a museum to a group of visitors.',
      audioText: '''Welcome to the National Science Museum. Before we begin our tour, let me give you some practical information. The museum has four floors. We're currently on the ground floor, which houses the geology and natural history collections. The first floor is dedicated entirely to space exploration and astronomy. On the second floor, you'll find our interactive technology exhibits, which are particularly popular with younger visitors. The third floor contains temporary exhibitions, and this month we're featuring an exhibition on climate change which runs until the twenty-third of March. Photography is permitted in all areas except the temporary exhibition hall. The museum café is located on the ground floor near the east entrance. It serves hot meals until two thirty, and sandwiches and drinks until closing time at five thirty. If you have any questions during the tour, please don't hesitate to ask. Our tour will last approximately ninety minutes.''',
      questions: [
        IeltsQuestion(question: 'What is on the first floor?', type: 'multiple_choice', options: ['Natural history', 'Space exploration', 'Technology exhibits', 'Temporary exhibitions'], correctIndex: 1, explanation: '"The first floor is dedicated entirely to space exploration and astronomy."'),
        IeltsQuestion(question: 'Photography is allowed in all areas of the museum.', type: 'true_false_ng', options: ['True', 'False', 'Not Given'], correctIndex: 1, explanation: '"Photography is permitted in all areas except the temporary exhibition hall" — FALSE.'),
        IeltsQuestion(question: 'What time does the café stop serving hot meals?', type: 'multiple_choice', options: ['12:30', '2:30', '4:30', '5:30'], correctIndex: 1, explanation: '"It serves hot meals until two thirty."'),
        IeltsQuestion(question: 'How long will the tour last?', type: 'multiple_choice', options: ['60 minutes', '75 minutes', '90 minutes', '120 minutes'], correctIndex: 2, explanation: '"Our tour will last approximately ninety minutes."'),
      ],
    ),
    IeltsListeningSection(
      title: 'Section 3: Research Project Discussion',
      context: 'Two university students discussing their research project on social media usage.',
      audioText: '''So, how's the research going, Sarah? Well, I've finished collecting the survey data. We got responses from two hundred and forty-three participants, which is above our target of two hundred. That's great. What about the age distribution? Most respondents were between eighteen and twenty-five, which makes sense given we distributed it through the university. But we also got about thirty percent from the twenty-six to thirty-five age group through online forums. Interesting. Have you started the analysis yet? I've done some preliminary work. The most striking finding so far is that seventy-eight percent of respondents check social media within fifteen minutes of waking up. And there seems to be a strong correlation between heavy social media use and reported anxiety levels. That aligns with previous research. What methodology should we use for the full analysis? I think we should use a mixed methods approach. Quantitative analysis for the survey data, then qualitative coding for the open-ended responses. We could use thematic analysis for that. Agreed. When is the deadline for the first draft? Professor Williams wants it by the fourteenth of November. That gives us about three weeks.''',
      questions: [
        IeltsQuestion(question: 'How many survey responses did they receive?', type: 'multiple_choice', options: ['200', '230', '243', '250'], correctIndex: 2, explanation: '"We got responses from two hundred and forty-three participants."'),
        IeltsQuestion(question: 'What percentage check social media within 15 minutes of waking?', type: 'multiple_choice', options: ['58%', '68%', '78%', '88%'], correctIndex: 2, explanation: '"Seventy-eight percent of respondents check social media within fifteen minutes of waking up."'),
        IeltsQuestion(question: 'They plan to use only quantitative analysis.', type: 'true_false_ng', options: ['True', 'False', 'Not Given'], correctIndex: 1, explanation: 'They plan "a mixed methods approach. Quantitative analysis for the survey data, then qualitative coding" — FALSE.'),
        IeltsQuestion(question: 'When is the first draft due?', type: 'multiple_choice', options: ['November 4', 'November 14', 'November 24', 'December 14'], correctIndex: 1, explanation: '"Professor Williams wants it by the fourteenth of November."'),
      ],
    ),
  ];

  // ============ WRITING ============
  static const List<IeltsWritingTask> writingTasks = [
    IeltsWritingTask(
      taskType: 'Task 1',
      prompt: 'The bar chart below shows the percentage of adults in five countries who used the internet to buy products in 2010 and 2020.\n\nSummarise the information by selecting and reporting the main features, and make comparisons where relevant.\n\nCountry | 2010 | 2020\nUK: 58% → 82%\nGermany: 45% → 74%\nJapan: 32% → 68%\nBrazil: 15% → 52%\nIndia: 8% → 38%',
      sampleAnswer: '''The bar chart illustrates the proportion of adults who purchased products online in five different countries, comparing figures from 2010 and 2020.

Overall, internet shopping increased significantly across all five nations over the decade, with the UK maintaining the highest rate throughout. The most dramatic growth occurred in developing economies.

In 2010, the UK led with 58% of adults shopping online, followed by Germany at 45% and Japan at 32%. Brazil and India had considerably lower figures, at 15% and 8% respectively.

By 2020, all countries had experienced substantial growth. The UK reached 82%, representing an increase of 24 percentage points. Germany rose to 74%, while Japan climbed to 68%, more than doubling its 2010 figure. The most remarkable growth was seen in Brazil, which surged from 15% to 52%, and India, which increased nearly fivefold from 8% to 38%.

In conclusion, while developed nations maintained higher absolute rates of online shopping, developing countries demonstrated more rapid proportional growth over the period.''',
      tips: [
        'Write at least 150 words for Task 1',
        'DO NOT give opinions — just describe the data',
        'Include an overview paragraph highlighting main trends',
        'Compare data points — don\'t just list numbers',
        'Use varied language: increased, rose, climbed, surged, grew',
      ],
      usefulPhrases: [
        'The chart illustrates/shows/compares...',
        'Overall, the most noticeable trend is...',
        'There was a significant/slight/gradual increase in...',
        'X rose from... to..., representing an increase of...',
        'By contrast, / In comparison, / Similarly,',
        'The most dramatic change occurred in...',
        'X experienced a sharp rise/steady decline...',
        'The figure for X was approximately/roughly...',
      ],
    ),
    IeltsWritingTask(
      taskType: 'Task 2',
      prompt: 'Some people believe that technology has made our lives more complex, while others argue that it has simplified daily living.\n\nDiscuss both views and give your own opinion.\n\nGive reasons for your answer and include any relevant examples from your own knowledge or experience.\n\nWrite at least 250 words.',
      sampleAnswer: '''The impact of technology on the complexity of modern life is a subject of considerable debate. While some contend that technological advances have created new burdens and complications, others maintain that they have fundamentally simplified everyday tasks. This essay will examine both perspectives before presenting my own view.

Those who argue that technology has complicated our lives point to several valid concerns. The constant connectivity enabled by smartphones means that many workers find it impossible to disconnect from their jobs, blurring the boundary between professional and personal time. Furthermore, the sheer volume of choices available—from streaming services to online shopping platforms—can create decision fatigue and a sense of being overwhelmed. Additionally, concerns about data privacy and cybersecurity represent entirely new categories of worry that previous generations never faced.

On the other hand, there is compelling evidence that technology has simplified many aspects of daily living. Tasks that once consumed hours—such as banking, grocery shopping, and communicating with distant relatives—can now be accomplished in minutes through smartphone applications. Navigation technology has virtually eliminated the problem of getting lost, while translation apps have reduced language barriers for travellers. In the workplace, automation has freed many workers from repetitive manual tasks, allowing them to focus on more creative and fulfilling work.

In my opinion, while technology has undeniably introduced certain new complexities, its net effect has been overwhelmingly positive in simplifying daily life. The key lies not in rejecting technology but in developing the digital literacy skills necessary to use it judiciously and maintain appropriate boundaries.''',
      tips: [
        'Write at least 250 words for Task 2',
        'Structure: Introduction → Body 1 → Body 2 → Conclusion',
        'Address BOTH views before giving your opinion',
        'Use specific examples to support each argument',
        'Conclusion should clearly state YOUR position',
        'Vary your sentence structures (simple, compound, complex)',
      ],
      usefulPhrases: [
        'This essay will examine both perspectives before...',
        'Those who argue that... point to several valid concerns.',
        'On the other hand, there is compelling evidence that...',
        'Furthermore, / Moreover, / Additionally,',
        'In my opinion, / From my perspective,',
        'While it is true that..., I believe...',
        'The key lies not in... but in...',
        'Taking everything into consideration,',
      ],
    ),
    IeltsWritingTask(
      taskType: 'Task 2',
      prompt: 'In many countries, the gap between the rich and the poor is increasing. What problems does this cause? What solutions can you suggest?\n\nGive reasons for your answer and include any relevant examples from your own knowledge or experience.\n\nWrite at least 250 words.',
      sampleAnswer: '''The widening disparity between wealthy and disadvantaged segments of society is a growing concern in many nations. This essay will discuss the problems arising from this trend and propose potential solutions.

The increasing wealth gap generates several significant social problems. Firstly, it undermines social cohesion by creating separate worlds for rich and poor, reducing empathy and mutual understanding between classes. This segregation often manifests in unequal access to quality education and healthcare, perpetuating a cycle of poverty across generations. Secondly, economic inequality can fuel social unrest and political instability, as disenfranchised populations lose faith in democratic institutions. Research consistently demonstrates a correlation between high inequality and elevated crime rates.

Several measures could help address this issue. Progressive taxation policies, where higher earners contribute a larger proportion of their income, can fund social programs that benefit disadvantaged communities. Governments should also invest heavily in public education, ensuring that quality schooling is available regardless of family income. This creates pathways for social mobility that break the intergenerational poverty cycle. Additionally, raising minimum wages to living wage levels and strengthening workers\' rights through legislation can help ensure that economic growth is shared more equitably.

Furthermore, corporate governance reforms requiring companies to consider employee welfare alongside shareholder returns could reduce the extreme concentration of wealth at the top. Tax incentives for businesses that invest in disadvantaged communities may also encourage more equitable distribution of economic opportunities.

In conclusion, while wealth inequality poses serious threats to social stability and individual opportunity, a combination of fiscal policy reform, educational investment, and corporate accountability measures can work toward a more equitable society.''',
      tips: [
        'Problem-solution essays: clearly separate problems from solutions',
        'Use topic sentences at the start of each paragraph',
        'Support each point with explanation AND example',
        'Show cause-effect relationships',
        'Use formal academic vocabulary',
      ],
      usefulPhrases: [
        'The widening disparity between... is a growing concern.',
        'This essay will discuss the problems and propose solutions.',
        'Firstly, / Secondly, / Furthermore,',
        'This often manifests in...',
        'Research consistently demonstrates...',
        'Several measures could help address this issue.',
        'In conclusion, while... poses serious threats...',
        'A combination of... can work toward...',
      ],
    ),
  ];

  // ============ SPEAKING ============
  static const List<IeltsSpeakingPart> speakingParts = [
    IeltsSpeakingPart(
      part: 'Part 1',
      topic: 'Work & Study',
      questions: [
        'Do you work or are you a student?',
        'What do you like most about your job/studies?',
        'Would you like to change your job/field of study in the future?',
        'Do you prefer working alone or in a team?',
      ],
      sampleAnswers: [
        'I\'m currently working as a software developer at a tech company. I\'ve been in this role for about three years now, and I find it quite rewarding.',
        'What I enjoy most is the problem-solving aspect. Every day presents new challenges, and there\'s a real sense of satisfaction when you find an elegant solution to a complex problem. I also appreciate the collaborative environment.',
        'I\'m actually considering pursuing a master\'s degree in artificial intelligence. The field is evolving so rapidly, and I feel that deepening my knowledge would open up more interesting career opportunities in the long run.',
        'It depends on the nature of the task, really. For creative brainstorming, I prefer working in a team because different perspectives often lead to better ideas. However, for tasks requiring deep concentration, I\'m definitely more productive working independently.',
      ],
      vocabulary: ['rewarding', 'challenging', 'collaborative', 'pursuing', 'evolving rapidly', 'deepening my knowledge', 'in the long run', 'it depends on'],
    ),
    IeltsSpeakingPart(
      part: 'Part 1',
      topic: 'Hometown & Living',
      questions: [
        'Where are you from?',
        'What do you like about your city?',
        'Has your city changed much in recent years?',
        'Would you prefer to live in a city or the countryside?',
      ],
      sampleAnswers: [
        'I\'m originally from Jakarta, the capital of Indonesia. It\'s a sprawling metropolis with around eleven million people, known for its vibrant street food culture and dynamic business environment.',
        'What I appreciate most is the diversity and energy of the city. There\'s always something happening—cultural festivals, exhibitions, concerts. You never run out of things to do. The food scene is incredible too.',
        'Absolutely, it\'s transformed dramatically over the past decade. There\'s been massive investment in public transportation—we now have a metro system that didn\'t exist ten years ago. The skyline has changed considerably too, with numerous new high-rise developments.',
        'While I enjoy the conveniences of city life, I think ideally I\'d prefer a balance—living on the outskirts of a city where you get the peace and green spaces of the countryside but can still access urban amenities within a short commute.',
      ],
      vocabulary: ['sprawling metropolis', 'vibrant', 'dynamic', 'transformed dramatically', 'massive investment', 'on the outskirts', 'amenities', 'short commute'],
    ),
    IeltsSpeakingPart(
      part: 'Part 2',
      topic: 'Describe a skill you learned that you are proud of',
      questions: [
        'You should say:\n- What the skill is\n- How you learned it\n- How long it took to learn\n- And explain why you are proud of this skill',
      ],
      sampleAnswers: [
        '''I'd like to talk about learning to speak English fluently, which is a skill I'm particularly proud of.

I started learning English seriously about five years ago when I realized it was essential for my career in technology. Initially, my level was quite basic—I could read simple texts but struggled enormously with speaking and listening comprehension.

I adopted a multi-pronged approach to learning. First, I enrolled in an English conversation class that met three times a week. Simultaneously, I began consuming English-language media daily—podcasts during my commute, Netflix series with subtitles in the evening, and English-language news articles over breakfast. I also found a language exchange partner online, and we would practice speaking for an hour twice a week via video call.

The whole process took approximately two to three years before I felt genuinely comfortable in English. There were certainly periods of frustration, particularly when I hit plateaus where progress seemed to stall. However, persistence and consistency eventually paid off.

I'm proud of this achievement for several reasons. Firstly, it required sustained discipline over a long period. Secondly, it has genuinely transformed my professional prospects—I've since been promoted to a role involving international communication. Most importantly, it proved to me that with dedication, we can master skills that initially seem impossibly difficult.''',
      ],
      vocabulary: ['multi-pronged approach', 'enrolled in', 'simultaneously', 'consuming media', 'language exchange', 'hit plateaus', 'persistence', 'sustained discipline', 'transformed my prospects'],
    ),
    IeltsSpeakingPart(
      part: 'Part 2',
      topic: 'Describe a place you visited that exceeded your expectations',
      questions: [
        'You should say:\n- Where the place was\n- When you went there\n- What you did there\n- And explain why it exceeded your expectations',
      ],
      sampleAnswers: [
        '''I'd like to describe my trip to Yogyakarta, a cultural city in central Java, which I visited last year and which completely surpassed my expectations.

I went there during a long weekend in August with two close friends. We'd originally planned it as a quick getaway—just a short break from our demanding jobs in Jakarta—without expecting anything extraordinary.

During our three days there, we visited the ancient temple of Borobudur at sunrise, which was absolutely breathtaking. We also explored the Sultan's Palace, wandered through traditional markets, tried local cuisine like gudeg and bakpia, and took a cycling tour through rice paddies on the outskirts of the city.

What exceeded my expectations was the depth of cultural richness in such a compact area. I hadn't anticipated how well-preserved the historical sites would be, or how warm and welcoming the local people were. The combination of ancient heritage, artistic traditions—particularly batik and silver crafting—and stunning natural landscapes created an experience far richer than I'd imagined.

I think what surprised me most was the pace of life there. Despite being a popular tourist destination, it retained an authentic, unhurried character that felt genuinely refreshing compared to the chaos of Jakarta. It reminded me that sometimes the most rewarding travel experiences come from managing our expectations and remaining open to surprise.''',
      ],
      vocabulary: ['surpassed expectations', 'demanding jobs', 'quick getaway', 'breathtaking', 'well-preserved', 'cultural richness', 'retained an authentic character', 'unhurried', 'rewarding experience'],
    ),
    IeltsSpeakingPart(
      part: 'Part 3',
      topic: 'Education & Learning',
      questions: [
        'How has technology changed the way people learn?',
        'Do you think online learning can replace traditional classrooms?',
        'What skills will be most important for young people in the future?',
        'Is it better to specialize in one subject or study many different things?',
      ],
      sampleAnswers: [
        'Technology has fundamentally transformed the learning landscape. Students now have access to virtually unlimited resources through the internet—from video lectures by world-class professors to interactive simulations. Learning has become more personalized, with adaptive platforms that adjust difficulty based on individual progress. However, I think the most significant change is accessibility—people in remote areas can now access the same quality of educational content as those in major cities.',
        'I believe online learning can complement traditional education but not fully replace it, particularly for younger students. The social dimension of learning—collaborating with peers, developing interpersonal skills, and receiving immediate feedback from teachers—is difficult to replicate online. That said, for adult learners and professional development, online platforms offer flexibility that traditional classrooms simply cannot match.',
        'I think critical thinking and adaptability will be paramount. As automation increasingly handles routine tasks, the ability to analyze complex problems, think creatively, and adapt to rapidly changing circumstances will distinguish successful individuals. Digital literacy is obviously essential, but perhaps more importantly, emotional intelligence and the ability to collaborate across cultures will become increasingly valuable in a globalized workforce.',
        'I think there\'s merit in both approaches, but ideally a combination works best. A broad foundation in your early education develops versatility and helps you discover your strengths and passions. Then, as you progress into higher education and your career, specialization becomes more valuable because depth of expertise is what typically creates professional distinction and innovation.',
      ],
      vocabulary: ['fundamentally transformed', 'virtually unlimited', 'adaptive platforms', 'complement rather than replace', 'social dimension', 'paramount', 'distinguish successful individuals', 'digital literacy', 'emotional intelligence', 'professional distinction'],
    ),
    IeltsSpeakingPart(
      part: 'Part 3',
      topic: 'Environment & Society',
      questions: [
        'Whose responsibility is it to protect the environment—governments or individuals?',
        'Do you think people are more aware of environmental issues now than in the past?',
        'What changes could cities make to become more environmentally friendly?',
        'Is economic growth compatible with environmental protection?',
      ],
      sampleAnswers: [
        'I believe it\'s a shared responsibility, but at different scales. Governments need to establish regulatory frameworks, invest in sustainable infrastructure, and hold corporations accountable for their environmental impact. Individuals, meanwhile, can make daily choices that collectively make a significant difference—reducing consumption, choosing sustainable products, and supporting environmentally responsible businesses. However, I\'d argue that systemic change driven by policy has far greater impact than individual actions alone.',
        'Undoubtedly, yes. Environmental awareness has increased dramatically, particularly among younger generations. Social media and documentaries have made the impacts of climate change, plastic pollution, and deforestation much more visible. However, awareness doesn\'t always translate into action. There\'s often a gap between what people know they should do and what they actually do in their daily lives—what psychologists call the "intention-action gap."',
        'Cities could implement several changes. Investing heavily in public transportation and cycling infrastructure would reduce dependence on private cars. Mandating green building standards for all new construction and retrofitting existing buildings would cut energy consumption significantly. Creating more urban green spaces serves dual purposes—absorbing carbon while improving residents\' mental health. Implementing circular economy principles, where waste is minimized and materials are continuously recycled, would also make a substantial difference.',
        'I think they can be compatible, but it requires fundamentally rethinking what we mean by "growth." Traditional measures like GDP don\'t account for environmental degradation or resource depletion. If we shift toward a model of sustainable growth—where economic activity creates value without depleting natural capital—then the two can coexist. The renewable energy sector is a perfect example: it generates economic activity and jobs while reducing environmental harm.',
      ],
      vocabulary: ['regulatory frameworks', 'hold accountable', 'systemic change', 'translate into action', 'intention-action gap', 'retrofitting', 'circular economy', 'sustainable growth', 'natural capital', 'depleting resources'],
    ),
  ];
}
