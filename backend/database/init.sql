SET
  SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";

CREATE DATABASE IF NOT EXISTS quizzler DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

USE quizzler;

DROP TABLE IF EXISTS categories;

CREATE TABLE IF NOT EXISTS categories (
  categoryID int(11) NOT NULL AUTO_INCREMENT,
  categoryName varchar(100) NOT NULL,
  description varchar(255) DEFAULT NULL,
  PRIMARY KEY (categoryID)
) ENGINE = InnoDB AUTO_INCREMENT = 29 DEFAULT CHARSET = utf8;

INSERT INTO
  categories (categoryID, categoryName, description)
VALUES
  (
    1,
    'General Knowledge',
    'Mixed questions from all categories.'
  ),
  (
    2,
    'Art & Literature',
    'Questions related to famous works of art and literature.'
  ),
  (
    3,
    'Geography',
    'Questions about world locations, capitals, and landmarks.'
  ),
  (
    4,
    'History',
    'Test your knowledge of world history.'
  ),
  (
    5,
    'Music',
    'Trivia on different genres, artists, and history of music.'
  ),
  (
    6,
    'Science',
    'Questions about physics, chemistry, biology, and more.'
  ),
  (
    7,
    'Sports',
    'Sports-related questions from different disciplines.'
  ),
  (
    8,
    'Television',
    'Trivia about popular TV shows, characters, and episodes.'
  ),
  (
    9,
    'Video Games',
    'Questions covering popular video games and their history.'
  ),
  (
    10,
    'Math',
    'Mathematics-related trivia from basic to advanced concepts.'
  ),
  (
    11,
    'Film',
    'Questions about movies, directors, and cinematic history.'
  ),
  (
    12,
    'Technology',
    'Trivia about tech advancements, history, and key figures.'
  ),
  (
    13,
    'Mythology',
    'Questions about various mythologies across cultures.'
  ),
  (
    14,
    'Nature',
    'Trivia about wildlife, plants, and ecosystems in the natural world.'
  ),
  (
    16,
    'Space & Astronomy',
    'Trivia about the history of space exploration and astronomy in general.'
  ),
  (
    17,
    'Food & Drink',
    'Test your knowledge about cuisine, ingredients, and drinks.'
  ),
  (
    18,
    'SciFi & Fantasy',
    'Questions related to the science fiction and fantasy genres.'
  ),
  (
    20,
    'Language',
    'Test your knowledge about languages and linguistics.'
  ),
  (
    21,
    'Pop Culture: 1960s',
    'Questions about entertainment, music, movies, and celebrities from the 1960s.'
  ),
  (
    22,
    'Pop Culture: 1970s',
    'Questions about entertainment, music, movies, and celebrities from the 1970s.'
  ),
  (
    23,
    'Pop Culture: 1980s',
    'Questions about entertainment, music, movies, and celebrities from the 1980s.'
  ),
  (
    24,
    'Pop Culture: 1990s',
    'Questions about entertainment, music, movies, and celebrities from the 1990s.'
  ),
  (
    25,
    'Pop Culture: 2000s',
    'Questions about entertainment, music, movies, and celebrities from the 2000s.'
  ),
  (
    26,
    'Pop Culture: 2010s',
    'Questions about entertainment, music, movies, and celebrities from the 2010s.'
  ),
  (
    28,
    'Health & Medicine',
    'A category that tests your knowledge on various health practices and medicinal knowledge'
  );

DROP TABLE IF EXISTS leaderboards;

CREATE TABLE IF NOT EXISTS leaderboards (
  leaderboardID int(11) NOT NULL AUTO_INCREMENT,
  userID int(11) DEFAULT NULL,
  categoryID int(11) DEFAULT NULL,
  totalScore int(11) DEFAULT '0',
  isOverall tinyint(1) NOT NULL,
  PRIMARY KEY (leaderboardID),
  KEY userID (userID),
  KEY leaderboards_ibfk_2 (categoryID)
) ENGINE = InnoDB AUTO_INCREMENT = 69 DEFAULT CHARSET = utf8;

INSERT INTO
  leaderboards (
    leaderboardID,
    userID,
    categoryID,
    totalScore,
    isOverall
  )
VALUES
  (1, 1, 2, 10, 0),
  (2, 1, 3, 10, 0),
  (3, 1, 5, 10, 0),
  (4, 1, 9, 0, 0),
  (5, 1, 13, 300, 0),
  (6, 1, 14, 10, 0),
  (7, 1, 16, 10, 0),
  (8, 2, 2, 10, 0),
  (9, 2, 3, 10, 0),
  (10, 2, 5, 0, 0),
  (11, 2, 9, 10, 0),
  (12, 2, 13, 130, 0),
  (13, 2, 14, 10, 0),
  (14, 2, 16, 10, 0),
  (15, 3, 2, 10, 0),
  (16, 3, 3, 0, 0),
  (17, 3, 5, 10, 0),
  (18, 3, 9, 10, 0),
  (19, 3, 13, 260, 0),
  (20, 3, 14, 10, 0),
  (21, 3, 16, 10, 0),
  (22, 4, 2, 10, 0),
  (23, 4, 3, 10, 0),
  (24, 4, 5, 10, 0),
  (25, 4, 9, 10, 0),
  (26, 4, 13, 280, 0),
  (27, 4, 14, 0, 0),
  (28, 4, 16, 10, 0),
  (29, 5, 2, 10, 0),
  (30, 5, 3, 10, 0),
  (31, 5, 5, 10, 0),
  (32, 5, 9, 10, 0),
  (33, 5, 13, 250, 0),
  (34, 5, 14, 10, 0),
  (35, 5, 16, 0, 0),
  (64, 1, NULL, 350, 1),
  (65, 2, NULL, 180, 1),
  (66, 3, NULL, 310, 1),
  (67, 4, NULL, 330, 1),
  (68, 5, NULL, 300, 1);

DROP TABLE IF EXISTS questions;

CREATE TABLE IF NOT EXISTS questions (
  questionID int(11) NOT NULL AUTO_INCREMENT,
  categoryID int(11) DEFAULT NULL,
  difficulty enum('Easy', 'Medium', 'Hard') NOT NULL,
  questionText text NOT NULL,
  correctAnswer varchar(100) NOT NULL,
  options json DEFAULT NULL,
  PRIMARY KEY (questionID),
  KEY questions_ibfk_1 (categoryID)
) ENGINE = InnoDB AUTO_INCREMENT = 332 DEFAULT CHARSET = utf8;

INSERT INTO
  questions (
    questionID,
    categoryID,
    difficulty,
    questionText,
    correctAnswer,
    options
  )
