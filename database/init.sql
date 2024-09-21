-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 21, 2024 at 05:18 AM
-- Server version: 5.7.24
-- PHP Version: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `quizzler`
--
CREATE DATABASE IF NOT EXISTS `quizzler` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `quizzler`;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `categoryID` int(11) NOT NULL AUTO_INCREMENT,
  `categoryName` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`categoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`categoryID`, `categoryName`, `description`) VALUES
(1, 'General Knowledge', 'Mixed questions from various categories.'),
(2, 'Art & Literature', 'Questions related to famous works of art and literature.'),
(3, 'Geography', 'Questions about world locations, capitals, and landmarks.'),
(4, 'History', 'Test your knowledge of world history.'),
(5, 'Music', 'Trivia on different genres, artists, and history of music.'),
(6, 'Science', 'Questions about physics, chemistry, biology, and more.'),
(7, 'Sports', 'Sports-related questions from different disciplines.'),
(8, 'Television', 'Trivia about popular TV shows, characters, and episodes.'),
(9, 'Video Games', 'Questions covering popular video games and their history.'),
(10, 'Math', 'Mathematics-related trivia from basic to advanced concepts.'),
(11, 'Film', 'Questions about movies, directors, and cinematic history.'),
(12, 'Technology', 'Trivia about tech advancements, history, and key figures.'),
(13, 'Mythology', 'Questions about various mythologies across cultures.'),
(14, 'Animals', 'Trivia about wildlife, plants, and ecosystems in the natural world.'),
(16, 'Space & Astronomy', 'Trivia about the history of space exploration and astronomy in general.'),
(17, 'Food & Drink', 'Test your knowledge about cuisine, ingredients, and drinks.'),
(18, 'SciFi & Fantasy', 'Questions related to the science fiction and fantasy genres.'),
(19, 'Health & Medicine', 'Trivia about health, diseases, and the medical field.'),
(20, 'Language', 'Test your knowledge about languages and linguistics.'),
(21, 'Pop Culture: 1960s', 'Questions about entertainment, music, movies, and celebrities from the 1960s.'),
(22, 'Pop Culture: 1970s', 'Questions about entertainment, music, movies, and celebrities from the 1970s.'),
(23, 'Pop Culture: 1980s', 'Questions about entertainment, music, movies, and celebrities from the 1980s.'),
(24, 'Pop Culture: 1990s', 'Questions about entertainment, music, movies, and celebrities from the 1990s.'),
(25, 'Pop Culture: 2000s', 'Questions about entertainment, music, movies, and celebrities from the 2000s.'),
(26, 'Pop Culture: 2010s', 'Questions about entertainment, music, movies, and celebrities from the 2010s.');

-- --------------------------------------------------------

--
-- Table structure for table `leaderboards`
--

DROP TABLE IF EXISTS `leaderboards`;
CREATE TABLE IF NOT EXISTS `leaderboards` (
  `leaderboardID` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) DEFAULT NULL,
  `categoryID` int(11) DEFAULT NULL,
  `totalScore` int(11) DEFAULT '0',
  `isOverall` tinyint(1) NOT NULL,
  PRIMARY KEY (`leaderboardID`),
  KEY `userID` (`userID`),
  KEY `leaderboards_ibfk_2` (`categoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