VALUES
  (
    3,
    13,
    'Easy',
    'Which Norse god wields the hammer Mjölnir?',
    'Thor',
    '[\"Thor\", \"Odin\", \"Loki\", \"Balder\"]'
  ),
  (
    4,
    13,
    'Easy',
    'Who is the Greek goddess of wisdom?',
    'Athena',
    '[\"Athena\", \"Aphrodite\", \"Hera\", \"Artemis\"]'
  ),
  (
    5,
    13,
    'Easy',
    'In Roman mythology, who is the god of war?',
    'Mars',
    '[\"Mars\", \"Jupiter\", \"Mercury\", \"Apollo\"]'
  ),
  (
    6,
    13,
    'Easy',
    'Who is the Egyptian god of the underworld?',
    'Osiris',
    '[\"Osiris\", \"Anubis\", \"Horus\", \"Set\"]'
  ),
  (
    7,
    13,
    'Easy',
    'In Greek mythology, who is known as the god of the sea?',
    'Poseidon',
    '[\"Poseidon\", \"Zeus\", \"Hades\", \"Hermes\"]'
  ),
  (
    8,
    13,
    'Easy',
    'Who was the hero of the Trojan War known for his strength?',
    'Achilles',
    '[\"Achilles\", \"Hercules\", \"Odysseus\", \"Paris\"]'
  ),
  (
    9,
    13,
    'Easy',
    'In Norse mythology, what is the name of Thor’s father?',
    'Odin',
    '[\"Odin\", \"Loki\", \"Balder\", \"Heimdall\"]'
  ),
  (
    10,
    13,
    'Easy',
    'Which Greek hero completed 12 labors?',
    'Hercules',
    '[\"Hercules\", \"Achilles\", \"Odysseus\", \"Perseus\"]'
  ),
  (
    11,
    13,
    'Easy',
    'Who is the Greek god of the underworld?',
    'Hades',
    '[\"Hades\", \"Zeus\", \"Poseidon\", \"Apollo\"]'
  ),
  (
    12,
    13,
    'Easy',
    'What creature has the body of a lion and the head of a human in Egyptian mythology?',
    'Sphinx',
    '[\"Sphinx\", \"Griffin\", \"Manticore\", \"Chimera\"]'
  ),
  (
    13,
    13,
    'Easy',
    'Who is the Greek goddess of the hunt?',
    'Artemis',
    '[\"Artemis\", \"Athena\", \"Aphrodite\", \"Hera\"]'
  ),
  (
    14,
    13,
    'Easy',
    'Which Roman god is equivalent to the Greek god Hermes?',
    'Mercury',
    '[\"Mercury\", \"Apollo\", \"Mars\", \"Jupiter\"]'
  ),
  (
    15,
    13,
    'Easy',
    'Who is the Greek god of the sun?',
    'Apollo',
    '[\"Apollo\", \"Helios\", \"Zeus\", \"Hades\"]'
  ),
  (
    16,
    13,
    'Easy',
    'In Egyptian mythology, who is the goddess of motherhood and fertility?',
    'Isis',
    '[\"Isis\", \"Bastet\", \"Hathor\", \"Nut\"]'
  ),
  (
    17,
    13,
    'Easy',
    'Who was the Greek goddess of love and beauty?',
    'Aphrodite',
    '[\"Aphrodite\", \"Hera\", \"Athena\", \"Artemis\"]'
  ),
  (
    18,
    13,
    'Easy',
    'Which Greek god was known for his winged sandals?',
    'Hermes',
    '[\"Hermes\", \"Apollo\", \"Zeus\", \"Ares\"]'
  ),
  (
    19,
    13,
    'Easy',
    'Who is the king of the Norse gods?',
    'Odin',
    '[\"Odin\", \"Thor\", \"Loki\", \"Freyr\"]'
  ),
  (
    20,
    13,
    'Easy',
    'In Greek mythology, who is the messenger of the gods?',
    'Hermes',
    '[\"Hermes\", \"Apollo\", \"Zeus\", \"Ares\"]'
  ),
  (
    21,
    13,
    'Easy',
    'What was the name of the Greek god of wine?',
    'Dionysus',
    '[\"Dionysus\", \"Zeus\", \"Apollo\", \"Hermes\"]'
  ),
  (
    22,
    13,
    'Easy',
    'Who is the goddess of marriage and queen of the Greek gods?',
    'Hera',
    '[\"Hera\", \"Aphrodite\", \"Athena\", \"Artemis\"]'
  ),
  (
    23,
    13,
    'Easy',
    'In Norse mythology, what is the name of Thor’s hammer?',
    'Mjölnir',
    '[\"Mjölnir\", \"Gungnir\", \"Skofnung\", \"Gram\"]'
  ),
  (
    24,
    13,
    'Easy',
    'Who is the Greek god of war?',
    'Ares',
    '[\"Ares\", \"Zeus\", \"Apollo\", \"Hermes\"]'
  ),
  (
    25,
    13,
    'Easy',
    'Which creature in Greek mythology has snakes for hair?',
    'Medusa',
    '[\"Medusa\", \"Sphinx\", \"Hydra\", \"Cerberus\"]'
  ),
  (
    26,
    13,
    'Easy',
    'Who is the Roman god of the sea?',
    'Neptune',
    '[\"Neptune\", \"Jupiter\", \"Mars\", \"Apollo\"]'
  ),
  (
    27,
    13,
    'Easy',
    'In Norse mythology, what is the name of the world tree?',
    'Yggdrasil',
    '[\"Yggdrasil\", \"Asgard\", \"Midgard\", \"Valhalla\"]'
  ),
  (
    28,
    13,
    'Easy',
    'Who is the Greek god of the sky?',
    'Zeus',
    '[\"Zeus\", \"Poseidon\", \"Hades\", \"Apollo\"]'
  ),
  (
    29,
    13,
    'Easy',
    'In Egyptian mythology, what animal is associated with Anubis?',
    'Jackal',
    '[\"Jackal\", \"Falcon\", \"Cat\", \"Crocodile\"]'
  ),
  (
    30,
    13,
    'Easy',
    'Who was the hero that killed the Minotaur?',
    'Theseus',
    '[\"Theseus\", \"Perseus\", \"Hercules\", \"Odysseus\"]'
  ),
  (
    31,
    13,
    'Easy',
    'What is the Greek name for the god of the underworld?',
    'Hades',
    '[\"Hades\", \"Pluto\", \"Thanatos\", \"Ares\"]'
  ),
  (
    32,
    13,
    'Easy',
    'Who is the Roman counterpart of the Greek goddess Athena?',
    'Minerva',
    '[\"Minerva\", \"Juno\", \"Venus\", \"Diana\"]'
  ),
  (
    33,
    13,
    'Easy',
    'Who is the goddess of the hearth in Greek mythology?',
    'Hestia',
    '[\"Hestia\", \"Hera\", \"Aphrodite\", \"Demeter\"]'
  ),
  (
    34,
    13,
    'Easy',
    'Which Egyptian goddess is known as the mother of the pharaohs?',
    'Isis',
    '[\"Isis\", \"Bastet\", \"Nut\", \"Nephthys\"]'
  ),
  (
    35,
    13,
    'Easy',
    'What was the Greek hero Achilles’ only weakness?',
    'Heel',
    '[\"Heel\", \"Hand\", \"Eye\", \"Heart\"]'
  ),
  (
    36,
    13,
    'Easy',
    'Who is the Greek god of music and prophecy?',
    'Apollo',
    '[\"Apollo\", \"Hermes\", \"Zeus\", \"Ares\"]'
  ),
  (
    37,
    13,
    'Easy',
    'Which mythical creature is a horse with a single horn on its head?',
    'Unicorn',
    '[\"Unicorn\", \"Pegasus\", \"Centaur\", \"Chimera\"]'
  ),
  (
    38,
    13,
    'Easy',
    'In Greek mythology, who flew too close to the sun?',
    'Icarus',
    '[\"Icarus\", \"Daedalus\", \"Perseus\", \"Hermes\"]'
  ),
  (
    39,
    13,
    'Easy',
    'Who is the goddess of agriculture in Greek mythology?',
    'Demeter',
    '[\"Demeter\", \"Hera\", \"Athena\", \"Artemis\"]'
  ),
  (
    40,
    13,
    'Easy',
    'What is the name of the Greek hero who performed the 12 labors?',
    'Hercules',
    '[\"Hercules\", \"Achilles\", \"Odysseus\", \"Perseus\"]'
  ),
  (
    41,
    13,
    'Easy',
    'Which Greek god is associated with the lyre?',
    'Apollo',
    '[\"Apollo\", \"Zeus\", \"Hermes\", \"Ares\"]'
  ),
  (
    42,
    13,
    'Easy',
    'In Norse mythology, who is the trickster god?',
    'Loki',
    '[\"Loki\", \"Thor\", \"Odin\", \"Freyja\"]'
  ),
  (
    43,
    13,
    'Easy',
    'What is the Roman name for the Greek god Zeus?',
    'Jupiter',
    '[\"Jupiter\", \"Mars\", \"Neptune\", \"Mercury\"]'
  ),
  (
    44,
    13,
    'Easy',
    'Who is the goddess of love in Roman mythology?',
    'Venus',
    '[\"Venus\", \"Juno\", \"Minerva\", \"Diana\"]'
  ),
  (
    45,
    13,
    'Easy',
    'In Greek mythology, who opened a box releasing all the evils of humanity?',
    'Pandora',
    '[\"Pandora\", \"Medusa\", \"Hera\", \"Athena\"]'
  ),
  (
    46,
    13,
    'Easy',
    'Which creature in Greek mythology has the body of a horse and the torso of a man?',
    'Centaur',
    '[\"Centaur\", \"Satyr\", \"Minotaur\", \"Griffin\"]'
  ),
  (
    47,
    13,
    'Easy',
    'What is the name of the winged horse in Greek mythology?',
    'Pegasus',
    '[\"Pegasus\", \"Unicorn\", \"Griffin\", \"Chimera\"]'
  ),
  (
    48,
    13,
    'Easy',
    'In Norse mythology, who is the goddess of love and fertility?',
    'Freyja',
    '[\"Freyja\", \"Frigg\", \"Sif\", \"Idunn\"]'
  ),
  (
    49,
    13,
    'Easy',
    'Who was the Greek hero who defeated Medusa?',
    'Perseus',
    '[\"Perseus\", \"Hercules\", \"Theseus\", \"Achilles\"]'
  ),
  (
    50,
    13,
    'Easy',
    'In Egyptian mythology, who is the god of chaos?',
    'Set',
    '[\"Set\", \"Osiris\", \"Ra\", \"Anubis\"]'
  ),
  (
    51,
    13,
    'Easy',
    'Who was the Roman god of love?',
    'Cupid',
    '[\"Cupid\", \"Venus\", \"Mars\", \"Jupiter\"]'
  ),
  (
    52,
    13,
    'Easy',
    'Which Greek goddess was born from sea foam?',
    'Aphrodite',
    '[\"Aphrodite\", \"Hera\", \"Athena\", \"Artemis\"]'
  ),
  (
    53,
    13,
    'Easy',
    'What is the name of the Greek winged horse?',
    'Pegasus',
    '[\"Pegasus\", \"Griffin\", \"Sphinx\", \"Chimera\"]'
  ),
  (
    54,
    13,
    'Easy',
    'In Greek mythology, who is the goddess of the harvest?',
    'Demeter',
    '[\"Demeter\", \"Hestia\", \"Hera\", \"Athena\"]'
  ),
  (
    55,
    13,
    'Easy',
    'Which creature in Greek mythology is half-man and half-bull?',
    'Minotaur',
    '[\"Minotaur\", \"Centaur\", \"Satyr\", \"Griffin\"]'
  ),
  (
    56,
    13,
    'Easy',
    'What is the name of the hall where Norse warriors go after death?',
    'Valhalla',
    '[\"Valhalla\", \"Asgard\", \"Midgard\", \"Hel\"]'
  ),
  (
    57,
    13,
    'Easy',
    'Who was the Greek god of sleep?',
    'Hypnos',
    '[\"Hypnos\", \"Thanatos\", \"Hades\", \"Morpheus\"]'
  ),
  (
    58,
    13,
    'Easy',
    'In Greek mythology, who was the first woman on Earth?',
    'Pandora',
    '[\"Pandora\", \"Hera\", \"Athena\", \"Artemis\"]'
  ),
  (
    59,
    13,
    'Easy',
    'Who is the Roman counterpart of the Greek god Poseidon?',
    'Neptune',
    '[\"Neptune\", \"Jupiter\", \"Mars\", \"Apollo\"]'
  ),
  (
    60,
    13,
    'Easy',
    'Which Greek goddess is known for her wisdom and war strategy?',
    'Athena',
    '[\"Athena\", \"Hera\", \"Artemis\", \"Aphrodite\"]'
  ),
  (
    61,
    13,
    'Easy',
    'Who is the Egyptian goddess of cats?',
    'Bastet',
    '[\"Bastet\", \"Isis\", \"Sekhmet\", \"Hathor\"]'
  ),
  (
    62,
    13,
    'Easy',
    'In Greek mythology, who is the god of the dead?',
    'Hades',
    '[\"Hades\", \"Zeus\", \"Poseidon\", \"Hermes\"]'
  ),
  (
    63,
    13,
    'Easy',
    'Which Norse god is known as the Allfather?',
    'Odin',
    '[\"Odin\", \"Thor\", \"Loki\", \"Freyja\"]'
  ),
  (
    64,
    13,
    'Easy',
    'Who is the Greek goddess of the moon?',
    'Artemis',
    '[\"Artemis\", \"Hera\", \"Athena\", \"Aphrodite\"]'
  ),
  (
    65,
    13,
    'Easy',
    'What is the name of the Greek hero who fought in the Trojan War?',
    'Achilles',
    '[\"Achilles\", \"Odysseus\", \"Hector\", \"Paris\"]'
  ),
  (
    66,
    13,
    'Easy',
    'In Norse mythology, what is the name of the realm of the gods?',
    'Asgard',
    '[\"Asgard\", \"Midgard\", \"Jotunheim\", \"Vanaheim\"]'
  ),
  (
    67,
    13,
    'Easy',
    'Who is the Roman goddess of the hunt?',
    'Diana',
    '[\"Diana\", \"Venus\", \"Minerva\", \"Juno\"]'
  ),
  (
    68,
    13,
    'Easy',
    'Which Egyptian god is depicted with the head of a falcon?',
    'Horus',
    '[\"Horus\", \"Anubis\", \"Ra\", \"Osiris\"]'
  ),
  (
    69,
    13,
    'Easy',
    'In Greek mythology, what is the name of the river that souls must cross to enter the underworld?',
    'Styx',
    '[\"Styx\", \"Lethe\", \"Acheron\", \"Cocytus\"]'
  ),
  (
    70,
    13,
    'Easy',
    'Who is the Greek goddess of victory?',
    'Nike',
    '[\"Nike\", \"Athena\", \"Hera\", \"Aphrodite\"]'
  ),
  (
    71,
    13,
    'Easy',
    'Which mythical creature has the body of a lion, the head of a goat, and a serpent for a tail?',
    'Chimera',
    '[\"Chimera\", \"Sphinx\", \"Griffin\", \"Manticore\"]'
  ),
  (
    72,
    13,
    'Easy',
    'Who is the goddess of magic in Greek mythology?',
    'Hecate',
    '[\"Hecate\", \"Hera\", \"Athena\", \"Artemis\"]'
  ),
  (
    73,
    13,
    'Easy',
    'In Roman mythology, who is the god of the sun?',
    'Sol',
    '[\"Sol\", \"Apollo\", \"Mercury\", \"Jupiter\"]'
  ),
  (
    74,
    13,
    'Easy',
    'Which Greek god is known for stealing fire for humanity?',
    'Prometheus',
    '[\"Prometheus\", \"Hermes\", \"Zeus\", \"Hephaestus\"]'
  ),
  (
    75,
    13,
    'Easy',
    'Who is the Egyptian god of the sky?',
    'Horus',
    '[\"Horus\", \"Ra\", \"Osiris\", \"Set\"]'
  ),
  (
    76,
    13,
    'Easy',
    'What is the name of the three-headed dog that guards the entrance to the underworld in Greek mythology?',
    'Cerberus',
    '[\"Cerberus\", \"Hydra\", \"Chimera\", \"Orthrus\"]'
  ),
  (
    77,
    13,
    'Easy',
    'Who is the Greek god of fire and blacksmiths?',
    'Hephaestus',
    '[\"Hephaestus\", \"Ares\", \"Apollo\", \"Hermes\"]'
  ),
  (
    78,
    13,
    'Easy',
    'In Norse mythology, what is the name of the bridge that connects Asgard to Midgard?',
    'Bifröst',
    '[\"Bifröst\", \"Gjallarbrú\", \"Jotunheim\", \"Yggdrasil\"]'
  ),
  (
    79,
    13,
    'Easy',
    'Who is the Greek god of wine and revelry?',
    'Dionysus',
    '[\"Dionysus\", \"Zeus\", \"Hermes\", \"Apollo\"]'
  ),
  (
    80,
    13,
    'Easy',
    'What is the name of the Greek hero who sailed on the Argo?',
    'Jason',
    '[\"Jason\", \"Perseus\", \"Hercules\", \"Theseus\"]'
  ),
  (
    81,
    13,
    'Easy',
    'Who is the Roman god of time?',
    'Saturn',
    '[\"Saturn\", \"Jupiter\", \"Neptune\", \"Pluto\"]'
  ),
  (
    82,
    13,
    'Easy',
    'In Greek mythology, who is known for her incredible beauty that sparked the Trojan War?',
    'Helen',
    '[\"Helen\", \"Aphrodite\", \"Hera\", \"Athena\"]'
  ),
  (
    83,
    13,
    'Easy',
    'Which mythical creature in Greek mythology is known for its deadly gaze?',
    'Basilisk',
    '[\"Basilisk\", \"Medusa\", \"Chimera\", \"Hydra\"]'
  ),
  (
    84,
    13,
    'Easy',
    'Who is the Greek god of the underworld’s river of woe?',
    'Acheron',
    '[\"Acheron\", \"Styx\", \"Lethe\", \"Cocytus\"]'
  ),
  (
    85,
    13,
    'Easy',
    'In Norse mythology, what is the name of the end of the world?',
    'Ragnarok',
    '[\"Ragnarok\", \"Valhalla\", \"Midgard\", \"Jotunheim\"]'
  ),
  (
    86,
    13,
    'Easy',
    'What is the name of the goddess of the rainbow in Greek mythology?',
    'Iris',
    '[\"Iris\", \"Hera\", \"Aphrodite\", \"Artemis\"]'
  ),
  (
    87,
    13,
    'Easy',
    'Who is the Norse god of mischief?',
    'Loki',
    '[\"Loki\", \"Thor\", \"Odin\", \"Balder\"]'
  ),
  (
    88,
    13,
    'Easy',
    'In Greek mythology, who was the wife of Hades?',
    'Persephone',
    '[\"Persephone\", \"Hera\", \"Athena\", \"Artemis\"]'
  ),
  (
    89,
    13,
    'Easy',
    'Which Greek hero was known for his journey to Ithaca?',
    'Odysseus',
    '[\"Odysseus\", \"Achilles\", \"Hercules\", \"Theseus\"]'
  ),
  (
    90,
    13,
    'Easy',
    'Who is the Egyptian goddess of truth and justice?',
    'Ma\'at',
    '[\"Ma\'at\", \"Isis\", \"Hathor\", \"Sekhmet\"]'
  ),
  (
    91,
    13,
    'Medium',
    'In Greek mythology, who was the father of the hero Perseus?',
    'Zeus',
    '[\"Zeus\", \"Poseidon\", \"Hades\", \"Ares\"]'
  ),
  (
    92,
    13,
    'Medium',
    'Which Hindu deity is known as the Destroyer?',
    'Shiva',
    '[\"Shiva\", \"Vishnu\", \"Brahma\", \"Indra\"]'
  ),
  (
    93,
    13,
    'Medium',
    'In Norse mythology, what is the name of Loki\'s daughter who rules over the underworld?',
    'Hel',
    '[\"Hel\", \"Freyja\", \"Sif\", \"Idunn\"]'
  ),
  (
    94,
    13,
    'Medium',
    'Who is the Celtic god of the sea?',
    'Manannán mac Lir',
    '[\"Manannán mac Lir\", \"Lugh\", \"Dagda\", \"Morrigan\"]'
  ),
  (
    95,
    13,
    'Medium',
    'In Egyptian mythology, who is the mother of Horus?',
    'Isis',
    '[\"Isis\", \"Hathor\", \"Nephthys\", \"Bastet\"]'
  ),
  (
    96,
    13,
    'Medium',
    'Which Japanese goddess is associated with the sun?',
    'Amaterasu',
    '[\"Amaterasu\", \"Susanoo\", \"Tsukuyomi\", \"Inari\"]'
  ),
  (
    97,
    13,
    'Medium',
    'In Greek mythology, who is the god of sleep?',
    'Hypnos',
    '[\"Hypnos\", \"Thanatos\", \"Morpheus\", \"Eros\"]'
  ),
  (
    98,
    13,
    'Medium',
    'What was the Roman name for the Greek hero Heracles?',
    'Hercules',
    '[\"Hercules\", \"Mercury\", \"Mars\", \"Achilles\"]'
  ),
  (
    99,
    13,
    'Medium',
    'In Hindu mythology, who is the consort of the god Vishnu?',
    'Lakshmi',
    '[\"Lakshmi\", \"Parvati\", \"Saraswati\", \"Durga\"]'
  ),
  (
    100,
    13,
    'Medium',
    'In Greek mythology, what creature is half-man, half-goat?',
    'Satyr',
    '[\"Satyr\", \"Centaur\", \"Minotaur\", \"Chimera\"]'
  ),
  (
    101,
    13,
    'Medium',
    'Who is the Aztec god of war and the sun?',
    'Huitzilopochtli',
    '[\"Huitzilopochtli\", \"Quetzalcoatl\", \"Tezcatlipoca\", \"Xipe Totec\"]'
  ),
  (
    102,
    13,
    'Medium',
    'In Norse mythology, what is the name of the ship made entirely of the nails of the dead?',
    'Naglfar',
    '[\"Naglfar\", \"Skidbladnir\", \"Hringhorni\", \"Fólkvangr\"]'
  ),
  (
    103,
    13,
    'Medium',
    'Who was the Greek god of shepherds and flocks?',
    'Pan',
    '[\"Pan\", \"Hermes\", \"Apollo\", \"Dionysus\"]'
  ),
  (
    104,
    13,
    'Medium',
    'In Egyptian mythology, what is the name of the serpent Apophis represents?',
    'Chaos',
    '[\"Chaos\", \"Death\", \"Life\", \"Fertility\"]'
  ),
  (
    105,
    13,
    'Medium',
    'Who is the Hindu god of wisdom and learning, often depicted with an elephant head?',
    'Ganesha',
    '[\"Ganesha\", \"Hanuman\", \"Shiva\", \"Krishna\"]'
  ),
  (
    106,
    13,
    'Medium',
    'In Roman mythology, who is the goddess of the hearth?',
    'Vesta',
    '[\"Vesta\", \"Venus\", \"Diana\", \"Minerva\"]'
  ),
  (
    107,
    13,
    'Medium',
    'What is the name of the spear that Odin carries?',
    'Gungnir',
    '[\"Gungnir\", \"Mjölnir\", \"Gram\", \"Hofund\"]'
  ),
  (
    108,
    13,
    'Medium',
    'In Greek mythology, who was condemned to hold up the sky for eternity?',
    'Atlas',
    '[\"Atlas\", \"Prometheus\", \"Sisyphus\", \"Hercules\"]'
  ),
  (
    109,
    13,
    'Medium',
    'Which Egyptian god is considered the protector of the pharaohs?',
    'Horus',
    '[\"Horus\", \"Ra\", \"Osiris\", \"Anubis\"]'
  ),
  (
    110,
    13,
    'Medium',
    'Who is the Celtic goddess of war and sovereignty?',
    'Morrigan',
    '[\"Morrigan\", \"Brigid\", \"Rhiannon\", \"Aine\"]'
  ),
  (
    111,
    13,
    'Medium',
    'In Norse mythology, who guards the Bifröst, the bridge to Asgard?',
    'Heimdall',
    '[\"Heimdall\", \"Loki\", \"Thor\", \"Balder\"]'
  ),
  (
    112,
    13,
    'Medium',
    'In Hindu mythology, who is the god of fire?',
    'Agni',
    '[\"Agni\", \"Indra\", \"Vayu\", \"Varuna\"]'
  ),
  (
    113,
    13,
    'Medium',
    'In Greek mythology, who is the goddess of the rainbow?',
    'Iris',
    '[\"Iris\", \"Hera\", \"Aphrodite\", \"Demeter\"]'
  ),
  (
    114,
    13,
    'Medium',
    'What is the name of the three-headed dog that guards the entrance to the underworld in Greek mythology?',
    'Cerberus',
    '[\"Cerberus\", \"Orthrus\", \"Hydra\", \"Chimera\"]'
  ),
  (
    115,
    13,
    'Medium',
    'In Egyptian mythology, who was the personification of the sky and the wife of Geb?',
    'Nut',
    '[\"Nut\", \"Isis\", \"Bastet\", \"Hathor\"]'
  ),
  (
    116,
    13,
    'Medium',
    'Who is the chief god in the Incan pantheon?',
    'Inti',
    '[\"Inti\", \"Viracocha\", \"Pachamama\", \"Supay\"]'
  ),
  (
    117,
    13,
    'Medium',
    'Which Greek hero was known for killing the Chimera?',
    'Bellerophon',
    '[\"Bellerophon\", \"Perseus\", \"Hercules\", \"Theseus\"]'
  ),
  (
    118,
    13,
    'Medium',
    'In Norse mythology, who is the god of poetry, music, and magic?',
    'Odin',
    '[\"Odin\", \"Thor\", \"Loki\", \"Balder\"]'
  ),
  (
    119,
    13,
    'Medium',
    'In Celtic mythology, what is the name of the otherworldly realm of the gods and the dead?',
    'Annwn',
    '[\"Annwn\", \"Tír na nÓg\", \"Avalon\", \"Elphame\"]'
  ),
  (
    120,
    13,
    'Medium',
    'Who is the Mesopotamian goddess of love and war?',
    'Ishtar',
    '[\"Ishtar\", \"Tiamat\", \"Ereshkigal\", \"Inanna\"]'
  ),
  (
    121,
    13,
    'Medium',
    'In Greek mythology, who was the wife of the hero Odysseus?',
    'Penelope',
    '[\"Penelope\", \"Helen\", \"Clytemnestra\", \"Andromache\"]'
  ),
  (
    122,
    13,
    'Medium',
    'Which Japanese god is known as the god of the sea and storms?',
    'Susanoo',
    '[\"Susanoo\", \"Amaterasu\", \"Hachiman\", \"Raijin\"]'
  ),
  (
    123,
    13,
    'Medium',
    'In Hindu mythology, who is known as the god of wealth and the treasurer of the gods?',
    'Kubera',
    '[\"Kubera\", \"Lakshmi\", \"Vishnu\", \"Yama\"]'
  ),
  (
    124,
    13,
    'Medium',
    'Who is the Greek goddess associated with the moon and hunting?',
    'Artemis',
    '[\"Artemis\", \"Selene\", \"Hera\", \"Athena\"]'
  ),
  (
    125,
    13,
    'Medium',
    'What is the name of the dragon slain by the hero Beowulf?',
    'Grendel',
    '[\"Grendel\", \"Fafnir\", \"Jormungandr\", \"Nidhogg\"]'
  ),
  (
    126,
    13,
    'Medium',
    'In Egyptian mythology, which goddess is depicted with the head of a lioness?',
    'Sekhmet',
    '[\"Sekhmet\", \"Bastet\", \"Hathor\", \"Nephthys\"]'
  ),
  (
    127,
    13,
    'Medium',
    'Who is the Norse god of fertility, sunshine, and rain?',
    'Freyr',
    '[\"Freyr\", \"Thor\", \"Loki\", \"Odin\"]'
  ),
  (
    128,
    13,
    'Medium',
    'In Greek mythology, who is the god of dreams?',
    'Morpheus',
    '[\"Morpheus\", \"Hypnos\", \"Thanatos\", \"Eros\"]'
  ),
  (
    129,
    13,
    'Medium',
    'Which Greek hero ventured into the underworld to bring back his wife, Eurydice?',
    'Orpheus',
    '[\"Orpheus\", \"Theseus\", \"Perseus\", \"Hercules\"]'
  ),
  (
    130,
    13,
    'Medium',
    'What is the name of the Celtic festival that marks the beginning of winter and is thought to be the origin of Halloween?',
    'Samhain',
    '[\"Samhain\", \"Beltane\", \"Imbolc\", \"Lughnasadh\"]'
  ),
  (
    131,
    13,
    'Medium',
    'In Greek mythology, who is the god of the wild and nature?',
    'Pan',
    '[\"Pan\", \"Dionysus\", \"Hermes\", \"Apollo\"]'
  ),
  (
    132,
    13,
    'Medium',
    'Which Roman goddess is the equivalent of the Greek goddess Demeter?',
    'Ceres',
    '[\"Ceres\", \"Juno\", \"Venus\", \"Minerva\"]'
  ),
  (
    133,
    13,
    'Medium',
    'In Norse mythology, what is the name of the hall where warriors who die in battle are taken?',
    'Valhalla',
    '[\"Valhalla\", \"Asgard\", \"Midgard\", \"Hel\"]'
  ),
  (
    134,
    13,
    'Medium',
    'Who is the Greek goddess of the hearth and home?',
    'Hestia',
    '[\"Hestia\", \"Hera\", \"Athena\", \"Aphrodite\"]'
  ),
  (
    135,
    13,
    'Medium',
    'In Egyptian mythology, who is the god of mummification and the afterlife?',
    'Anubis',
    '[\"Anubis\", \"Osiris\", \"Horus\", \"Thoth\"]'
  ),
  (
    136,
    13,
    'Medium',
    'Which Hindu goddess is known for her fierce and destructive aspect, often depicted with a necklace of skulls?',
    'Kali',
    '[\"Kali\", \"Durga\", \"Lakshmi\", \"Saraswati\"]'
  ),
  (
    137,
    13,
    'Medium',
    'Who was the Greek goddess of the harvest and agriculture?',
    'Demeter',
    '[\"Demeter\", \"Hera\", \"Artemis\", \"Athena\"]'
  ),
  (
    138,
    13,
    'Medium',
    'In Norse mythology, what is the name of the realm inhabited by elves?',
    'Alfheim',
    '[\"Alfheim\", \"Midgard\", \"Vanaheim\", \"Muspelheim\"]'
  ),
  (
    139,
    13,
    'Medium',
    'Who is the Japanese god of thunder and storms?',
    'Raijin',
    '[\"Raijin\", \"Fujin\", \"Susanoo\", \"Amaterasu\"]'
  ),
  (
    140,
    13,
    'Medium',
    'What is the name of the legendary sword that King Arthur pulled from the stone?',
    'Excalibur',
    '[\"Excalibur\", \"Caliburn\", \"Durendal\", \"Gram\"]'
  ),
  (
    141,
    13,
    'Medium',
    'In Hindu mythology, who is the lord of death and justice?',
    'Yama',
    '[\"Yama\", \"Indra\", \"Varuna\", \"Agni\"]'
  ),
  (
    142,
    13,
    'Medium',
    'Who is the Roman god of the underworld?',
    'Pluto',
    '[\"Pluto\", \"Hades\", \"Mars\", \"Jupiter\"]'
  ),
  (
    143,
    13,
    'Medium',
    'In Greek mythology, who is the Titan of the sun?',
    'Helios',
    '[\"Helios\", \"Apollo\", \"Hyperion\", \"Atlas\"]'
  ),
  (
    144,
    13,
    'Medium',
    'Which Norse god is associated with poetry, music, and magic?',
    'Odin',
    '[\"Odin\", \"Loki\", \"Thor\", \"Freyr\"]'
  ),
  (
    145,
    13,
    'Medium',
    'What is the name of the dragon in Norse mythology that gnaws at the roots of Yggdrasil?',
    'Nidhogg',
    '[\"Nidhogg\", \"Fafnir\", \"Jormungandr\", \"Grendel\"]'
  ),
  (
    146,
    13,
    'Medium',
    'In Egyptian mythology, who is the god of wisdom, writing, and knowledge?',
    'Thoth',
    '[\"Thoth\", \"Anubis\", \"Horus\", \"Osiris\"]'
  ),
  (
    147,
    13,
    'Medium',
    'Who is the Greek goddess of magic, witchcraft, and ghosts?',
    'Hecate',
    '[\"Hecate\", \"Hera\", \"Aphrodite\", \"Artemis\"]'
  ),
  (
    148,
    13,
    'Medium',
    'In Japanese mythology, who is the god of rice and fertility?',
    'Inari',
    '[\"Inari\", \"Amaterasu\", \"Raijin\", \"Susanoo\"]'
  ),
  (
    149,
    13,
    'Medium',
    'What is the name of the creature in Greek mythology that is half-man, half-horse?',
    'Centaur',
    '[\"Centaur\", \"Satyr\", \"Minotaur\", \"Sphinx\"]'
  ),
  (
    150,
    13,
    'Medium',
    'Which Greek god is associated with the lyre and the laurel wreath?',
    'Apollo',
    '[\"Apollo\", \"Hermes\", \"Dionysus\", \"Zeus\"]'
  ),
  (
    151,
    13,
    'Hard',
    'In Norse mythology, what is the name of the dragon who guards the treasure hoard of the Nibelung?',
    'Fafnir',
    '[\"Fafnir\", \"Jormungandr\", \"Nidhogg\", \"Grendel\"]'
  ),
  (
    152,
    13,
    'Hard',
    'Who was the Greek god of the river Styx, who ferried souls across it into the underworld?',
    'Charon',
    '[\"Charon\", \"Hades\", \"Thanatos\", \"Acheron\"]'
  ),
  (
    153,
    13,
    'Hard',
    'In Japanese mythology, who is the deity of the sea and storms, often depicted as a fearsome dragon?',
    'Ryujin',
    '[\"Ryujin\", \"Susanoo\", \"Amaterasu\", \"Hachiman\"]'
  ),
  (
    154,
    13,
    'Hard',
    'What is the name of the Babylonian goddess who descended to the underworld to find her lover, resulting in the seasons?',
    'Ishtar',
    '[\"Ishtar\", \"Ereshkigal\", \"Tiamat\", \"Astarte\"]'
  ),
  (
    155,
    13,
    'Hard',
    'In Greek mythology, which Titan was condemned to bear the heavens upon his shoulders?',
    'Atlas',
    '[\"Atlas\", \"Prometheus\", \"Hyperion\", \"Oceanus\"]'
  ),
  (
    156,
    13,
    'Hard',
    'In Hindu mythology, who is the preserver and protector of the universe?',
    'Vishnu',
    '[\"Vishnu\", \"Shiva\", \"Brahma\", \"Indra\"]'
  ),
  (
    157,
    13,
    'Hard',
    'Who is the Celtic god associated with the arts, crafts, and prophecy?',
    'Lugh',
    '[\"Lugh\", \"Dagda\", \"Cernunnos\", \"Arawn\"]'
  ),
  (
    158,
    13,
    'Hard',
    'What is the name of the Egyptian god of the inundation of the Nile, associated with fertility and rebirth?',
    'Hapi',
    '[\"Hapi\", \"Geb\", \"Osiris\", \"Sobek\"]'
  ),
  (
    159,
    13,
    'Hard',
    'Which Norse god is known as the trickster, the father of monsters, and is bound with the entrails of his own son?',
    'Loki',
    '[\"Loki\", \"Fenrir\", \"Jormungandr\", \"Hel\"]'
  ),
  (
    160,
    13,
    'Hard',
    'In Greek mythology, who was turned into a laurel tree to escape the advances of Apollo?',
    'Daphne',
    '[\"Daphne\", \"Echo\", \"Syrinx\", \"Io\"]'
  ),
  (
    161,
    13,
    'Hard',
    'What is the name of the sacred cow in Hindu mythology that fulfills all desires?',
    'Kamadhenu',
    '[\"Kamadhenu\", \"Surabhi\", \"Nandi\", \"Gau Mata\"]'
  ),
  (
    162,
    13,
    'Hard',
    'In Roman mythology, which god is associated with the doorway and transitions, often depicted with two faces?',
    'Janus',
    '[\"Janus\", \"Mercury\", \"Vulcan\", \"Jupiter\"]'
  ),
  (
    163,
    13,
    'Hard',
    'Who is the Mesopotamian god of freshwater, wisdom, and creation?',
    'Enki',
    '[\"Enki\", \"Anu\", \"Marduk\", \"Ea\"]'
  ),
  (
    164,
    13,
    'Hard',
    'In Norse mythology, what is the name of the wolf destined to devour Odin during Ragnarök?',
    'Fenrir',
    '[\"Fenrir\", \"Sköll\", \"Hati\", \"Garm\"]'
  ),
  (
    165,
    13,
    'Hard',
    'What is the name of the Hindu epic that tells the story of Lord Rama and his quest to rescue his wife Sita?',
    'Ramayana',
    '[\"Ramayana\", \"Mahabharata\", \"Bhagavad Gita\", \"Vedas\"]'
  ),
  (
    166,
    13,
    'Hard',
    'In Egyptian mythology, who is the goddess of scorpions and magic, who protected the pharaoh from harm?',
    'Serqet',
    '[\"Serqet\", \"Isis\", \"Nephthys\", \"Maat\"]'
  ),
  (
    167,
    13,
    'Hard',
    'Who is the Japanese god of fishermen, fortune, and luck, often depicted with a large red sea bream?',
    'Ebisu',
    '[\"Ebisu\", \"Daikokuten\", \"Hotei\", \"Benzaiten\"]'
  ),
  (
    168,
    13,
    'Hard',
    'In Greek mythology, who is known as the mother of monsters, including the Chimera and Cerberus?',
    'Echidna',
    '[\"Echidna\", \"Medusa\", \"Scylla\", \"Charybdis\"]'
  ),
  (
    169,
    13,
    'Hard',
    'Which Roman goddess is equivalent to the Greek goddess of magic, Hecate?',
    'Trivia',
    '[\"Trivia\", \"Diana\", \"Proserpina\", \"Vesta\"]'
  ),
  (
    170,
    13,
    'Hard',
    'What is the name of the Celtic festival that marks the beginning of summer and involves lighting bonfires?',
    'Beltane',
    '[\"Beltane\", \"Samhain\", \"Imbolc\", \"Lughnasadh\"]'
  ),
  (
    171,
    13,
    'Hard',
    'In Greek mythology, who is the Muse of epic poetry?',
    'Calliope',
    '[\"Calliope\", \"Clio\", \"Euterpe\", \"Erato\"]'
  ),
  (
    172,
    13,
    'Hard',
    'Who was the Greek god of healing and medicine?',
    'Asclepius',
    '[\"Asclepius\", \"Apollo\", \"Hermes\", \"Panacea\"]'
  ),
  (
    173,
    13,
    'Hard',
    'In Hindu mythology, what is the name of the mountain that serves as the center of the universe?',
    'Mount Meru',
    '[\"Mount Meru\", \"Kailash\", \"Himalaya\", \"Vindhya\"]'
  ),
  (
    174,
    13,
    'Hard',
    'What is the name of the spear that was used by the Gaulish hero Lugh to defeat the Fomorians?',
    'Spear of Lugh',
    '[\"Spear of Lugh\", \"Gáe Bolg\", \"Gungnir\", \"Rhindon\"]'
  ),
  (
    175,
    13,
    'Hard',
    'In Egyptian mythology, which god was considered the \"Opener of the Ways\" and was often depicted as a jackal or a dog?',
    'Anubis',
    '[\"Anubis\", \"Osiris\", \"Horus\", \"Thoth\"]'
  ),
  (
    176,
    13,
    'Hard',
    'Who is the Norse goddess of love, beauty, and fertility, known for her magical necklace Brísingamen?',
    'Freyja',
    '[\"Freyja\", \"Frigg\", \"Idunn\", \"Sif\"]'
  ),
  (
    177,
    13,
    'Hard',
    'In Greek mythology, which god is associated with boundaries, travelers, and commerce, often depicted with winged sandals?',
    'Hermes',
    '[\"Hermes\", \"Apollo\", \"Dionysus\", \"Hephaestus\"]'
  ),
  (
    178,
    13,
    'Hard',
    'What is the name of the Hindu goddess of destruction and transformation, often depicted with a necklace of skulls?',
    'Kali',
    '[\"Kali\", \"Durga\", \"Parvati\", \"Saraswati\"]'
  ),
  (
    179,
    13,
    'Hard',
    'In Japanese mythology, who is the god of fire, who was born from Izanagi and Izanami?',
    'Kagutsuchi',
    '[\"Kagutsuchi\", \"Amaterasu\", \"Tsukuyomi\", \"Susanoo\"]'
  ),
  (
    180,
    13,
    'Hard',
    'Who is the Greek god of the west wind, often considered the gentlest of the Anemoi?',
    'Zephyrus',
    '[\"Zephyrus\", \"Boreas\", \"Notus\", \"Eurus\"]'
  ),
  (
    181,
    13,
    'Hard',
    'What is the name of the river in Norse mythology that separates the land of the living from the land of the dead?',
    'Gjöll',
    '[\"Gjöll\", \"Ifing\", \"Elivagar\", \"Bifröst\"]'
  ),
  (
    182,
    13,
    'Hard',
    'In Egyptian mythology, which god is depicted with the head of an ibis?',
    'Thoth',
    '[\"Thoth\", \"Horus\", \"Ra\", \"Anubis\"]'
  ),
  (
    183,
    13,
    'Hard',
    'Who is the Celtic goddess of fire, poetry, and smithcraft, celebrated during Imbolc?',
    'Brigid',
    '[\"Brigid\", \"Morrigan\", \"Danu\", \"Aine\"]'
  ),
  (
    184,
    13,
    'Hard',
    'In Greek mythology, who was the wife of Orpheus, whom he tried to rescue from the underworld?',
    'Eurydice',
    '[\"Eurydice\", \"Persephone\", \"Andromeda\", \"Helen\"]'
  ),
  (
    185,
    13,
    'Hard',
    'Which Hindu god is known as the remover of obstacles, often depicted with an elephant head?',
    'Ganesha',
    '[\"Ganesha\", \"Hanuman\", \"Vishnu\", \"Shiva\"]'
  ),
  (
    186,
    13,
    'Hard',
    'In Norse mythology, who is the ruler of Helheim, the realm of the dead?',
    'Hel',
    '[\"Hel\", \"Odin\", \"Loki\", \"Freyja\"]'
  ),
  (
    187,
    13,
    'Hard',
    'What is the name of the Greek goddess of the hearth, home, and domestic life?',
    'Hestia',
    '[\"Hestia\", \"Hera\", \"Aphrodite\", \"Demeter\"]'
  ),
  (
    188,
    13,
    'Hard',
    'In Egyptian mythology, who is the god of chaos, desert, and storms?',
    'Set',
    '[\"Set\", \"Osiris\", \"Ra\", \"Anubis\"]'
  ),
  (
    189,
    13,
    'Hard',
    'Who is the Greek goddess of victory, often depicted with wings?',
    'Nike',
    '[\"Nike\", \"Athena\", \"Hera\", \"Artemis\"]'
  ),
  (
    190,
    13,
    'Hard',
    'In Hindu mythology, who is the god of rain and thunderstorms, wielding the weapon Vajra?',
    'Indra',
    '[\"Indra\", \"Varuna\", \"Agni\", \"Vayu\"]'
  ),
  (
    191,
    13,
    'Hard',
    'What is the name of the Greek hero who killed the Minotaur in the Labyrinth?',
    'Theseus',
    '[\"Theseus\", \"Heracles\", \"Perseus\", \"Achilles\"]'
  ),
  (
    192,
    13,
    'Hard',
    'In Norse mythology, what is the name of the rooster that will crow to signal the beginning of Ragnarök?',
    'Gullinkambi',
    '[\"Gullinkambi\", \"Fjalarr\", \"Surtur\", \"Ratatoskr\"]'
  ),
  (
    193,
    13,
    'Hard',
    'Who is the Greek god of wine, fertility, and ritual madness?',
    'Dionysus',
    '[\"Dionysus\", \"Apollo\", \"Ares\", \"Hermes\"]'
  ),
  (
    194,
    13,
    'Hard',
    'In Egyptian mythology, what is the name of the celestial cow goddess who bore Ra?',
    'Hathor',
    '[\"Hathor\", \"Isis\", \"Nut\", \"Maat\"]'
  ),
  (
    195,
    13,
    'Hard',
    'Who is the Hindu goddess of knowledge, music, art, and learning?',
    'Saraswati',
    '[\"Saraswati\", \"Lakshmi\", \"Durga\", \"Parvati\"]'
  ),
  (
    196,
    13,
    'Hard',
    'In Celtic mythology, who is the god of the underworld and ruler of the dead?',
    'Arawn',
    '[\"Arawn\", \"Lugh\", \"Dagda\", \"Cernunnos\"]'
  ),
  (
    197,
    13,
    'Hard',
    'What is the name of the Greek hero who captured the Golden Fleece with the help of the sorceress Medea?',
    'Jason',
    '[\"Jason\", \"Odysseus\", \"Perseus\", \"Theseus\"]'
  ),
  (
    198,
    13,
    'Hard',
    'In Japanese mythology, who is the sun goddess who hid in a cave, causing the world to be plunged into darkness?',
    'Amaterasu',
    '[\"Amaterasu\", \"Susanoo\", \"Tsukuyomi\", \"Inari\"]'
  ),
  (
    199,
    13,
    'Hard',
    'Who is the Roman god of wine and revelry, equivalent to the Greek god Dionysus?',
    'Bacchus',
    '[\"Bacchus\", \"Jupiter\", \"Apollo\", \"Mars\"]'
  ),
  (
    200,
    13,
    'Hard',
    'In Norse mythology, who is the goddess associated with love, beauty, and fertility, also known as Frigg\'s rival?',
    'Freyja',
    '[\"Freyja\", \"Idunn\", \"Sif\", \"Frigg\"]'
  ),
  (
    203,
    2,
    'Easy',
    'Who painted the Mona Lisa?',
    'Leonardo da Vinci',
    '[\"Leonardo da Vinci\", \"Michelangelo\", \"Vincent van Gogh\", \"Pablo Picasso\"]'
  ),
  (
    204,
    2,
    'Easy',
    'Who wrote the novel \"Pride and Prejudice\"?',
    'Jane Austen',
    '[\"Jane Austen\", \"Charlotte Brontë\", \"Emily Brontë\", \"Virginia Woolf\"]'
  ),
  (
    205,
    2,
    'Easy',
    'In which country was Pablo Picasso born?',
    'Spain',
    '[\"Spain\", \"Italy\", \"France\", \"Mexico\"]'
  ),
  (
    206,
    2,
    'Easy',
    'Who is the author of \"1984\"?',
    'George Orwell',
    '[\"George Orwell\", \"Aldous Huxley\", \"Ray Bradbury\", \"J.K. Rowling\"]'
  ),
  (
    207,
    2,
    'Easy',
    'Which Shakespeare play features the characters Rosencrantz and Guildenstern?',
    'Hamlet',
    '[\"Hamlet\", \"Macbeth\", \"Othello\", \"King Lear\"]'
  ),
  (
    208,
    2,
    'Easy',
    'Who wrote the poem \"The Raven\"?',
    'Edgar Allan Poe',
    '[\"Edgar Allan Poe\", \"Robert Frost\", \"William Wordsworth\", \"T.S. Eliot\"]'
  ),
  (
    209,
    2,
    'Easy',
    'Who painted \"Starry Night\"?',
    'Vincent van Gogh',
    '[\"Vincent van Gogh\", \"Claude Monet\", \"Salvador Dalí\", \"Paul Cézanne\"]'
  ),
  (
    210,
    2,
    'Easy',
    'In which country is the Louvre Museum located?',
    'France',
    '[\"France\", \"Italy\", \"Spain\", \"Germany\"]'
  ),
  (
    211,
    2,
    'Easy',
    'Who wrote \"Moby-Dick\"?',
    'Herman Melville',
    '[\"Herman Melville\", \"Charles Dickens\", \"Mark Twain\", \"F. Scott Fitzgerald\"]'
  ),
  (
    212,
    2,
    'Easy',
    'Which artist is known for the painting \"The Persistence of Memory\"?',
    'Salvador Dalí',
    '[\"Salvador Dalí\", \"René Magritte\", \"Georgia O\'Keeffe\", \"Jackson Pollock\"]'
  ),
  (
    213,
    2,
    'Easy',
    'What novel begins with \"Call me Ishmael\"?',
    'Moby-Dick',
    '[\"Moby-Dick\", \"The Catcher in the Rye\", \"To Kill a Mockingbird\", \"The Great Gatsby\"]'
  ),
  (
    214,
    2,
    'Easy',
    'Who wrote \"The Catcher in the Rye\"?',
    'J.D. Salinger',
    '[\"J.D. Salinger\", \"F. Scott Fitzgerald\", \"Ernest Hemingway\", \"William Faulkner\"]'
  ),
  (
    215,
    2,
    'Easy',
    'Who painted the Sistine Chapel ceiling?',
    'Michelangelo',
    '[\"Michelangelo\", \"Leonardo da Vinci\", \"Raphael\", \"Donatello\"]'
  ),
  (
    216,
    2,
    'Easy',
    'Which famous artist cut off part of his ear?',
    'Vincent van Gogh',
    '[\"Vincent van Gogh\", \"Pablo Picasso\", \"Henri Matisse\", \"Paul Gauguin\"]'
  ),
  (
    217,
    2,
    'Easy',
    'Who wrote \"The Picture of Dorian Gray\"?',
    'Oscar Wilde',
    '[\"Oscar Wilde\", \"George Eliot\", \"Thomas Hardy\", \"Henry James\"]'
  ),
  (
    218,
    2,
    'Easy',
    'Which Greek philosopher wrote \"The Republic\"?',
    'Plato',
    '[\"Plato\", \"Aristotle\", \"Socrates\", \"Epicurus\"]'
  ),
  (
    219,
    2,
    'Easy',
    'What type of painting is associated with Georges Seurat?',
    'Pointillism',
    '[\"Pointillism\", \"Cubism\", \"Surrealism\", \"Impressionism\"]'
  ),
  (
    220,
    2,
    'Easy',
    'Who is the author of \"The Great Gatsby\"?',
    'F. Scott Fitzgerald',
    '[\"F. Scott Fitzgerald\", \"Ernest Hemingway\", \"John Steinbeck\", \"Mark Twain\"]'
  ),
  (
    221,
    2,
    'Easy',
    'Which famous literary character lives at 221B Baker Street?',
    'Sherlock Holmes',
    '[\"Sherlock Holmes\", \"Hercule Poirot\", \"Miss Marple\", \"Sam Spade\"]'
  ),
  (
    222,
    3,
    'Easy',
    'Which is the largest ocean on Earth?',
    'Pacific Ocean',
    '[\"Pacific Ocean\", \"Atlantic Ocean\", \"Indian Ocean\", \"Arctic Ocean\"]'
  ),
  (
    223,
    3,
    'Easy',
    'What is the capital of France?',
    'Paris',
    '[\"Paris\", \"London\", \"Berlin\", \"Rome\"]'
  ),
  (
    224,
    3,
    'Easy',
    'Which continent is the Sahara Desert located in?',
    'Africa',
    '[\"Africa\", \"Asia\", \"Australia\", \"South America\"]'
  ),
  (
    225,
    3,
    'Easy',
    'What is the longest river in the world?',
    'Nile',
    '[\"Nile\", \"Amazon\", \"Yangtze\", \"Mississippi\"]'
  ),
  (
    226,
    3,
    'Easy',
    'Which country has the largest population in the world?',
    'China',
    '[\"China\", \"India\", \"United States\", \"Russia\"]'
  ),
  (
    227,
    3,
    'Easy',
    'What is the capital city of Japan?',
    'Tokyo',
    '[\"Tokyo\", \"Beijing\", \"Seoul\", \"Bangkok\"]'
  ),
  (
    228,
    3,
    'Easy',
    'Which U.S. state is known as the \"Sunshine State\"?',
    'Florida',
    '[\"Florida\", \"California\", \"Hawaii\", \"Texas\"]'
  ),
  (
    229,
    3,
    'Easy',
    'Mount Everest is located in which mountain range?',
    'Himalayas',
    '[\"Himalayas\", \"Andes\", \"Rockies\", \"Alps\"]'
  ),
  (
    230,
    3,
    'Easy',
    'What is the smallest country in the world?',
    'Vatican City',
    '[\"Vatican City\", \"Monaco\", \"Liechtenstein\", \"San Marino\"]'
  ),
  (
    231,
    3,
    'Easy',
    'Which country is home to the Great Barrier Reef?',
    'Australia',
    '[\"Australia\", \"New Zealand\", \"Fiji\", \"Indonesia\"]'
  ),
  (
    232,
    3,
    'Easy',
    'Which city is known as \"The Big Apple\"?',
    'New York City',
    '[\"New York City\", \"Los Angeles\", \"Chicago\", \"Miami\"]'
  ),
  (
    233,
    3,
    'Easy',
    'Which river flows through the city of London?',
    'Thames',
    '[\"Thames\", \"Seine\", \"Danube\", \"Rhine\"]'
  ),
  (
    234,
    3,
    'Easy',
    'What is the capital of Canada?',
    'Ottawa',
    '[\"Ottawa\", \"Toronto\", \"Montreal\", \"Vancouver\"]'
  ),
  (
    235,
    3,
    'Easy',
    'Which country is known as the Land of the Rising Sun?',
    'Japan',
    '[\"Japan\", \"China\", \"South Korea\", \"Thailand\"]'
  ),
  (
    236,
    3,
    'Easy',
    'What is the capital city of Australia?',
    'Canberra',
    '[\"Canberra\", \"Sydney\", \"Melbourne\", \"Brisbane\"]'
  ),
  (
    237,
    3,
    'Easy',
    'Which country is famous for its tulips and windmills?',
    'Netherlands',
    '[\"Netherlands\", \"Denmark\", \"Belgium\", \"Germany\"]'
  ),
  (
    238,
    3,
    'Easy',
    'Which desert is the largest hot desert in the world?',
    'Sahara',
    '[\"Sahara\", \"Gobi\", \"Kalahari\", \"Atacama\"]'
  ),
  (
    239,
    3,
    'Easy',
    'What is the tallest mountain in Africa?',
    'Mount Kilimanjaro',
    '[\"Mount Kilimanjaro\", \"Mount Kenya\", \"Mount Elgon\", \"Ras Dashen\"]'
  ),
  (
    240,
    3,
    'Easy',
    'Which country is home to the Amazon Rainforest?',
    'Brazil',
    '[\"Brazil\", \"Peru\", \"Colombia\", \"Venezuela\"]'
  ),
  (
    241,
    3,
    'Easy',
    'Which country is the largest by land area?',
    'Russia',
    '[\"Russia\", \"Canada\", \"United States\", \"China\"]'
  ),
  (
    242,
    5,
    'Easy',
    'Which band released the song \"Bohemian Rhapsody\"?',
    'Queen',
    '[\"Queen\", \"The Beatles\", \"Pink Floyd\", \"Led Zeppelin\"]'
  ),
  (
    243,
    5,
    'Easy',
    'Who is known as the \"King of Pop\"?',
    'Michael Jackson',
    '[\"Michael Jackson\", \"Elvis Presley\", \"Prince\", \"David Bowie\"]'
  ),
  (
    244,
    5,
    'Easy',
    'What is the name of The Beatles\' first album?',
    'Please Please Me',
    '[\"Please Please Me\", \"Abbey Road\", \"Revolver\", \"Help!\"]'
  ),
  (
    245,
    5,
    'Easy',
    'Which singer is known for the hit song \"Rolling in the Deep\"?',
    'Adele',
    '[\"Adele\", \"Beyoncé\", \"Taylor Swift\", \"Lady Gaga\"]'
  ),
  (
    246,
    5,
    'Easy',
    'Which classical composer was deaf?',
    'Ludwig van Beethoven',
    '[\"Ludwig van Beethoven\", \"Wolfgang Amadeus Mozart\", \"Johann Sebastian Bach\", \"Franz Schubert\"]'
  ),
  (
    247,
    5,
    'Easy',
    'Which rock band is known for the album \"Dark Side of the Moon\"?',
    'Pink Floyd',
    '[\"Pink Floyd\", \"Led Zeppelin\", \"The Rolling Stones\", \"Queen\"]'
  ),
  (
    248,
    5,
    'Easy',
    'Who is the lead singer of U2?',
    'Bono',
    '[\"Bono\", \"Mick Jagger\", \"Freddie Mercury\", \"David Bowie\"]'
  ),
  (
    249,
    5,
    'Easy',
    'Which instrument does Yo-Yo Ma play?',
    'Cello',
    '[\"Cello\", \"Violin\", \"Piano\", \"Flute\"]'
  ),
  (
    250,
    5,
    'Easy',
    'What is the highest female singing voice?',
    'Soprano',
    '[\"Soprano\", \"Alto\", \"Mezzo-soprano\", \"Contralto\"]'
  ),
  (
    251,
    5,
    'Easy',
    'Who sang \"Purple Rain\"?',
    'Prince',
    '[\"Prince\", \"Michael Jackson\", \"Stevie Wonder\", \"David Bowie\"]'
  ),
  (
    252,
    5,
    'Easy',
    'Which artist is known for \"Like a Virgin\"?',
    'Madonna',
    '[\"Madonna\", \"Whitney Houston\", \"Cyndi Lauper\", \"Cher\"]'
  ),
  (
    253,
    5,
    'Easy',
    'Which American singer-songwriter is known as the \"Queen of Country\"?',
    'Dolly Parton',
    '[\"Dolly Parton\", \"Loretta Lynn\", \"Patsy Cline\", \"Tammy Wynette\"]'
  ),
  (
    254,
    5,
    'Easy',
    'What is the title of Beyoncé\'s debut solo album?',
    'Dangerously in Love',
    '[\"Dangerously in Love\", \"B\'Day\", \"Lemonade\", \"I Am... Sasha Fierce\"]'
  ),
  (
    255,
    5,
    'Easy',
    'Which 1970s rock band is known for the song \"Hotel California\"?',
    'Eagles',
    '[\"Eagles\", \"Fleetwood Mac\", \"The Rolling Stones\", \"The Who\"]'
  ),
  (
    256,
    5,
    'Easy',
    'Who is known as the \"Godfather of Soul\"?',
    'James Brown',
    '[\"James Brown\", \"Marvin Gaye\", \"Ray Charles\", \"Sam Cooke\"]'
  ),
  (
    257,
    5,
    'Easy',
    'Which instrument does Elton John famously play?',
    'Piano',
    '[\"Piano\", \"Guitar\", \"Saxophone\", \"Drums\"]'
  ),
  (
    258,
    5,
    'Easy',
    'Which singer released the hit song \"Billie Jean\"?',
    'Michael Jackson',
    '[\"Michael Jackson\", \"Prince\", \"Madonna\", \"Whitney Houston\"]'
  ),
  (
    259,
    5,
    'Easy',
    'Who is the lead singer of Aerosmith?',
    'Steven Tyler',
    '[\"Steven Tyler\", \"Robert Plant\", \"Axl Rose\", \"Mick Jagger\"]'
  ),
  (
    260,
    5,
    'Easy',
    'Which musical genre is known for artists like Tupac and Notorious B.I.G.?',
    'Hip Hop',
    '[\"Hip Hop\", \"Jazz\", \"Country\", \"Rock\"]'
  ),
  (
    261,
    5,
    'Easy',
    'Who was the lead guitarist of The Jimi Hendrix Experience?',
    'Jimi Hendrix',
    '[\"Jimi Hendrix\", \"Eric Clapton\", \"Jimmy Page\", \"Jeff Beck\"]'
  ),
  (
    262,
    9,
    'Easy',
    'What is the name of the protagonist in the \"Legend of Zelda\" series?',
    'Link',
    '[\"Link\", \"Zelda\", \"Ganon\", \"Tingle\"]'
  ),
  (
    263,
    9,
    'Easy',
    'Which video game series features the character Master Chief?',
    'Halo',
    '[\"Halo\", \"Call of Duty\", \"Gears of War\", \"Mass Effect\"]'
  ),
  (
    264,
    9,
    'Easy',
    'In which game would you use a \"creeper\" as an enemy?',
    'Minecraft',
    '[\"Minecraft\", \"Terraria\", \"Fortnite\", \"Roblox\"]'
  ),
  (
    265,
    9,
    'Easy',
    'What is the highest-selling video game of all time?',
    'Minecraft',
    '[\"Minecraft\", \"Grand Theft Auto V\", \"Tetris\", \"Fortnite\"]'
  ),
  (
    266,
    9,
    'Easy',
    'Who is the main character in the \"Super Mario\" series?',
    'Mario',
    '[\"Mario\", \"Luigi\", \"Bowser\", \"Yoshi\"]'
  ),
  (
    267,
    9,
    'Easy',
    'Which popular video game series is developed by Rockstar Games?',
    'Grand Theft Auto',
    '[\"Grand Theft Auto\", \"Red Dead Redemption\", \"Mafia\", \"Max Payne\"]'
  ),
  (
    268,
    9,
    'Easy',
    'What type of Pokemon is Pikachu?',
    'Electric',
    '[\"Electric\", \"Water\", \"Fire\", \"Grass\"]'
  ),
  (
    269,
    9,
    'Easy',
    'What game features the characters \"Lara Croft\"?',
    'Tomb Raider',
    '[\"Tomb Raider\", \"Uncharted\", \"The Last of Us\", \"Far Cry\"]'
  ),
  (
    270,
    9,
    'Easy',
    'In \"Fortnite,\" what is the goal of \"Battle Royale\" mode?',
    'Be the last player standing',
    '[\"Be the last player standing\", \"Find treasure\", \"Collect resources\", \"Capture the flag\"]'
  ),
  (
    271,
    9,
    'Easy',
    'Which game is known for the phrase \"The cake is a lie\"?',
    'Portal',
    '[\"Portal\", \"Half-Life\", \"Bioshock\", \"The Stanley Parable\"]'
  ),
  (
    272,
    9,
    'Easy',
    'Which game franchise has the slogan \"Gotta catch \'em all!\"?',
    'Pokemon',
    '[\"Pokemon\", \"Digimon\", \"Yugioh\", \"Final Fantasy\"]'
  ),
  (
    273,
    9,
    'Easy',
    'In \"League of Legends,\" what is the name of the character known as the \"Blind Monk\"?',
    'Lee Sin',
    '[\"Lee Sin\", \"Zed\", \"Yasuo\", \"Master Yi\"]'
  ),
  (
    274,
    9,
    'Easy',
    'What is the name of the main playable character in \"The Witcher\" series?',
    'Geralt of Rivia',
    '[\"Geralt of Rivia\", \"Dandelion\", \"Vesemir\", \"Yennefer\"]'
  ),
  (
    275,
    9,
    'Easy',
    'Which game features a \"hidden blade\" as the primary weapon?',
    'Assassin\'s Creed',
    '[\"Assassin\'s Creed\", \"Prince of Persia\", \"God of War\", \"Devil May Cry\"]'
  ),
  (
    276,
    9,
    'Easy',
    'What video game console was released by Sony in 1994?',
    'PlayStation',
    '[\"PlayStation\", \"Xbox\", \"Nintendo 64\", \"Dreamcast\"]'
  ),
  (
    277,
    9,
    'Easy',
    'Which game series includes the character \"Solid Snake\"?',
    'Metal Gear Solid',
    '[\"Metal Gear Solid\", \"Splinter Cell\", \"Hitman\", \"Deus Ex\"]'
  ),
  (
    278,
    9,
    'Easy',
    'What is the name of the battle royale game developed by Respawn Entertainment?',
    'Apex Legends',
    '[\"Apex Legends\", \"PUBG\", \"Fortnite\", \"Call of Duty: Warzone\"]'
  ),
  (
    279,
    9,
    'Easy',
    'In which game do players hunt and capture \"ghosts\" using a device called a \"Proton Pack\"?',
    'Ghostbusters',
    '[\"Ghostbusters\", \"Luigi\'s Mansion\", \"Phasmophobia\", \"Dead by Daylight\"]'
  ),
  (
    280,
    9,
    'Easy',
    'What year was the original \"Pac-Man\" arcade game released?',
    '1980',
    '[\"1980\", \"1975\", \"1985\", \"1990\"]'
  ),
  (
    281,
    9,
    'Easy',
    'Which video game series features a location called \"San Andreas\"?',
    'Grand Theft Auto',
    '[\"Grand Theft Auto\", \"Fallout\", \"The Elder Scrolls\", \"Saints Row\"]'
  ),
  (
    282,
    16,
    'Easy',
    'What is the largest planet in our solar system?',
    'Jupiter',
    '[\"Jupiter\", \"Saturn\", \"Mars\", \"Earth\"]'
  ),
  (
    283,
    16,
    'Easy',
    'What is the closest planet to the Sun?',
    'Mercury',
    '[\"Mercury\", \"Venus\", \"Earth\", \"Mars\"]'
  ),
  (
    284,
    16,
    'Easy',
    'What is the name of Earth\'s only natural satellite?',
    'Moon',
    '[\"Moon\", \"Mars\", \"Venus\", \"Titan\"]'
  ),
  (
    285,
    16,
    'Easy',
    'What is the hottest planet in our solar system?',
    'Venus',
    '[\"Venus\", \"Mercury\", \"Mars\", \"Jupiter\"]'
  ),
  (
    286,
    16,
    'Easy',
    'Which planet is known as the \"Red Planet\"?',
    'Mars',
    '[\"Mars\", \"Jupiter\", \"Saturn\", \"Venus\"]'
  ),
  (
    287,
    16,
    'Easy',
    'What is the name of the galaxy that contains our Solar System?',
    'Milky Way',
    '[\"Milky Way\", \"Andromeda\", \"Whirlpool\", \"Sombrero\"]'
  ),
  (
    288,
    16,
    'Easy',
    'Who was the first person to walk on the moon?',
    'Neil Armstrong',
    '[\"Neil Armstrong\", \"Buzz Aldrin\", \"Yuri Gagarin\", \"Alan Shepard\"]'
  ),
  (
    289,
    16,
    'Easy',
    'Which planet has the most moons?',
    'Saturn',
    '[\"Saturn\", \"Jupiter\", \"Uranus\", \"Mars\"]'
  ),
  (
    290,
    16,
    'Easy',
    'What is the name of the largest moon of Saturn?',
    'Titan',
    '[\"Titan\", \"Europa\", \"Callisto\", \"Ganymede\"]'
  ),
  (
    291,
    16,
    'Easy',
    'What is the closest star to Earth?',
    'Sun',
    '[\"Sun\", \"Proxima Centauri\", \"Sirius\", \"Alpha Centauri\"]'
  ),
  (
    292,
    16,
    'Easy',
    'Which planet is known for its extensive ring system?',
    'Saturn',
    '[\"Saturn\", \"Jupiter\", \"Uranus\", \"Neptune\"]'
  ),
  (
    293,
    16,
    'Easy',
    'What is the term for a large group of stars held together by gravity?',
    'Galaxy',
    '[\"Galaxy\", \"Cluster\", \"Constellation\", \"Nebula\"]'
  ),
  (
    294,
    16,
    'Easy',
    'How long does it take for the Earth to orbit the Sun?',
    '365 days',
    '[\"365 days\", \"30 days\", \"1000 days\", \"24 hours\"]'
  ),
  (
    295,
    16,
    'Easy',
    'What is the name of the second planet from the Sun?',
    'Venus',
    '[\"Venus\", \"Mars\", \"Mercury\", \"Earth\"]'
  ),
  (
    296,
    16,
    'Easy',
    'Which planet is famous for its \"Great Red Spot\"?',
    'Jupiter',
    '[\"Jupiter\", \"Mars\", \"Saturn\", \"Neptune\"]'
  ),
  (
    297,
    16,
    'Easy',
    'Which space probe was the first to land on a comet?',
    'Philae',
    '[\"Philae\", \"Voyager 1\", \"Curiosity\", \"Cassini\"]'
  ),
  (
    298,
    16,
    'Easy',
    'What is the term for the point where a planet is closest to the Sun in its orbit?',
    'Perihelion',
    '[\"Perihelion\", \"Aphelion\", \"Equinox\", \"Solstice\"]'
  ),
  (
    299,
    16,
    'Easy',
    'Which space mission first landed humans on the moon?',
    'Apollo 11',
    '[\"Apollo 11\", \"Apollo 13\", \"Gemini 6\", \"Skylab\"]'
  ),
  (
    300,
    16,
    'Easy',
    'What is the brightest star in the night sky?',
    'Sirius',
    '[\"Sirius\", \"Polaris\", \"Betelgeuse\", \"Rigel\"]'
  ),
  (
    301,
    16,
    'Easy',
    'What is the largest moon of Jupiter?',
    'Ganymede',
    '[\"Ganymede\", \"Europa\", \"Callisto\", \"Titan\"]'
  ),
  (
    302,
    14,
    'Easy',
    'Which animal is known as the \"King of the Jungle\"?',
    'Lion',
    '[\"Lion\", \"Elephant\", \"Tiger\", \"Giraffe\"]'
  ),
  (
    303,
    14,
    'Easy',
    'What is the largest mammal in the world?',
    'Blue Whale',
    '[\"Blue Whale\", \"Elephant\", \"Hippopotamus\", \"Giraffe\"]'
  ),
  (
    304,
    14,
    'Easy',
    'What type of tree do acorns come from?',
    'Oak',
    '[\"Oak\", \"Maple\", \"Pine\", \"Cedar\"]'
  ),
  (
    305,
    14,
    'Easy',
    'How many legs does a spider have?',
    'Eight',
    '[\"Eight\", \"Six\", \"Ten\", \"Four\"]'
  ),
  (
    306,
    14,
    'Easy',
    'What is the fastest land animal?',
    'Cheetah',
    '[\"Cheetah\", \"Lion\", \"Tiger\", \"Antelope\"]'
  ),
  (
    307,
    14,
    'Easy',
    'Which bird is known for its colorful tail feathers?',
    'Peacock',
    '[\"Peacock\", \"Flamingo\", \"Parrot\", \"Eagle\"]'
  ),
  (
    308,
    14,
    'Easy',
    'What is the tallest species of tree?',
    'Redwood',
    '[\"Redwood\", \"Oak\", \"Pine\", \"Maple\"]'
  ),
  (
    309,
    14,
    'Easy',
    'Which animal is famous for its ability to change color?',
    'Chameleon',
    '[\"Chameleon\", \"Octopus\", \"Cuttlefish\", \"Frog\"]'
  ),
  (
    310,
    14,
    'Easy',
    'What is the largest species of shark?',
    'Whale Shark',
    '[\"Whale Shark\", \"Great White Shark\", \"Hammerhead Shark\", \"Tiger Shark\"]'
  ),
  (
    311,
    14,
    'Easy',
    'What is a group of wolves called?',
    'Pack',
    '[\"Pack\", \"Flock\", \"Herd\", \"Swarm\"]'
  ),
  (
    312,
    14,
    'Easy',
    'Which type of bird is known for its ability to mimic sounds, including human speech?',
    'Parrot',
    '[\"Parrot\", \"Crow\", \"Sparrow\", \"Raven\"]'
  ),
  (
    313,
    14,
    'Easy',
    'Which mammal is known for laying eggs?',
    'Platypus',
    '[\"Platypus\", \"Kangaroo\", \"Dolphin\", \"Elephant\"]'
  ),
  (
    314,
    14,
    'Easy',
    'What type of habitat do polar bears live in?',
    'Arctic',
    '[\"Arctic\", \"Tundra\", \"Desert\", \"Savannah\"]'
  ),
  (
    315,
    14,
    'Easy',
    'Which of the following animals is a marsupial?',
    'Kangaroo',
    '[\"Kangaroo\", \"Elephant\", \"Tiger\", \"Horse\"]'
  ),
  (
    316,
    14,
    'Easy',
    'What is the only continent where emperor penguins are found in the wild?',
    'Antarctica',
    '[\"Antarctica\", \"Africa\", \"Asia\", \"North America\"]'
  ),
  (
    317,
    14,
    'Easy',
    'What is the fastest flying bird in the world?',
    'Peregrine Falcon',
    '[\"Peregrine Falcon\", \"Eagle\", \"Hawk\", \"Owl\"]'
  ),
  (
    318,
    14,
    'Easy',
    'What type of animal is a Komodo Dragon?',
    'Lizard',
    '[\"Lizard\", \"Snake\", \"Frog\", \"Crocodile\"]'
  ),
  (
    319,
    14,
    'Easy',
    'Which tree species is known for producing sap used to make syrup?',
    'Maple',
    '[\"Maple\", \"Pine\", \"Oak\", \"Birch\"]'
  ),
  (
    320,
    14,
    'Easy',
    'Which animal is known to have the most powerful bite?',
    'Saltwater Crocodile',
    '[\"Saltwater Crocodile\", \"Great White Shark\", \"Lion\", \"Wolf\"]'
  ),
  (
    321,
    14,
    'Easy',
    'What type of animal is a dolphin?',
    'Mammal',
    '[\"Mammal\", \"Fish\", \"Reptile\", \"Bird\"]'
  ),
  (
    325,
    9,
    'Hard',
    'In \"The Legend of Zelda: Majora’s Mask\", what is the name of the final boss\'s second phase?',
    'Majora\'s Incarnation',
    '[\"Majora\'s Incarnation\", \"Majora\'s Puppet\", \"Majora\'s Wrathborn\", \"Fierce Deity Majora\"]'
  ),
  (
    326,
    9,
    'Medium',
    'In Super Metroid, what is the name of the planet where the game takes place?',
    'Zebes',
    '[\"Zebes\", \"Tallon IV\", \"SR388\", \"Aether\"]'
  ),
  (
    327,
    17,
    'Medium',
    'What type of pasta is shaped like little ears?',
    'Orecchiette',
    '[\"Orecchiette\", \"Fusilli\", \"Farfalle\", \"Rigatoni\"]'
  ),
  (
    328,
    17,
    'Easy',
    'Which fruit is known for having seeds on the outside? ',
    'Strawberry',
    '[\"Strawberry\", \"Blueberry\", \"Apple\", \"Kiwi\"]'
  ),
  (
    329,
    17,
    'Hard',
    'What is the name of the protein found in wheat, barley, and rye that people with celiac disease must avoid?',
    'Gluten',
    '[\"Gluten\", \"Lactose\", \"Casein\", \"Albumin\"]'
  ),
  (
    330,
    11,
    'Hard',
    'Which 1927 silent film is widely regarded as the first full-length science fiction movie?',
    'Metropolis',
    '[\"Metropolis\", \"The Cabinet of Dr. Caligari\", \"Nosferatu\", \"A Trip to the Moon\"]'
  ),
  (
    331,
    4,
    'Easy',
    'What year was the Declaration of Independence signed? ',
    '1776',
    '[\"1776\", \"1786\", \"1796\", \"1766\"]'
  );

DROP TABLE IF EXISTS users;

CREATE TABLE IF NOT EXISTS users (
  userID int(11) NOT NULL AUTO_INCREMENT,
  username varchar(50) NOT NULL,
  email varchar(100) NOT NULL,
  password varchar(255) NOT NULL,
  totalScore int(11) DEFAULT '0',
  role enum('admin', 'user') NOT NULL DEFAULT 'user',
  PRIMARY KEY (userID),
  UNIQUE KEY email (email)
) ENGINE = InnoDB AUTO_INCREMENT = 9 DEFAULT CHARSET = utf8;

INSERT INTO
  users (
    userID,
    username,
    email,
    password,
    totalScore,
    role
  )
VALUES
  (
    1,
    'user1edited',
    'user1edited@example.com',
    '$2b$10$02kwZQ8.1.Qln/htfwJRGuiGq18IUn1skCyc9iY7f4rn2ARnL9lYu',
    350,
    'user'
  ),
  (
    2,
    'user2',
    'user2@example.com',
    '25d55ad283aa400af464c76d713c07ad',
    180,
    'user'
  ),
  (
    3,
    'user3',
    'user3@example.com',
    '098f6bcd4621d373cade4e832627b4f6',
    310,
    'user'
  ),
  (
    4,
    'user4',
    'user4@example.com',
    'e10adc3949ba59abbe56e057f20f883e',
    330,
    'user'
  ),
  (
    5,
    'user5',
    'user5@example.com',
    'fcea920f7412b5da7be0cf42b8c93759',
    300,
    'user'
  ),
  (
    6,
    'ChanceMA',
    'spamalot7121@gmail.com',
    '$2b$10$WgfVAW7jIxAZD9LsdMpfYunsWRAfDwbvHAaNWzE6ATjdCW5DM0z16',
    0,
    'admin'
  ),
  (
    7,
    'MaxwellsDaemon',
    'daemonanimations3d@gmail.com',
    '$2b$10$LjLwkAjsXT2ec0VCs/HCL.0iwUF1FqIem547FBRuYiYskAWRTY9LC',
    0,
    'user'
  ),
  (
    8,
    'ChanceAnderson',
    'canderson184@my.gcu.edu',
    '$2b$10$Sjeg.K194tOslYO9RxRYduK4g4XkUdOVYtA/gsCiYfswjVkEH0ha6',
    0,
    'user'
  );