CREATE TABLE IF NOT EXISTS `questions` (
  `questionID` int(11) NOT NULL AUTO_INCREMENT,
  `categoryID` int(11) DEFAULT NULL,
  `difficulty` enum('Easy','Medium','Hard') NOT NULL,
  `questionText` text NOT NULL,
  `correctAnswer` varchar(100) NOT NULL,
  `options` json DEFAULT NULL,
  PRIMARY KEY (`questionID`),
  KEY `questions_ibfk_1` (`categoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`questionID`, `categoryID`, `difficulty`, `questionText`, `correctAnswer`, `options`) VALUES
(1, 13, 'Easy', 'Who is the king of the Greek gods?', 'Zeus', '[\"Zeus\", \"Hades\", \"Poseidon\", \"Apollo\"]'),
(2, 13, 'Easy', 'In Egyptian mythology, who is the god of the sun?', 'Ra', '[\"Ra\", \"Anubis\", \"Osiris\", \"Horus\"]'),
(3, 13, 'Easy', 'Which Norse god wields the hammer Mjölnir?', 'Thor', '[\"Thor\", \"Odin\", \"Loki\", \"Balder\"]'),
(4, 13, 'Easy', 'Who is the Greek goddess of wisdom?', 'Athena', '[\"Athena\", \"Aphrodite\", \"Hera\", \"Artemis\"]'),
(5, 13, 'Easy', 'In Roman mythology, who is the god of war?', 'Mars', '[\"Mars\", \"Jupiter\", \"Mercury\", \"Apollo\"]'),
(6, 13, 'Easy', 'Who is the Egyptian god of the underworld?', 'Osiris', '[\"Osiris\", \"Anubis\", \"Horus\", \"Set\"]'),
(7, 13, 'Easy', 'In Greek mythology, who is known as the god of the sea?', 'Poseidon', '[\"Poseidon\", \"Zeus\", \"Hades\", \"Hermes\"]'),
(8, 13, 'Easy', 'Who was the hero of the Trojan War known for his strength?', 'Achilles', '[\"Achilles\", \"Hercules\", \"Odysseus\", \"Paris\"]'),
(9, 13, 'Easy', 'In Norse mythology, what is the name of Thor’s father?', 'Odin', '[\"Odin\", \"Loki\", \"Balder\", \"Heimdall\"]'),
(10, 13, 'Easy', 'Which Greek hero completed 12 labors?', 'Hercules', '[\"Hercules\", \"Achilles\", \"Odysseus\", \"Perseus\"]'),
(11, 13, 'Easy', 'Who is the Greek god of the underworld?', 'Hades', '[\"Hades\", \"Zeus\", \"Poseidon\", \"Apollo\"]'),
(12, 13, 'Easy', 'What creature has the body of a lion and the head of a human in Egyptian mythology?', 'Sphinx', '[\"Sphinx\", \"Griffin\", \"Manticore\", \"Chimera\"]'),
(13, 13, 'Easy', 'Who is the Greek goddess of the hunt?', 'Artemis', '[\"Artemis\", \"Athena\", \"Aphrodite\", \"Hera\"]'),
(14, 13, 'Easy', 'Which Roman god is equivalent to the Greek god Hermes?', 'Mercury', '[\"Mercury\", \"Apollo\", \"Mars\", \"Jupiter\"]'),
(15, 13, 'Easy', 'Who is the Greek god of the sun?', 'Apollo', '[\"Apollo\", \"Helios\", \"Zeus\", \"Hades\"]'),
(16, 13, 'Easy', 'In Egyptian mythology, who is the goddess of motherhood and fertility?', 'Isis', '[\"Isis\", \"Bastet\", \"Hathor\", \"Nut\"]'),
(17, 13, 'Easy', 'Who was the Greek goddess of love and beauty?', 'Aphrodite', '[\"Aphrodite\", \"Hera\", \"Athena\", \"Artemis\"]'),
(18, 13, 'Easy', 'Which Greek god was known for his winged sandals?', 'Hermes', '[\"Hermes\", \"Apollo\", \"Zeus\", \"Ares\"]'),
(19, 13, 'Easy', 'Who is the king of the Norse gods?', 'Odin', '[\"Odin\", \"Thor\", \"Loki\", \"Freyr\"]'),
(20, 13, 'Easy', 'In Greek mythology, who is the messenger of the gods?', 'Hermes', '[\"Hermes\", \"Apollo\", \"Zeus\", \"Ares\"]'),
(21, 13, 'Easy', 'What was the name of the Greek god of wine?', 'Dionysus', '[\"Dionysus\", \"Zeus\", \"Apollo\", \"Hermes\"]'),
(22, 13, 'Easy', 'Who is the goddess of marriage and queen of the Greek gods?', 'Hera', '[\"Hera\", \"Aphrodite\", \"Athena\", \"Artemis\"]'),
(23, 13, 'Easy', 'In Norse mythology, what is the name of Thor’s hammer?', 'Mjölnir', '[\"Mjölnir\", \"Gungnir\", \"Skofnung\", \"Gram\"]'),
(24, 13, 'Easy', 'Who is the Greek god of war?', 'Ares', '[\"Ares\", \"Zeus\", \"Apollo\", \"Hermes\"]'),
(25, 13, 'Easy', 'Which creature in Greek mythology has snakes for hair?', 'Medusa', '[\"Medusa\", \"Sphinx\", \"Hydra\", \"Cerberus\"]'),
(26, 13, 'Easy', 'Who is the Roman god of the sea?', 'Neptune', '[\"Neptune\", \"Jupiter\", \"Mars\", \"Apollo\"]'),
(27, 13, 'Easy', 'In Norse mythology, what is the name of the world tree?', 'Yggdrasil', '[\"Yggdrasil\", \"Asgard\", \"Midgard\", \"Valhalla\"]'),
(28, 13, 'Easy', 'Who is the Greek god of the sky?', 'Zeus', '[\"Zeus\", \"Poseidon\", \"Hades\", \"Apollo\"]'),
(29, 13, 'Easy', 'In Egyptian mythology, what animal is associated with Anubis?', 'Jackal', '[\"Jackal\", \"Falcon\", \"Cat\", \"Crocodile\"]'),
(30, 13, 'Easy', 'Who was the hero that killed the Minotaur?', 'Theseus', '[\"Theseus\", \"Perseus\", \"Hercules\", \"Odysseus\"]'),
(31, 13, 'Easy', 'What is the Greek name for the god of the underworld?', 'Hades', '[\"Hades\", \"Pluto\", \"Thanatos\", \"Ares\"]'),
(32, 13, 'Easy', 'Who is the Roman counterpart of the Greek goddess Athena?', 'Minerva', '[\"Minerva\", \"Juno\", \"Venus\", \"Diana\"]'),
(33, 13, 'Easy', 'Who is the goddess of the hearth in Greek mythology?', 'Hestia', '[\"Hestia\", \"Hera\", \"Aphrodite\", \"Demeter\"]'),
(34, 13, 'Easy', 'Which Egyptian goddess is known as the mother of the pharaohs?', 'Isis', '[\"Isis\", \"Bastet\", \"Nut\", \"Nephthys\"]'),
(35, 13, 'Easy', 'What was the Greek hero Achilles’ only weakness?', 'Heel', '[\"Heel\", \"Hand\", \"Eye\", \"Heart\"]'),
(36, 13, 'Easy', 'Who is the Greek god of music and prophecy?', 'Apollo', '[\"Apollo\", \"Hermes\", \"Zeus\", \"Ares\"]'),
(37, 13, 'Easy', 'Which mythical creature is a horse with a single horn on its head?', 'Unicorn', '[\"Unicorn\", \"Pegasus\", \"Centaur\", \"Chimera\"]'),
(38, 13, 'Easy', 'In Greek mythology, who flew too close to the sun?', 'Icarus', '[\"Icarus\", \"Daedalus\", \"Perseus\", \"Hermes\"]'),
(39, 13, 'Easy', 'Who is the goddess of agriculture in Greek mythology?', 'Demeter', '[\"Demeter\", \"Hera\", \"Athena\", \"Artemis\"]'),
(40, 13, 'Easy', 'What is the name of the Greek hero who performed the 12 labors?', 'Hercules', '[\"Hercules\", \"Achilles\", \"Odysseus\", \"Perseus\"]'),
(41, 13, 'Easy', 'Which Greek god is associated with the lyre?', 'Apollo', '[\"Apollo\", \"Zeus\", \"Hermes\", \"Ares\"]'),
(42, 13, 'Easy', 'In Norse mythology, who is the trickster god?', 'Loki', '[\"Loki\", \"Thor\", \"Odin\", \"Freyja\"]'),
(43, 13, 'Easy', 'What is the Roman name for the Greek god Zeus?', 'Jupiter', '[\"Jupiter\", \"Mars\", \"Neptune\", \"Mercury\"]'),
(44, 13, 'Easy', 'Who is the goddess of love in Roman mythology?', 'Venus', '[\"Venus\", \"Juno\", \"Minerva\", \"Diana\"]'),
(45, 13, 'Easy', 'In Greek mythology, who opened a box releasing all the evils of humanity?', 'Pandora', '[\"Pandora\", \"Medusa\", \"Hera\", \"Athena\"]'),
(46, 13, 'Easy', 'Which creature in Greek mythology has the body of a horse and the torso of a man?', 'Centaur', '[\"Centaur\", \"Satyr\", \"Minotaur\", \"Griffin\"]'),
(47, 13, 'Easy', 'What is the name of the winged horse in Greek mythology?', 'Pegasus', '[\"Pegasus\", \"Unicorn\", \"Griffin\", \"Chimera\"]'),
(48, 13, 'Easy', 'In Norse mythology, who is the goddess of love and fertility?', 'Freyja', '[\"Freyja\", \"Frigg\", \"Sif\", \"Idunn\"]'),
(49, 13, 'Easy', 'Who was the Greek hero who defeated Medusa?', 'Perseus', '[\"Perseus\", \"Hercules\", \"Theseus\", \"Achilles\"]'),
(50, 13, 'Easy', 'In Egyptian mythology, who is the god of chaos?', 'Set', '[\"Set\", \"Osiris\", \"Ra\", \"Anubis\"]'),
(51, 13, 'Easy', 'Who was the Roman god of love?', 'Cupid', '[\"Cupid\", \"Venus\", \"Mars\", \"Jupiter\"]'),
(52, 13, 'Easy', 'Which Greek goddess was born from sea foam?', 'Aphrodite', '[\"Aphrodite\", \"Hera\", \"Athena\", \"Artemis\"]'),
(53, 13, 'Easy', 'What is the name of the Greek winged horse?', 'Pegasus', '[\"Pegasus\", \"Griffin\", \"Sphinx\", \"Chimera\"]'),
(54, 13, 'Easy', 'In Greek mythology, who is the goddess of the harvest?', 'Demeter', '[\"Demeter\", \"Hestia\", \"Hera\", \"Athena\"]'),
(55, 13, 'Easy', 'Which creature in Greek mythology is half-man and half-bull?', 'Minotaur', '[\"Minotaur\", \"Centaur\", \"Satyr\", \"Griffin\"]'),
(56, 13, 'Easy', 'What is the name of the hall where Norse warriors go after death?', 'Valhalla', '[\"Valhalla\", \"Asgard\", \"Midgard\", \"Hel\"]'),
(57, 13, 'Easy', 'Who was the Greek god of sleep?', 'Hypnos', '[\"Hypnos\", \"Thanatos\", \"Hades\", \"Morpheus\"]'),
(58, 13, 'Easy', 'In Greek mythology, who was the first woman on Earth?', 'Pandora', '[\"Pandora\", \"Hera\", \"Athena\", \"Artemis\"]'),
(59, 13, 'Easy', 'Who is the Roman counterpart of the Greek god Poseidon?', 'Neptune', '[\"Neptune\", \"Jupiter\", \"Mars\", \"Apollo\"]'),
(60, 13, 'Easy', 'Which Greek goddess is known for her wisdom and war strategy?', 'Athena', '[\"Athena\", \"Hera\", \"Artemis\", \"Aphrodite\"]'),
(61, 13, 'Easy', 'Who is the Egyptian goddess of cats?', 'Bastet', '[\"Bastet\", \"Isis\", \"Sekhmet\", \"Hathor\"]'),
(62, 13, 'Easy', 'In Greek mythology, who is the god of the dead?', 'Hades', '[\"Hades\", \"Zeus\", \"Poseidon\", \"Hermes\"]'),
(63, 13, 'Easy', 'Which Norse god is known as the Allfather?', 'Odin', '[\"Odin\", \"Thor\", \"Loki\", \"Freyja\"]'),
(64, 13, 'Easy', 'Who is the Greek goddess of the moon?', 'Artemis', '[\"Artemis\", \"Hera\", \"Athena\", \"Aphrodite\"]'),
(65, 13, 'Easy', 'What is the name of the Greek hero who fought in the Trojan War?', 'Achilles', '[\"Achilles\", \"Odysseus\", \"Hector\", \"Paris\"]'),
(66, 13, 'Easy', 'In Norse mythology, what is the name of the realm of the gods?', 'Asgard', '[\"Asgard\", \"Midgard\", \"Jotunheim\", \"Vanaheim\"]'),
(67, 13, 'Easy', 'Who is the Roman goddess of the hunt?', 'Diana', '[\"Diana\", \"Venus\", \"Minerva\", \"Juno\"]'),
(68, 13, 'Easy', 'Which Egyptian god is depicted with the head of a falcon?', 'Horus', '[\"Horus\", \"Anubis\", \"Ra\", \"Osiris\"]'),
(69, 13, 'Easy', 'In Greek mythology, what is the name of the river that souls must cross to enter the underworld?', 'Styx', '[\"Styx\", \"Lethe\", \"Acheron\", \"Cocytus\"]'),
(70, 13, 'Easy', 'Who is the Greek goddess of victory?', 'Nike', '[\"Nike\", \"Athena\", \"Hera\", \"Aphrodite\"]'),
(71, 13, 'Easy', 'Which mythical creature has the body of a lion, the head of a goat, and a serpent for a tail?', 'Chimera', '[\"Chimera\", \"Sphinx\", \"Griffin\", \"Manticore\"]'),
(72, 13, 'Easy', 'Who is the goddess of magic in Greek mythology?', 'Hecate', '[\"Hecate\", \"Hera\", \"Athena\", \"Artemis\"]'),
(73, 13, 'Easy', 'In Roman mythology, who is the god of the sun?', 'Sol', '[\"Sol\", \"Apollo\", \"Mercury\", \"Jupiter\"]'),
(74, 13, 'Easy', 'Which Greek god is known for stealing fire for humanity?', 'Prometheus', '[\"Prometheus\", \"Hermes\", \"Zeus\", \"Hephaestus\"]'),
(75, 13, 'Easy', 'Who is the Egyptian god of the sky?', 'Horus', '[\"Horus\", \"Ra\", \"Osiris\", \"Set\"]'),
(76, 13, 'Easy', 'What is the name of the three-headed dog that guards the entrance to the underworld in Greek mythology?', 'Cerberus', '[\"Cerberus\", \"Hydra\", \"Chimera\", \"Orthrus\"]'),
(77, 13, 'Easy', 'Who is the Greek god of fire and blacksmiths?', 'Hephaestus', '[\"Hephaestus\", \"Ares\", \"Apollo\", \"Hermes\"]'),
(78, 13, 'Easy', 'In Norse mythology, what is the name of the bridge that connects Asgard to Midgard?', 'Bifröst', '[\"Bifröst\", \"Gjallarbrú\", \"Jotunheim\", \"Yggdrasil\"]'),
(79, 13, 'Easy', 'Who is the Greek god of wine and revelry?', 'Dionysus', '[\"Dionysus\", \"Zeus\", \"Hermes\", \"Apollo\"]'),
(80, 13, 'Easy', 'What is the name of the Greek hero who sailed on the Argo?', 'Jason', '[\"Jason\", \"Perseus\", \"Hercules\", \"Theseus\"]'),
(81, 13, 'Easy', 'Who is the Roman god of time?', 'Saturn', '[\"Saturn\", \"Jupiter\", \"Neptune\", \"Pluto\"]'),
(82, 13, 'Easy', 'In Greek mythology, who is known for her incredible beauty that sparked the Trojan War?', 'Helen', '[\"Helen\", \"Aphrodite\", \"Hera\", \"Athena\"]'),
(83, 13, 'Easy', 'Which mythical creature in Greek mythology is known for its deadly gaze?', 'Basilisk', '[\"Basilisk\", \"Medusa\", \"Chimera\", \"Hydra\"]'),
(84, 13, 'Easy', 'Who is the Greek god of the underworld’s river of woe?', 'Acheron', '[\"Acheron\", \"Styx\", \"Lethe\", \"Cocytus\"]'),
(85, 13, 'Easy', 'In Norse mythology, what is the name of the end of the world?', 'Ragnarok', '[\"Ragnarok\", \"Valhalla\", \"Midgard\", \"Jotunheim\"]'),
(86, 13, 'Easy', 'What is the name of the goddess of the rainbow in Greek mythology?', 'Iris', '[\"Iris\", \"Hera\", \"Aphrodite\", \"Artemis\"]'),
(87, 13, 'Easy', 'Who is the Norse god of mischief?', 'Loki', '[\"Loki\", \"Thor\", \"Odin\", \"Balder\"]'),
(88, 13, 'Easy', 'In Greek mythology, who was the wife of Hades?', 'Persephone', '[\"Persephone\", \"Hera\", \"Athena\", \"Artemis\"]'),
(89, 13, 'Easy', 'Which Greek hero was known for his journey to Ithaca?', 'Odysseus', '[\"Odysseus\", \"Achilles\", \"Hercules\", \"Theseus\"]'),
(90, 13, 'Easy', 'Who is the Egyptian goddess of truth and justice?', 'Ma\'at', '[\"Ma\'at\", \"Isis\", \"Hathor\", \"Sekhmet\"]'),
(91, 13, 'Medium', 'In Greek mythology, who was the father of the hero Perseus?', 'Zeus', '[\"Zeus\", \"Poseidon\", \"Hades\", \"Ares\"]'),
(92, 13, 'Medium', 'Which Hindu deity is known as the Destroyer?', 'Shiva', '[\"Shiva\", \"Vishnu\", \"Brahma\", \"Indra\"]'),
(93, 13, 'Medium', 'In Norse mythology, what is the name of Loki\'s daughter who rules over the underworld?', 'Hel', '[\"Hel\", \"Freyja\", \"Sif\", \"Idunn\"]'),
(94, 13, 'Medium', 'Who is the Celtic god of the sea?', 'Manannán mac Lir', '[\"Manannán mac Lir\", \"Lugh\", \"Dagda\", \"Morrigan\"]'),
(95, 13, 'Medium', 'In Egyptian mythology, who is the mother of Horus?', 'Isis', '[\"Isis\", \"Hathor\", \"Nephthys\", \"Bastet\"]'),
(96, 13, 'Medium', 'Which Japanese goddess is associated with the sun?', 'Amaterasu', '[\"Amaterasu\", \"Susanoo\", \"Tsukuyomi\", \"Inari\"]'),
(97, 13, 'Medium', 'In Greek mythology, who is the god of sleep?', 'Hypnos', '[\"Hypnos\", \"Thanatos\", \"Morpheus\", \"Eros\"]'),
(98, 13, 'Medium', 'What was the Roman name for the Greek hero Heracles?', 'Hercules', '[\"Hercules\", \"Mercury\", \"Mars\", \"Achilles\"]'),
(99, 13, 'Medium', 'In Hindu mythology, who is the consort of the god Vishnu?', 'Lakshmi', '[\"Lakshmi\", \"Parvati\", \"Saraswati\", \"Durga\"]'),
(100, 13, 'Medium', 'In Greek mythology, what creature is half-man, half-goat?', 'Satyr', '[\"Satyr\", \"Centaur\", \"Minotaur\", \"Chimera\"]'),
(101, 13, 'Medium', 'Who is the Aztec god of war and the sun?', 'Huitzilopochtli', '[\"Huitzilopochtli\", \"Quetzalcoatl\", \"Tezcatlipoca\", \"Xipe Totec\"]'),
(102, 13, 'Medium', 'In Norse mythology, what is the name of the ship made entirely of the nails of the dead?', 'Naglfar', '[\"Naglfar\", \"Skidbladnir\", \"Hringhorni\", \"Fólkvangr\"]'),
(103, 13, 'Medium', 'Who was the Greek god of shepherds and flocks?', 'Pan', '[\"Pan\", \"Hermes\", \"Apollo\", \"Dionysus\"]'),
(104, 13, 'Medium', 'In Egyptian mythology, what is the name of the serpent Apophis represents?', 'Chaos', '[\"Chaos\", \"Death\", \"Life\", \"Fertility\"]'),
(105, 13, 'Medium', 'Who is the Hindu god of wisdom and learning, often depicted with an elephant head?', 'Ganesha', '[\"Ganesha\", \"Hanuman\", \"Shiva\", \"Krishna\"]'),
(106, 13, 'Medium', 'In Roman mythology, who is the goddess of the hearth?', 'Vesta', '[\"Vesta\", \"Venus\", \"Diana\", \"Minerva\"]'),
(107, 13, 'Medium', 'What is the name of the spear that Odin carries?', 'Gungnir', '[\"Gungnir\", \"Mjölnir\", \"Gram\", \"Hofund\"]'),
(108, 13, 'Medium', 'In Greek mythology, who was condemned to hold up the sky for eternity?', 'Atlas', '[\"Atlas\", \"Prometheus\", \"Sisyphus\", \"Hercules\"]'),
(109, 13, 'Medium', 'Which Egyptian god is considered the protector of the pharaohs?', 'Horus', '[\"Horus\", \"Ra\", \"Osiris\", \"Anubis\"]'),
(110, 13, 'Medium', 'Who is the Celtic goddess of war and sovereignty?', 'Morrigan', '[\"Morrigan\", \"Brigid\", \"Rhiannon\", \"Aine\"]'),
(111, 13, 'Medium', 'In Norse mythology, who guards the Bifröst, the bridge to Asgard?', 'Heimdall', '[\"Heimdall\", \"Loki\", \"Thor\", \"Balder\"]'),
(112, 13, 'Medium', 'In Hindu mythology, who is the god of fire?', 'Agni', '[\"Agni\", \"Indra\", \"Vayu\", \"Varuna\"]'),
(113, 13, 'Medium', 'In Greek mythology, who is the goddess of the rainbow?', 'Iris', '[\"Iris\", \"Hera\", \"Aphrodite\", \"Demeter\"]'),
(114, 13, 'Medium', 'What is the name of the three-headed dog that guards the entrance to the underworld in Greek mythology?', 'Cerberus', '[\"Cerberus\", \"Orthrus\", \"Hydra\", \"Chimera\"]'),
(115, 13, 'Medium', 'In Egyptian mythology, who was the personification of the sky and the wife of Geb?', 'Nut', '[\"Nut\", \"Isis\", \"Bastet\", \"Hathor\"]'),
(116, 13, 'Medium', 'Who is the chief god in the Incan pantheon?', 'Inti', '[\"Inti\", \"Viracocha\", \"Pachamama\", \"Supay\"]'),
(117, 13, 'Medium', 'Which Greek hero was known for killing the Chimera?', 'Bellerophon', '[\"Bellerophon\", \"Perseus\", \"Hercules\", \"Theseus\"]'),
(118, 13, 'Medium', 'In Norse mythology, who is the god of poetry, music, and magic?', 'Odin', '[\"Odin\", \"Thor\", \"Loki\", \"Balder\"]'),
(119, 13, 'Medium', 'In Celtic mythology, what is the name of the otherworldly realm of the gods and the dead?', 'Annwn', '[\"Annwn\", \"Tír na nÓg\", \"Avalon\", \"Elphame\"]'),
(120, 13, 'Medium', 'Who is the Mesopotamian goddess of love and war?', 'Ishtar', '[\"Ishtar\", \"Tiamat\", \"Ereshkigal\", \"Inanna\"]'),
(121, 13, 'Medium', 'In Greek mythology, who was the wife of the hero Odysseus?', 'Penelope', '[\"Penelope\", \"Helen\", \"Clytemnestra\", \"Andromache\"]'),
(122, 13, 'Medium', 'Which Japanese god is known as the god of the sea and storms?', 'Susanoo', '[\"Susanoo\", \"Amaterasu\", \"Hachiman\", \"Raijin\"]'),
(123, 13, 'Medium', 'In Hindu mythology, who is known as the god of wealth and the treasurer of the gods?', 'Kubera', '[\"Kubera\", \"Lakshmi\", \"Vishnu\", \"Yama\"]'),
(124, 13, 'Medium', 'Who is the Greek goddess associated with the moon and hunting?', 'Artemis', '[\"Artemis\", \"Selene\", \"Hera\", \"Athena\"]'),
(125, 13, 'Medium', 'What is the name of the dragon slain by the hero Beowulf?', 'Grendel', '[\"Grendel\", \"Fafnir\", \"Jormungandr\", \"Nidhogg\"]'),
(126, 13, 'Medium', 'In Egyptian mythology, which goddess is depicted with the head of a lioness?', 'Sekhmet', '[\"Sekhmet\", \"Bastet\", \"Hathor\", \"Nephthys\"]'),
(127, 13, 'Medium', 'Who is the Norse god of fertility, sunshine, and rain?', 'Freyr', '[\"Freyr\", \"Thor\", \"Loki\", \"Odin\"]'),
(128, 13, 'Medium', 'In Greek mythology, who is the god of dreams?', 'Morpheus', '[\"Morpheus\", \"Hypnos\", \"Thanatos\", \"Eros\"]'),
(129, 13, 'Medium', 'Which Greek hero ventured into the underworld to bring back his wife, Eurydice?', 'Orpheus', '[\"Orpheus\", \"Theseus\", \"Perseus\", \"Hercules\"]'),
(130, 13, 'Medium', 'What is the name of the Celtic festival that marks the beginning of winter and is thought to be the origin of Halloween?', 'Samhain', '[\"Samhain\", \"Beltane\", \"Imbolc\", \"Lughnasadh\"]'),
(131, 13, 'Medium', 'In Greek mythology, who is the god of the wild and nature?', 'Pan', '[\"Pan\", \"Dionysus\", \"Hermes\", \"Apollo\"]'),
(132, 13, 'Medium', 'Which Roman goddess is the equivalent of the Greek goddess Demeter?', 'Ceres', '[\"Ceres\", \"Juno\", \"Venus\", \"Minerva\"]'),
(133, 13, 'Medium', 'In Norse mythology, what is the name of the hall where warriors who die in battle are taken?', 'Valhalla', '[\"Valhalla\", \"Asgard\", \"Midgard\", \"Hel\"]'),
(134, 13, 'Medium', 'Who is the Greek goddess of the hearth and home?', 'Hestia', '[\"Hestia\", \"Hera\", \"Athena\", \"Aphrodite\"]'),
(135, 13, 'Medium', 'In Egyptian mythology, who is the god of mummification and the afterlife?', 'Anubis', '[\"Anubis\", \"Osiris\", \"Horus\", \"Thoth\"]'),
(136, 13, 'Medium', 'Which Hindu goddess is known for her fierce and destructive aspect, often depicted with a necklace of skulls?', 'Kali', '[\"Kali\", \"Durga\", \"Lakshmi\", \"Saraswati\"]'),
(137, 13, 'Medium', 'Who was the Greek goddess of the harvest and agriculture?', 'Demeter', '[\"Demeter\", \"Hera\", \"Artemis\", \"Athena\"]'),
(138, 13, 'Medium', 'In Norse mythology, what is the name of the realm inhabited by elves?', 'Alfheim', '[\"Alfheim\", \"Midgard\", \"Vanaheim\", \"Muspelheim\"]'),
(139, 13, 'Medium', 'Who is the Japanese god of thunder and storms?', 'Raijin', '[\"Raijin\", \"Fujin\", \"Susanoo\", \"Amaterasu\"]'),
(140, 13, 'Medium', 'What is the name of the legendary sword that King Arthur pulled from the stone?', 'Excalibur', '[\"Excalibur\", \"Caliburn\", \"Durendal\", \"Gram\"]'),
(141, 13, 'Medium', 'In Hindu mythology, who is the lord of death and justice?', 'Yama', '[\"Yama\", \"Indra\", \"Varuna\", \"Agni\"]'),
(142, 13, 'Medium', 'Who is the Roman god of the underworld?', 'Pluto', '[\"Pluto\", \"Hades\", \"Mars\", \"Jupiter\"]'),
(143, 13, 'Medium', 'In Greek mythology, who is the Titan of the sun?', 'Helios', '[\"Helios\", \"Apollo\", \"Hyperion\", \"Atlas\"]'),
(144, 13, 'Medium', 'Which Norse god is associated with poetry, music, and magic?', 'Odin', '[\"Odin\", \"Loki\", \"Thor\", \"Freyr\"]'),
(145, 13, 'Medium', 'What is the name of the dragon in Norse mythology that gnaws at the roots of Yggdrasil?', 'Nidhogg', '[\"Nidhogg\", \"Fafnir\", \"Jormungandr\", \"Grendel\"]'),
(146, 13, 'Medium', 'In Egyptian mythology, who is the god of wisdom, writing, and knowledge?', 'Thoth', '[\"Thoth\", \"Anubis\", \"Horus\", \"Osiris\"]'),
(147, 13, 'Medium', 'Who is the Greek goddess of magic, witchcraft, and ghosts?', 'Hecate', '[\"Hecate\", \"Hera\", \"Aphrodite\", \"Artemis\"]'),
(148, 13, 'Medium', 'In Japanese mythology, who is the god of rice and fertility?', 'Inari', '[\"Inari\", \"Amaterasu\", \"Raijin\", \"Susanoo\"]'),
(149, 13, 'Medium', 'What is the name of the creature in Greek mythology that is half-man, half-horse?', 'Centaur', '[\"Centaur\", \"Satyr\", \"Minotaur\", \"Sphinx\"]'),
(150, 13, 'Medium', 'Which Greek god is associated with the lyre and the laurel wreath?', 'Apollo', '[\"Apollo\", \"Hermes\", \"Dionysus\", \"Zeus\"]'),
(151, 13, 'Hard', 'In Norse mythology, what is the name of the dragon who guards the treasure hoard of the Nibelung?', 'Fafnir', '[\"Fafnir\", \"Jormungandr\", \"Nidhogg\", \"Grendel\"]'),
(152, 13, 'Hard', 'Who was the Greek god of the river Styx, who ferried souls across it into the underworld?', 'Charon', '[\"Charon\", \"Hades\", \"Thanatos\", \"Acheron\"]'),
(153, 13, 'Hard', 'In Japanese mythology, who is the deity of the sea and storms, often depicted as a fearsome dragon?', 'Ryujin', '[\"Ryujin\", \"Susanoo\", \"Amaterasu\", \"Hachiman\"]'),
(154, 13, 'Hard', 'What is the name of the Babylonian goddess who descended to the underworld to find her lover, resulting in the seasons?', 'Ishtar', '[\"Ishtar\", \"Ereshkigal\", \"Tiamat\", \"Astarte\"]'),
(155, 13, 'Hard', 'In Greek mythology, which Titan was condemned to bear the heavens upon his shoulders?', 'Atlas', '[\"Atlas\", \"Prometheus\", \"Hyperion\", \"Oceanus\"]'),
(156, 13, 'Hard', 'In Hindu mythology, who is the preserver and protector of the universe?', 'Vishnu', '[\"Vishnu\", \"Shiva\", \"Brahma\", \"Indra\"]'),
(157, 13, 'Hard', 'Who is the Celtic god associated with the arts, crafts, and prophecy?', 'Lugh', '[\"Lugh\", \"Dagda\", \"Cernunnos\", \"Arawn\"]'),
(158, 13, 'Hard', 'What is the name of the Egyptian god of the inundation of the Nile, associated with fertility and rebirth?', 'Hapi', '[\"Hapi\", \"Geb\", \"Osiris\", \"Sobek\"]'),
(159, 13, 'Hard', 'Which Norse god is known as the trickster, the father of monsters, and is bound with the entrails of his own son?', 'Loki', '[\"Loki\", \"Fenrir\", \"Jormungandr\", \"Hel\"]'),
(160, 13, 'Hard', 'In Greek mythology, who was turned into a laurel tree to escape the advances of Apollo?', 'Daphne', '[\"Daphne\", \"Echo\", \"Syrinx\", \"Io\"]'),
(161, 13, 'Hard', 'What is the name of the sacred cow in Hindu mythology that fulfills all desires?', 'Kamadhenu', '[\"Kamadhenu\", \"Surabhi\", \"Nandi\", \"Gau Mata\"]'),
(162, 13, 'Hard', 'In Roman mythology, which god is associated with the doorway and transitions, often depicted with two faces?', 'Janus', '[\"Janus\", \"Mercury\", \"Vulcan\", \"Jupiter\"]'),
(163, 13, 'Hard', 'Who is the Mesopotamian god of freshwater, wisdom, and creation?', 'Enki', '[\"Enki\", \"Anu\", \"Marduk\", \"Ea\"]'),
(164, 13, 'Hard', 'In Norse mythology, what is the name of the wolf destined to devour Odin during Ragnarök?', 'Fenrir', '[\"Fenrir\", \"Sköll\", \"Hati\", \"Garm\"]'),
(165, 13, 'Hard', 'What is the name of the Hindu epic that tells the story of Lord Rama and his quest to rescue his wife Sita?', 'Ramayana', '[\"Ramayana\", \"Mahabharata\", \"Bhagavad Gita\", \"Vedas\"]'),
(166, 13, 'Hard', 'In Egyptian mythology, who is the goddess of scorpions and magic, who protected the pharaoh from harm?', 'Serqet', '[\"Serqet\", \"Isis\", \"Nephthys\", \"Maat\"]'),
(167, 13, 'Hard', 'Who is the Japanese god of fishermen, fortune, and luck, often depicted with a large red sea bream?', 'Ebisu', '[\"Ebisu\", \"Daikokuten\", \"Hotei\", \"Benzaiten\"]'),
(168, 13, 'Hard', 'In Greek mythology, who is known as the mother of monsters, including the Chimera and Cerberus?', 'Echidna', '[\"Echidna\", \"Medusa\", \"Scylla\", \"Charybdis\"]'),
(169, 13, 'Hard', 'Which Roman goddess is equivalent to the Greek goddess of magic, Hecate?', 'Trivia', '[\"Trivia\", \"Diana\", \"Proserpina\", \"Vesta\"]'),
(170, 13, 'Hard', 'What is the name of the Celtic festival that marks the beginning of summer and involves lighting bonfires?', 'Beltane', '[\"Beltane\", \"Samhain\", \"Imbolc\", \"Lughnasadh\"]'),
(171, 13, 'Hard', 'In Greek mythology, who is the Muse of epic poetry?', 'Calliope', '[\"Calliope\", \"Clio\", \"Euterpe\", \"Erato\"]'),
(172, 13, 'Hard', 'Who was the Greek god of healing and medicine?', 'Asclepius', '[\"Asclepius\", \"Apollo\", \"Hermes\", \"Panacea\"]'),
(173, 13, 'Hard', 'In Hindu mythology, what is the name of the mountain that serves as the center of the universe?', 'Mount Meru', '[\"Mount Meru\", \"Kailash\", \"Himalaya\", \"Vindhya\"]'),
(174, 13, 'Hard', 'What is the name of the spear that was used by the Gaulish hero Lugh to defeat the Fomorians?', 'Spear of Lugh', '[\"Spear of Lugh\", \"Gáe Bolg\", \"Gungnir\", \"Rhindon\"]'),
(175, 13, 'Hard', 'In Egyptian mythology, which god was considered the \"Opener of the Ways\" and was often depicted as a jackal or a dog?', 'Anubis', '[\"Anubis\", \"Osiris\", \"Horus\", \"Thoth\"]'),
(176, 13, 'Hard', 'Who is the Norse goddess of love, beauty, and fertility, known for her magical necklace Brísingamen?', 'Freyja', '[\"Freyja\", \"Frigg\", \"Idunn\", \"Sif\"]'),
(177, 13, 'Hard', 'In Greek mythology, which god is associated with boundaries, travelers, and commerce, often depicted with winged sandals?', 'Hermes', '[\"Hermes\", \"Apollo\", \"Dionysus\", \"Hephaestus\"]'),
(178, 13, 'Hard', 'What is the name of the Hindu goddess of destruction and transformation, often depicted with a necklace of skulls?', 'Kali', '[\"Kali\", \"Durga\", \"Parvati\", \"Saraswati\"]'),
(179, 13, 'Hard', 'In Japanese mythology, who is the god of fire, who was born from Izanagi and Izanami?', 'Kagutsuchi', '[\"Kagutsuchi\", \"Amaterasu\", \"Tsukuyomi\", \"Susanoo\"]'),
(180, 13, 'Hard', 'Who is the Greek god of the west wind, often considered the gentlest of the Anemoi?', 'Zephyrus', '[\"Zephyrus\", \"Boreas\", \"Notus\", \"Eurus\"]'),
(181, 13, 'Hard', 'What is the name of the river in Norse mythology that separates the land of the living from the land of the dead?', 'Gjöll', '[\"Gjöll\", \"Ifing\", \"Elivagar\", \"Bifröst\"]'),
(182, 13, 'Hard', 'In Egyptian mythology, which god is depicted with the head of an ibis?', 'Thoth', '[\"Thoth\", \"Horus\", \"Ra\", \"Anubis\"]'),
(183, 13, 'Hard', 'Who is the Celtic goddess of fire, poetry, and smithcraft, celebrated during Imbolc?', 'Brigid', '[\"Brigid\", \"Morrigan\", \"Danu\", \"Aine\"]'),
(184, 13, 'Hard', 'In Greek mythology, who was the wife of Orpheus, whom he tried to rescue from the underworld?', 'Eurydice', '[\"Eurydice\", \"Persephone\", \"Andromeda\", \"Helen\"]'),
(185, 13, 'Hard', 'Which Hindu god is known as the remover of obstacles, often depicted with an elephant head?', 'Ganesha', '[\"Ganesha\", \"Hanuman\", \"Vishnu\", \"Shiva\"]'),
(186, 13, 'Hard', 'In Norse mythology, who is the ruler of Helheim, the realm of the dead?', 'Hel', '[\"Hel\", \"Odin\", \"Loki\", \"Freyja\"]'),
(187, 13, 'Hard', 'What is the name of the Greek goddess of the hearth, home, and domestic life?', 'Hestia', '[\"Hestia\", \"Hera\", \"Aphrodite\", \"Demeter\"]'),
(188, 13, 'Hard', 'In Egyptian mythology, who is the god of chaos, desert, and storms?', 'Set', '[\"Set\", \"Osiris\", \"Ra\", \"Anubis\"]'),
(189, 13, 'Hard', 'Who is the Greek goddess of victory, often depicted with wings?', 'Nike', '[\"Nike\", \"Athena\", \"Hera\", \"Artemis\"]'),
(190, 13, 'Hard', 'In Hindu mythology, who is the god of rain and thunderstorms, wielding the weapon Vajra?', 'Indra', '[\"Indra\", \"Varuna\", \"Agni\", \"Vayu\"]'),
(191, 13, 'Hard', 'What is the name of the Greek hero who killed the Minotaur in the Labyrinth?', 'Theseus', '[\"Theseus\", \"Heracles\", \"Perseus\", \"Achilles\"]'),
(192, 13, 'Hard', 'In Norse mythology, what is the name of the rooster that will crow to signal the beginning of Ragnarök?', 'Gullinkambi', '[\"Gullinkambi\", \"Fjalarr\", \"Surtur\", \"Ratatoskr\"]'),
(193, 13, 'Hard', 'Who is the Greek god of wine, fertility, and ritual madness?', 'Dionysus', '[\"Dionysus\", \"Apollo\", \"Ares\", \"Hermes\"]'),
(194, 13, 'Hard', 'In Egyptian mythology, what is the name of the celestial cow goddess who bore Ra?', 'Hathor', '[\"Hathor\", \"Isis\", \"Nut\", \"Maat\"]'),
(195, 13, 'Hard', 'Who is the Hindu goddess of knowledge, music, art, and learning?', 'Saraswati', '[\"Saraswati\", \"Lakshmi\", \"Durga\", \"Parvati\"]'),
(196, 13, 'Hard', 'In Celtic mythology, who is the god of the underworld and ruler of the dead?', 'Arawn', '[\"Arawn\", \"Lugh\", \"Dagda\", \"Cernunnos\"]'),
(197, 13, 'Hard', 'What is the name of the Greek hero who captured the Golden Fleece with the help of the sorceress Medea?', 'Jason', '[\"Jason\", \"Odysseus\", \"Perseus\", \"Theseus\"]'),
(198, 13, 'Hard', 'In Japanese mythology, who is the sun goddess who hid in a cave, causing the world to be plunged into darkness?', 'Amaterasu', '[\"Amaterasu\", \"Susanoo\", \"Tsukuyomi\", \"Inari\"]'),
(199, 13, 'Hard', 'Who is the Roman god of wine and revelry, equivalent to the Greek god Dionysus?', 'Bacchus', '[\"Bacchus\", \"Jupiter\", \"Apollo\", \"Mars\"]'),
(200, 13, 'Hard', 'In Norse mythology, who is the goddess associated with love, beauty, and fertility, also known as Frigg\'s rival?', 'Freyja', '[\"Freyja\", \"Idunn\", \"Sif\", \"Frigg\"]');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `userID` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `totalScore` int(11) DEFAULT '0',
  PRIMARY KEY (`userID`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userID`, `username`, `email`, `password`, `totalScore`) VALUES
(1, 'user1edited', 'user1edited@example.com', '$2b$10$02kwZQ8.1.Qln/htfwJRGuiGq18IUn1skCyc9iY7f4rn2ARnL9lYu', 0),
(2, 'user2', 'user2@example.com', '25d55ad283aa400af464c76d713c07ad', 0),
(3, 'user3', 'user3@example.com', '098f6bcd4621d373cade4e832627b4f6', 0),
(4, 'user4', 'user4@example.com', 'e10adc3949ba59abbe56e057f20f883e', 0),
(5, 'user5', 'user5@example.com', 'fcea920f7412b5da7be0cf42b8c93759', 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_category_scores`
--

DROP TABLE IF EXISTS `user_category_scores`;
CREATE TABLE IF NOT EXISTS `user_category_scores` (
  `userCategoryScoreID` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) DEFAULT NULL,
  `categoryID` int(11) DEFAULT NULL,
  `score` int(11) DEFAULT '0',
  PRIMARY KEY (`userCategoryScoreID`),
  KEY `userID` (`userID`),
  KEY `user_category_scores_ibfk_2` (`categoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user_responses`
--

DROP TABLE IF EXISTS `user_responses`;
CREATE TABLE IF NOT EXISTS `user_responses` (
  `responseID` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) DEFAULT NULL,
  `questionID` int(11) DEFAULT NULL,
  `userAnswer` varchar(100) NOT NULL,
  `isCorrect` tinyint(1) NOT NULL,
  `difficulty` enum('Easy','Medium','Hard') NOT NULL,
  `scoreEarned` int(11) DEFAULT NULL,
  PRIMARY KEY (`responseID`),
  KEY `userID` (`userID`),
  KEY `questionID` (`questionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `leaderboards`
--
ALTER TABLE `leaderboards`
  ADD CONSTRAINT `leaderboards_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`) ON DELETE CASCADE,
  ADD CONSTRAINT `leaderboards_ibfk_2` FOREIGN KEY (`categoryID`) REFERENCES `categories` (`categoryID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`categoryID`) REFERENCES `categories` (`categoryID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_category_scores`
--
ALTER TABLE `user_category_scores`
  ADD CONSTRAINT `user_category_scores_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_category_scores_ibfk_2` FOREIGN KEY (`categoryID`) REFERENCES `categories` (`categoryID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_responses`
--
ALTER TABLE `user_responses`
  ADD CONSTRAINT `user_responses_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_responses_ibfk_2` FOREIGN KEY (`questionID`) REFERENCES `questions` (`questionID`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