DROP TABLE IF EXISTS user_category_scores;

CREATE TABLE IF NOT EXISTS user_category_scores (
  userCategoryScoreID int(11) NOT NULL AUTO_INCREMENT,
  userID int(11) DEFAULT NULL,
  categoryID int(11) DEFAULT NULL,
  score int(11) DEFAULT '0',
  PRIMARY KEY (userCategoryScoreID),
  KEY userID (userID),
  KEY user_category_scores_ibfk_2 (categoryID)
) ENGINE = InnoDB AUTO_INCREMENT = 36 DEFAULT CHARSET = utf8;

INSERT INTO
  user_category_scores (userCategoryScoreID, userID, categoryID, score)
VALUES
  (1, 1, 2, 10),
  (2, 1, 3, 10),
  (3, 1, 5, 10),
  (4, 1, 9, 0),
  (5, 1, 13, 300),
  (6, 1, 14, 10),
  (7, 1, 16, 10),
  (8, 2, 2, 10),
  (9, 2, 3, 10),
  (10, 2, 5, 0),
  (11, 2, 9, 10),
  (12, 2, 13, 130),
  (13, 2, 14, 10),
  (14, 2, 16, 10),
  (15, 3, 2, 10),
  (16, 3, 3, 0),
  (17, 3, 5, 10),
  (18, 3, 9, 10),
  (19, 3, 13, 260),
  (20, 3, 14, 10),
  (21, 3, 16, 10),
  (22, 4, 2, 10),
  (23, 4, 3, 10),
  (24, 4, 5, 10),
  (25, 4, 9, 10),
  (26, 4, 13, 280),
  (27, 4, 14, 0),
  (28, 4, 16, 10),
  (29, 5, 2, 10),
  (30, 5, 3, 10),
  (31, 5, 5, 10),
  (32, 5, 9, 10),
  (33, 5, 13, 250),
  (34, 5, 14, 10),
  (35, 5, 16, 0);

DROP TABLE IF EXISTS user_responses;

CREATE TABLE IF NOT EXISTS user_responses (
  responseID int(11) NOT NULL AUTO_INCREMENT,
  userID int(11) DEFAULT NULL,
  questionID int(11) DEFAULT NULL,
  userAnswer varchar(100) NOT NULL,
  isCorrect tinyint(1) NOT NULL,
  difficulty enum('Easy', 'Medium', 'Hard') NOT NULL,
  scoreEarned int(11) DEFAULT NULL,
  PRIMARY KEY (responseID),
  KEY userID (userID),
  KEY questionID (questionID)
) ENGINE = InnoDB AUTO_INCREMENT = 141 DEFAULT CHARSET = utf8;

INSERT INTO
  user_responses (
    responseID,
    userID,
    questionID,
    userAnswer,
    isCorrect,
    difficulty,
    scoreEarned
  )
VALUES
  (1, 1, 12, 'A', 1, 'Easy', 10),
  (2, 2, 32, 'B', 0, 'Medium', 0),
  (3, 3, 45, 'C', 1, 'Hard', 30),
  (4, 4, 60, 'D', 0, 'Easy', 0),
  (5, 5, 73, 'A', 1, 'Medium', 20),
  (6, 1, 90, 'B', 0, 'Hard', 0),
  (7, 2, 104, 'C', 1, 'Easy', 10),
  (8, 3, 150, 'D', 1, 'Medium', 20),
  (9, 4, 122, 'A', 1, 'Hard', 30),
  (10, 5, 140, 'B', 0, 'Easy', 0),
  (11, 1, 55, 'C', 1, 'Medium', 20),
  (12, 2, 37, 'D', 0, 'Hard', 0),
  (13, 3, 118, 'A', 1, 'Easy', 10),
  (14, 4, 178, 'B', 1, 'Medium', 20),
  (15, 5, 190, 'C', 0, 'Hard', 0),
  (16, 1, 105, 'D', 1, 'Easy', 10),
  (17, 2, 36, 'A', 1, 'Medium', 20),
  (18, 3, 150, 'B', 0, 'Hard', 0),
  (19, 4, 80, 'C', 1, 'Easy', 10),
  (20, 5, 130, 'D', 0, 'Medium', 0),
  (21, 1, 5, 'A', 1, 'Hard', 30),
  (22, 2, 25, 'B', 0, 'Easy', 0),
  (23, 3, 44, 'C', 1, 'Medium', 20),
  (24, 4, 111, 'D', 1, 'Hard', 30),
  (25, 5, 169, 'A', 1, 'Easy', 10),
  (26, 1, 17, 'B', 1, 'Medium', 20),
  (27, 2, 76, 'C', 0, 'Hard', 0),
  (28, 3, 83, 'D', 1, 'Easy', 10),
  (29, 4, 120, 'A', 0, 'Medium', 0),
  (30, 5, 145, 'B', 1, 'Hard', 30),
  (31, 1, 12, 'C', 1, 'Easy', 10),
  (32, 2, 91, 'D', 0, 'Medium', 0),
  (33, 3, 167, 'A', 1, 'Hard', 30),
  (34, 4, 19, 'B', 1, 'Easy', 10),
  (35, 5, 62, 'C', 0, 'Medium', 0),
  (36, 1, 100, 'D', 1, 'Hard', 30),
  (37, 2, 120, 'A', 1, 'Easy', 10),
  (38, 3, 50, 'B', 1, 'Medium', 20),
  (39, 4, 12, 'C', 1, 'Hard', 30),
  (40, 5, 43, 'D', 0, 'Easy', 0),
  (41, 1, 74, 'A', 1, 'Medium', 20),
  (42, 2, 111, 'B', 0, 'Hard', 0),
  (43, 3, 133, 'C', 1, 'Easy', 10),
  (44, 4, 148, 'D', 1, 'Medium', 20),
  (45, 5, 190, 'A', 1, 'Hard', 30),
  (46, 1, 100, 'B', 1, 'Easy', 10),
  (47, 2, 130, 'C', 0, 'Medium', 0),
  (48, 3, 160, 'D', 1, 'Hard', 30),
  (49, 4, 30, 'A', 1, 'Easy', 10),
  (50, 5, 65, 'B', 0, 'Medium', 0),
  (51, 1, 199, 'C', 1, 'Hard', 30),
  (52, 2, 132, 'D', 1, 'Easy', 10),
  (53, 3, 22, 'A', 1, 'Medium', 20),
  (54, 4, 47, 'B', 0, 'Hard', 0),
  (55, 5, 77, 'C', 1, 'Easy', 10),
  (56, 1, 153, 'D', 1, 'Medium', 20),
  (57, 2, 12, 'A', 1, 'Hard', 30),
  (58, 3, 29, 'B', 0, 'Easy', 0),
  (59, 4, 88, 'C', 1, 'Medium', 20),
  (60, 5, 120, 'D', 1, 'Hard', 30),
  (61, 1, 135, 'A', 1, 'Easy', 10),
  (62, 2, 147, 'B', 1, 'Medium', 20),
  (63, 3, 192, 'C', 0, 'Hard', 0),
  (64, 4, 30, 'D', 1, 'Easy', 10),
  (65, 5, 67, 'A', 1, 'Medium', 20),
  (66, 1, 155, 'B', 0, 'Hard', 0),
  (67, 2, 176, 'C', 1, 'Easy', 10),
  (68, 3, 102, 'D', 1, 'Medium', 20),
  (69, 4, 188, 'A', 1, 'Hard', 30),
  (70, 5, 35, 'B', 1, 'Easy', 10),
  (71, 1, 60, 'C', 1, 'Medium', 20),
  (72, 2, 99, 'D', 0, 'Hard', 0),
  (73, 3, 122, 'A', 1, 'Easy', 10),
  (74, 4, 185, 'B', 0, 'Medium', 0),
  (75, 5, 180, 'C', 1, 'Hard', 30),
  (76, 1, 45, 'D', 1, 'Easy', 10),
  (77, 2, 130, 'A', 1, 'Medium', 20),
  (78, 3, 98, 'B', 0, 'Hard', 0),
  (79, 4, 35, 'C', 1, 'Easy', 10),
  (80, 5, 165, 'D', 1, 'Medium', 20),
  (81, 1, 150, 'A', 1, 'Hard', 30),
  (82, 2, 45, 'B', 0, 'Easy', 0),
  (83, 3, 97, 'C', 1, 'Medium', 20),
  (84, 4, 67, 'D', 1, 'Hard', 30),
  (85, 5, 18, 'A', 1, 'Easy', 10),
  (86, 1, 160, 'B', 1, 'Medium', 20),
  (87, 2, 198, 'C', 0, 'Hard', 0),
  (88, 3, 77, 'D', 1, 'Easy', 10),
  (89, 4, 149, 'A', 1, 'Medium', 20),
  (90, 5, 34, 'B', 1, 'Hard', 30),
  (91, 1, 210, 'A', 1, 'Easy', 10),
  (92, 2, 215, 'B', 0, 'Easy', 0),
  (93, 3, 220, 'C', 1, 'Easy', 10),
  (94, 4, 225, 'D', 0, 'Easy', 0),
  (95, 5, 230, 'A', 1, 'Easy', 10),
  (96, 1, 235, 'B', 0, 'Easy', 0),
  (97, 2, 240, 'C', 1, 'Easy', 10),
  (98, 3, 245, 'D', 0, 'Easy', 0),
  (99, 4, 250, 'A', 1, 'Easy', 10),
  (100, 5, 255, 'B', 0, 'Easy', 0),
  (101, 1, 260, 'C', 1, 'Easy', 10),
  (102, 2, 265, 'D', 0, 'Easy', 0),
  (103, 3, 270, 'A', 1, 'Easy', 10),
  (104, 4, 275, 'B', 0, 'Easy', 0),
  (105, 5, 280, 'C', 1, 'Easy', 10),
  (106, 1, 285, 'D', 0, 'Easy', 0),
  (107, 2, 290, 'A', 1, 'Easy', 10),
  (108, 3, 295, 'B', 0, 'Easy', 0),
  (109, 4, 300, 'C', 1, 'Easy', 10),
  (110, 5, 305, 'D', 0, 'Easy', 0),
  (111, 1, 310, 'A', 1, 'Easy', 10),
  (112, 2, 315, 'B', 0, 'Easy', 0),
  (113, 3, 320, 'C', 1, 'Easy', 10),
  (114, 4, 209, 'D', 0, 'Easy', 0),
  (115, 5, 211, 'A', 1, 'Easy', 10),
  (116, 1, 216, 'B', 0, 'Easy', 0),
  (117, 2, 221, 'C', 1, 'Easy', 10),
  (118, 3, 226, 'D', 0, 'Easy', 0),
  (119, 4, 231, 'A', 1, 'Easy', 10),
  (120, 5, 236, 'B', 0, 'Easy', 0),
  (121, 1, 241, 'C', 1, 'Easy', 10),
  (122, 2, 246, 'D', 0, 'Easy', 0),
  (123, 3, 251, 'A', 1, 'Easy', 10),
  (124, 4, 256, 'B', 0, 'Easy', 0),
  (125, 5, 261, 'C', 1, 'Easy', 10),
  (126, 1, 266, 'D', 0, 'Easy', 0),
  (127, 2, 271, 'A', 1, 'Easy', 10),
  (128, 3, 276, 'B', 0, 'Easy', 0),
  (129, 4, 281, 'C', 1, 'Easy', 10),
  (130, 5, 286, 'D', 0, 'Easy', 0),
  (131, 1, 291, 'A', 1, 'Easy', 10),
  (132, 2, 296, 'B', 0, 'Easy', 0),
  (133, 3, 301, 'C', 1, 'Easy', 10),
  (134, 4, 306, 'D', 0, 'Easy', 0),
  (135, 5, 311, 'A', 1, 'Easy', 10),
  (136, 1, 316, 'B', 0, 'Easy', 0),
  (137, 2, 321, 'C', 1, 'Easy', 10),
  (138, 3, 206, 'D', 0, 'Easy', 0),
  (139, 4, 213, 'A', 1, 'Easy', 10),
  (140, 5, 218, 'B', 0, 'Easy', 0);

ALTER TABLE
  leaderboards
ADD
  CONSTRAINT leaderboards_ibfk_1 FOREIGN KEY (userID) REFERENCES `users` (userID) ON DELETE CASCADE,
ADD
  CONSTRAINT leaderboards_ibfk_2 FOREIGN KEY (categoryID) REFERENCES categories (categoryID) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE
  questions
ADD
  CONSTRAINT questions_ibfk_1 FOREIGN KEY (categoryID) REFERENCES categories (categoryID) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE
  user_category_scores
ADD
  CONSTRAINT user_category_scores_ibfk_1 FOREIGN KEY (userID) REFERENCES `users` (userID) ON DELETE CASCADE,
ADD
  CONSTRAINT user_category_scores_ibfk_2 FOREIGN KEY (categoryID) REFERENCES categories (categoryID) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE
  user_responses
ADD
  CONSTRAINT user_responses_ibfk_1 FOREIGN KEY (userID) REFERENCES `users` (userID) ON DELETE CASCADE,
ADD
  CONSTRAINT user_responses_ibfk_2 FOREIGN KEY (questionID) REFERENCES questions (questionID) ON DELETE CASCADE;