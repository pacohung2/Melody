-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 18, 2020 at 03:16 PM
-- Server version: 5.7.29-0ubuntu0.18.04.1
-- PHP Version: 7.2.24-0ubuntu0.18.04.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `MelodyDB`
--

-- --------------------------------------------------------

--
-- Table structure for table `albums`
--

CREATE TABLE `albums` (
  `id` int(6) NOT NULL,
  `image` varchar(50) NOT NULL,
  `title` varchar(50) NOT NULL,
  `artist_id` int(6) NOT NULL,
  `release_date` date NOT NULL,
  `genre_id` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `albums`
--

INSERT INTO `albums` (`id`, `image`, `title`, `artist_id`, `release_date`, `genre_id`) VALUES
(1, '1.png', 'A Night at the Opera', 5, '1975-11-21', 4),
(2, '2.jpg', 'Appetite for Destruction', 1, '1987-07-21', 2),
(3, '3.jpg', 'Boston', 0, '1976-08-25', 1),
(4, '4.jpg', 'Californication', 6, '1999-06-08', 0),
(5, '5.jpg', 'Hemispheres', 7, '1978-10-29', 4),
(6, '6.jpg', 'Led Zeppelin IV', 2, '1971-11-08', 1),
(7, '7.jpg', 'Moving Pictures', 7, '1981-02-12', 4),
(8, '8.jpg', 'Ride the Lightning', 3, '1984-07-27', 3),
(9, '9.jpg', 'The Dark Side of the Moon', 4, '1973-03-01', 4),
(10, '10.jpg', 'The Wall', 4, '1979-11-30', 4),
(11, '11.jpg', 'Van Halen', 8, '1978-02-10', 2);

-- --------------------------------------------------------

--
-- Table structure for table `artists`
--

CREATE TABLE `artists` (
  `id` int(6) NOT NULL,
  `name` varchar(50) NOT NULL,
  `members` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `artists`
--

INSERT INTO `artists` (`id`, `name`, `members`) VALUES
(0, 'Boston', 'Brad Delp, Tom Scholz, Barry Goudreau, Fran Sheehan, Sib Hashian'),
(1, 'Guns N\' Roses', 'Axl Rose, Slash, Izzy Stradlin, Duff McKagan, Steven Adler'),
(2, 'Led Zeppelin', 'Robert Plant, Jimmy Page, John Paul Jones, John Bonham'),
(3, 'Metallica', 'James Hetfield, Kirk Hammett, Cliff Burton, Lars Ulrich'),
(4, 'Pink Floyd', 'David Gilmour, Roger Waters, Richard Wright, Nick Mason'),
(5, 'Queen', 'Freddie Mercury, Brian May, John Deacon, Roger Taylor'),
(6, 'Red Hot Chili Peppers', 'Anthony Kiedis, John Frusciante, Flea, Chad Smith'),
(7, 'Rush', 'Geddy Lee, Alex Lifeson, Neil Peart'),
(8, 'Van Halen', 'David Lee Roth, Eddie Van Halen, Michael Anthony, Alex Van Halen');

-- --------------------------------------------------------

--
-- Table structure for table `favorites`
--

CREATE TABLE `favorites` (
  `username` varchar(50) CHARACTER SET latin1 NOT NULL,
  `song_id` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `favorites`
--

INSERT INTO `favorites` (`username`, `song_id`) VALUES
('agostagec', 11),
('agostagec', 31),
('cranson7', 21),
('mfleming9', 8),
('mfleming9', 12),
('mfleming9', 13),
('mfleming9', 14),
('sseerd', 3),
('sseerd', 2),
('pacoh', 7),
('pacoh', 16),
('pacoh', 22),
('pacoh', 1),
('pacoh', 13),
('pacoh', 25),
('pacoh', 36),
('pacoh', 10),
('pacoh', 27);

-- --------------------------------------------------------

--
-- Table structure for table `genres`
--

CREATE TABLE `genres` (
  `id` int(6) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `genres`
--

INSERT INTO `genres` (`id`, `name`) VALUES
(0, 'Alternative Rock'),
(1, 'Classic Rock'),
(2, 'Hard Rock'),
(3, 'Metal'),
(4, 'Progressive Rock');

-- --------------------------------------------------------

--
-- Table structure for table `songs`
--

CREATE TABLE `songs` (
  `id` int(6) NOT NULL,
  `album_id` int(6) NOT NULL,
  `title` varchar(50) NOT NULL,
  `lyrics` text NOT NULL,
  `length` varchar(10) NOT NULL,
  `video` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `songs`
--

INSERT INTO `songs` (`id`, `album_id`, `title`, `lyrics`, `length`, `video`) VALUES
(1, 1, '\'39', 'In the year of \'39 assembled here the volunteers\r\nIn the days when the lands were few\r\nHere the ship sailed out into the blue and sunny morn\r\nThe sweetest sight ever seen.\r\n\r\nAnd the night followed day\r\nAnd the story tellers say\r\nThat the score brave souls inside\r\nFor many a lonely day sailed across the milky seas\r\nNever looked back, never feared, never cried.\r\n\r\nDon\'t you hear my call though you\'re many years away\r\nDon\'t you hear me calling you\r\nWrite your letters in the sand\r\nFor the day I take your hand\r\nIn the land that our grandchildren knew.\r\n\r\nIn the year of \'39 came a ship in from the blue\r\nThe volunteers came home that day\r\nAnd they bring good news of a world so newly born\r\nThough their hearts so heavily weigh\r\n\r\nFor the earth is old and grey, little darling wellaway\r\nBut my love this cannot be\r\nFor so many years have gone though I\'m older but a year\r\nYour mother\'s eyes from your eyes cry to me.\r\n\r\nDon\'t you hear my call though you\'re many years away\r\nDon\'t you hear me calling you\r\nWrite your letters in the sand\r\nFor the day I take your hand\r\nIn the land that our grandchildren knew.\r\n\r\nDon\'t you hear my call though you\'re many years away\r\nDon\'t you hear me calling you\r\nAll your letters in the sand cannot heal me like your hand\r\n\r\nFor my life\r\nStill ahead\r\nPity me.', '3:31', 'https://www.youtube.com/embed/kE8kGMfXaFU'),
(2, 1, 'Bohemian Rhapsody', 'Is this the real life?\r\nIs this just fantasy?\r\nCaught in a landslide,\r\nNo escape from reality.\r\n\r\nOpen your eyes,\r\nLook up to the skies and see,\r\nI\'m just a poor boy, I need no sympathy,\r\nBecause I\'m easy come, easy go,\r\nLittle high, little low,\r\nAny way the wind blows doesn\'t really matter to me, to me.\r\n\r\nMama, just killed a man,\r\nPut a gun against his head,\r\nPulled my trigger, now he\'s dead.\r\nMama, life had just begun,\r\nBut now I\'ve gone and thrown it all away.\r\n\r\nMama, ooh,\r\nDidn\'t mean to make you cry,\r\nIf I\'m not back again this time tomorrow,\r\nCarry on, carry on as if nothing really matters.\r\n\r\nToo late, my time has come,\r\nSends shivers down my spine,\r\nBody\'s aching all the time.\r\nGoodbye, everybody, I\'ve got to go,\r\nGotta leave you all behind and face the truth.\r\n\r\nMama, ooh (any way the wind blows),\r\nI don\'t wanna die,\r\nI sometimes wish I\'d never been born at all.\r\n\r\nI see a little silhouetto of a man,\r\nScaramouche, Scaramouche, will you do the Fandango?\r\nThunderbolt and lightning,\r\nVery, very frightening me.\r\n(Galileo) Galileo.\r\n(Galileo) Galileo,\r\nGalileo Figaro\r\nMagnifico-o-o-o-o.\r\n\r\nI\'m just a poor boy, nobody loves me.\r\nHe\'s just a poor boy from a poor family,\r\nSpare him his life from this monstrosity.\r\n\r\nEasy come, easy go, will you let me go?\r\nBismillah! No, we will not let you go. (Let him go!)\r\nBismillah! We will not let you go. (Let him go!)\r\nBismillah! We will not let you go. (Let me go!)\r\nWill not let you go. (Let me go!)\r\nNever let you go (Never, never, never, never let me go)\r\nOh oh oh oh\r\nNo, no, no, no, no, no, no\r\nOh, mama mia, mama mia (Mama mia, let me go.)\r\nBeelzebub has a devil put aside for me, for me, for me.\r\n\r\nSo you think you can stone me and spit in my eye?\r\nSo you think you can love me and leave me to die?\r\nOh, baby, can\'t do this to me, baby,\r\nJust gotta get out, just gotta get right outta here.\r\n\r\n(Ooooh, ooh yeah, ooh yeah)\r\n\r\nNothing really matters,\r\nAnyone can see,\r\nNothing really matters,\r\nNothing really matters to me.\r\n\r\nAny way the wind blows.', '5:54', 'https://www.youtube.com/embed/fJ9rUzIMcZQ'),
(3, 1, 'You\'re My Best Friend', 'Ooh, you make me live\r\nWhatever this world can give to me\r\nIt\'s you, you\'re all I see\r\nOoh, you make me live now honey\r\nOoh, you make me live\r\n\r\nYou\'re the best friend\r\nThat I ever had\r\nI\'ve been with you such a long time\r\nYou\'re my sunshine\r\nAnd I want you to know\r\nThat my feelings are true\r\nI really love you\r\nYou\'re my best friend\r\n\r\nOoh, you make me live\r\n\r\nI\'ve been wandering round\r\nBut I still come back to you\r\nIn rain or shine\r\nYou\'ve stood by me girl\r\nI\'m happy at home (happy at home)\r\nYou\'re my best friend\r\n\r\nOoh, you make me live\r\nWhenever this world is cruel to me\r\nI got you to help me forgive\r\nOoh, you make me live now honey\r\nOoh, you make me live\r\n\r\nYou\'re the first one\r\nWhen things turn out bad\r\nYou know I\'ll never be lonely\r\nYou\'re my only one\r\nAnd I love the things\r\nI really love the things that you do\r\nYou\'re my best friend\r\n\r\nOoh, you make me live\r\n\r\nI\'m happy, happy at home\r\nYou\'re my best friend\r\nOh\r\nOh, you\'re my best friend\r\nOoh, you make me live\r\nOoh, you\'re my best friend', '2:51', 'https://www.youtube.com/embed/HaZpZQG2z10'),
(4, 2, 'Paradise City', 'Take me down\r\nTo the paradise city\r\nWhere the grass is green\r\nAnd the girls are pretty\r\nOh, won\'t you please take me home\r\n\r\nTake me down\r\nTo the paradise city\r\nWhere the grass is green\r\nAnd the girls are pretty\r\nOh, won\'t you please take me home\r\n\r\nJust an urchin livin\' under the street\r\nI\'m a hard case that\'s tough to beat\r\nI\'m your charity case\r\nSo buy me somethin\' to eat\r\nI\'ll pay you at another time\r\nTake it to the end of the line\r\n\r\nRags to riches or so they say\r\nYa gotta-keep pushin\' for the fortune and fame\r\nYou know it\'s, it\'s all a gamble\r\nWhen it\'s just a game\r\nYou treat it like a capital crime\r\nEverybody\'s doin\' their time\r\n\r\nTake me down\r\nTo the paradise city\r\nWhere the grass is green\r\nAnd the girls are pretty\r\nOh, won\'t you please take me home\r\nTake me down\r\nTo the paradise city\r\nWhere the grass is green\r\nAnd the girls are pretty\r\nTake me home\r\n\r\nStrapped in the chair of the city\'s gas chamber\r\nWhy I\'m here I can\'t quite remember\r\nThe surgeon general says it\'s hazardous to breathe\r\nI\'d have another cigarette, but I can\'t see\r\nTell me who you\'re gonna believe\r\n\r\nTake me down\r\nTo the paradise city\r\nWhere the grass is green\r\nAnd the girls are pretty\r\nTake me home\r\nTake me down\r\nTo the paradise city\r\nWhere the grass is green\r\nAnd the girls are pretty\r\nOh, won\'t you please take me home\r\n\r\nSo far away\r\nSo far away\r\nSo far away\r\nSo far away\r\n\r\nCaptain America\'s been torn apart\r\nNow he\'s a court jester with a broken heart\r\nHe said\r\nTurn me around and take me back to the start\r\nI must be losin\' my mind—\"Are you blind?\"\r\nI\'ve seen it all a million times\r\n\r\nTake me down\r\nTo the paradise city\r\nWhere the grass is green\r\nAnd the girls are pretty\r\nTake me home\r\nTake me down\r\nTo the paradise city\r\nWhere the grass is green\r\nAnd the girls are pretty\r\nOh, won\'t you please take me home\r\n\r\nTake me down\r\nTo the paradise city\r\nWhere the grass is green\r\nAnd the girls are pretty\r\nTake me home\r\nTake me down\r\nTo the paradise city\r\nWhere the grass is green\r\nAnd the girls are pretty\r\nOh, won\'t you please take me home\r\n\r\nHome\r\nHome\r\nI wanna go\r\nI wanna go\r\nOh won\'t you please take me home\r\nI wanna see\r\nOh won\'t you please take me home\r\n\r\nTake me down\r\nTo the paradise city\r\nWhere the grass is green\r\nAnd the girls are pretty\r\nTake me home\r\nTake me down\r\nTo the paradise city\r\nWhere the grass is green\r\nAnd the girls are pretty\r\nOh, won\'t you please take me home', '6:46', 'https://www.youtube.com/embed/Rbm6GXllBiw'),
(5, 2, 'Sweet Child O\' Mine', 'She\'s got a smile that it seems to me\r\nReminds me of childhood memories\r\nWhere everything\r\nWas as fresh as the bright blue sky\r\n\r\nNow and then when I see her face\r\nIt takes me away to that special place\r\nAnd if I stared too long\r\nI\'d probably break down and cry\r\n\r\nSweet child o\' mine\r\nSweet love of mine\r\n\r\nShe\'s got eyes of the bluest skies\r\nAs if they thought of rain\r\nI\'d hate to look into those eyes\r\nAnd see an ounce of pain\r\n\r\nHer hair reminds me of a warm safe place\r\nWhere as a child I\'d hide\r\nAnd pray for the thunder and the rain\r\nTo quietly pass me by\r\n\r\nSweet child o\' mine\r\nSweet love of mine\r\n\r\nSweet child o\' mine\r\nSweet love of mine\r\n\r\nSweet child o\' mine\r\nSweet love of mine\r\n\r\nWhere do we go?\r\nWhere do we go now?\r\nWhere do we go?\r\n\r\nWhere do we go?\r\nWhere do we go?\r\nWhere do we go now?\r\n\r\nWhere do we go?\r\nSweet child o\' mine\r\nWhere do we go now?\r\n\r\nWhere do we go?\r\nWhere do we go?\r\nWhere do we go now?\r\n\r\nWhere do we go?\r\nWhere do we go now?\r\nWhere do we go?\r\nWhere do we go now?\r\n\r\nWhere do we go?\r\nWhere do we go now, now, now, now, now, now, now now?\r\n\r\nSweet child, sweet child o\' mine', '5:55', 'https://www.youtube.com/embed/1w7OgIMMRc4'),
(6, 2, 'Welcome to The Jungle', 'Welcome to the jungle\r\nWe\'ve got fun \'n\' games\r\nWe got everything you want\r\nHoney, we know the names\r\nWe are the people that can find\r\nWhatever you may need\r\nIf you got the money, honey\r\nWe got your disease\r\n\r\nIn the jungle\r\nWelcome to the jungle\r\nWatch it bring you to your\r\nKnees, knees\r\nI wanna watch you bleed\r\n\r\nWelcome to the jungle\r\nWe take it day by day\r\nIf you want it you\'re gonna bleed\r\nBut it\'s the price you pay\r\nAnd you\'re a very sexy girl\r\nThat\'s very hard to please\r\nYou can taste the bright lights\r\nBut you won\'t get them for free\r\n\r\nIn the jungle\r\nWelcome to the jungle\r\nFeel my, my, my, my serpentine\r\nI, I wanna hear you scream\r\n\r\nWelcome to the jungle\r\nIt gets worse here everyday\r\nYou learn to live like an animal\r\nIn the jungle where we play\r\nIf you got a hunger for what you see\r\nYou\'ll take it eventually\r\nYou can have anything you want\r\nBut you better not take it from me\r\n\r\nIn the jungle\r\nWelcome to the jungle\r\nWatch it bring you to your\r\nKnees, knees\r\nI\'m gonna watch you bleed\r\n\r\nAnd when you\'re high you never ever wanna come down,\r\nso down, so down, so down, yeah!\r\n\r\nYou know where you are?\r\nYou\'re in the jungle, baby\r\nYou\'re gonna die\r\n\r\nIn the jungle\r\nWelcome to the jungle\r\nWatch it bring you to your\r\nKnees, knees\r\n\r\nIn the jungle\r\nWelcome to the jungle\r\nFeel my, my, my, my serpentine\r\n\r\nIn the jungle\r\nWelcome to the jungle\r\nWatch it bring you to your\r\nKnees, knees\r\n\r\nIn the jungle\r\nWelcome to the jungle\r\nWatch it bring you to your...\r\n\r\nIt\'s gonna bring you down\r\nHa!', '4:32', 'https://www.youtube.com/embed/o1tj2zJ2Wvg'),
(7, 3, 'Hitch a Ride', 'Day is night in New York City\r\nSmoke, like water, runs inside\r\nSteel idle trees to pity\r\nEvery living things that\'s died\r\n\r\nGonna hitch a ride\r\nHead for the other side\r\nLeave it all behind\r\nNever change my mind\r\nGonna sail away\r\nSun lights another day\r\nFreedom on my mind\r\nCarry me away for the last time\r\nOh yeah\r\n\r\nLife is like the coldest winter\r\nPeople freeze the tears I cry\r\nWords of hail their minds are into\r\nI\'ve got to crack this ice and fly\r\n\r\nGonna hitch a ride\r\nHead for the other side\r\nLeave it all behind\r\nNever change my mind\r\nGonna sail away\r\nSun lights another day\r\nFreedom on my mind\r\nCarry me away for the last time\r\n\r\nGonna hitch a ride\r\nHead for the other side\r\nLeave it all behind\r\nNever change my mind\r\nGonna sail away\r\nSun lights another day\r\nFreedom on my mind\r\nCarry me away for the last time', '4:12', 'https://www.youtube.com/embed/tV3pR87L-T8'),
(8, 3, 'More Than a Feeling', 'I looked out this morning and the sun was gone\r\nTurned on some music to start my day\r\nI lost myself in a familiar song\r\nI closed my eyes and I slipped away\r\n\r\nIt\'s more than a feeling\r\n(more than a feeling)\r\nWhen I hear that old song they used to play\r\n(more than a feeling)\r\nAnd I begin dreaming\r\n(more than a feeling)\r\n\'Til I see Marianne walk away\r\nI see my Marianne walkin\' away\r\n\r\nSo many people have come and gone\r\nTheir faces fade as the years go by\r\nYet I still recall as I wander on\r\nAs clear as the sun in the summer sky\r\n\r\nIt\'s more than a feeling\r\n(more than a feeling)\r\nWhen I hear that old song they used to play\r\n(more than a feeling)\r\nAnd I begin dreaming\r\n(more than a feeling)\r\n\'Til I see Marianne walk away\r\nI see my Marianne walkin\' away\r\n\r\nWhen I\'m tired and thinking cold\r\nI hide in my music, forget the day\r\nAnd dream of a girl I used to know\r\nI closed my eyes and she slipped away\r\nShe slipped away\r\n\r\nIt\'s more than a feeling\r\n(more than a feeling)\r\nWhen I hear that old song they used to play\r\n(more than a feeling)\r\nAnd I begin dreaming\r\n(more than a feeling)\r\n\'Til I see Marianne walk away', '4:45', 'https://www.youtube.com/embed/t4QK8RxCAwo'),
(9, 3, 'Peace of Mind', 'Now if you\'re feelin\' kinda low \'bout the dues you\'ve been paying\r\nFuture\'s coming much too slow\r\nAnd you wanna run but somehow you just keep on stayin\'\r\nCan\'t decide on which way to go\r\nYeah, yeah, yeah\r\n\r\nI understand about indecision\r\nBut I don\'t care if I get behind\r\nPeople livin\' in competition\r\nAll I want is to have my peace of mind\r\n\r\nNow you\'re climbin\' to the top of the company ladder\r\nHope it doesn\'t take too long\r\nCan\'tcha see there\'ll come a day when it won\'t matter\r\nCome a day when you\'ll be gone\r\n\r\nI understand about indecision\r\nBut I don\'t care if I get behind\r\nPeople livin\' in competition\r\nAll I want is to have my peace of mind\r\n\r\nTake a look ahead, take a look ahead, yeah, yeah, yeah, yeah...\r\n\r\nNow everybody\'s got advice they just keep on givin\'\r\nDoesn\'t mean too much to me\r\nLot\'s of people out to make-believe they\'re livin\'\r\nCan\'t decide who they should be\r\n\r\nI understand about indecision\r\nBut I don\'t care if I get behind\r\nPeople livin\' in competition\r\nAll I want is to have my peace of mind\r\n\r\nTake a look ahead, take a look ahead. Look ahead', '5:04', 'https://www.youtube.com/embed/edwk-8KJ1Js'),
(10, 4, 'Californication', 'Psychic spies from China\r\nTry to steal your mind\'s elation\r\nLittle girls from Sweden\r\nDream of silver screen quotations\r\nAnd if you want these kind of dreams\r\nIt\'s Californication\r\n\r\nIt\'s the edge of the world\r\nAnd all of western civilization\r\nThe sun may rise in the East\r\nAt least it settles in the final location\r\nIt\'s understood that Hollywood\r\nSells Californication\r\n\r\nPay your surgeon very well\r\nTo break the spell of aging\r\nCelebrity skin is this your chin\r\nOr is that war you\'re waging?\r\n\r\nFirst born unicorn\r\nHard core soft porn\r\nDream of Californication\r\nDream of Californication\r\nDream of Californication\r\nDream of Californication\r\n\r\nMarry me girl be my fairy to the world\r\nBe my very own constellation\r\nA teenage bride with a baby inside\r\nGetting high on information\r\nAnd buy me a star on the boulevard\r\nIt\'s Californication\r\n\r\nSpace may be the final frontier\r\nBut it\'s made in a Hollywood basement\r\nCobain can you hear the spheres\r\nSinging songs off station to station\r\nAnd Alderaan\'s not far away\r\nIt\'s Californication\r\n\r\nBorn and raised by those who praise\r\nControl of population everybody\'s been there and\r\nI don\'t mean on vacation\r\n\r\nFirst born unicorn\r\nHard core soft porn\r\nDream of Californication\r\nDream of Californication\r\nDream of Californication\r\nDream of Californication\r\n\r\nDestruction leads to a very rough road\r\nBut it also breeds creation\r\nAnd earthquakes are to a girl\'s guitar\r\nThey\'re just another good vibration\r\nAnd tidal waves couldn\'t save the world\r\nFrom Californication\r\n\r\nPay your surgeon very well\r\nTo break the spell of aging\r\nSicker than the rest\r\nThere is no test\r\nBut this is what you\'re craving\r\n\r\nFirst born unicorn\r\nHard core soft porn\r\nDream of Californication\r\nDream of Californication\r\nDream of Californication\r\nDream of Californication', '5:30', 'https://www.youtube.com/embed/YlUKcNNmywk'),
(11, 4, 'Otherside', 'How long how long will I slide\r\nSeparate my side I don\'t\r\nI don\'t believe it\'s bad\r\nSlit my throat\r\nIt\'s all I ever\r\n\r\nI heard your voice through a photograph\r\nI thought it up it brought up the past\r\nOnce you know you can never go back\r\nI\'ve got to take it on the otherside\r\n\r\nCenturies are what it meant to me\r\nA cemetery where I marry the sea\r\nStranger things could never change my mind\r\nI\'ve got to take it on the otherside\r\nTake it on the otherside\r\nTake it on\r\nTake it on\r\n\r\nHow long how long will I slide\r\nSeparate my side I don\'t\r\nI don\'t believe it\'s bad\r\nSlit my throat\r\nIt\'s all I ever\r\n\r\nPour my life into a paper cup\r\nThe ashtray\'s full and I\'m spillin\' my guts\r\nShe wants to know am I still a slut\r\nI\'ve got to take it on the otherside\r\n\r\nScarlet starlet and she\'s in my bed\r\nA candidate for my soul mate bled\r\nPush the trigger and pull the thread\r\nI\'ve got to take it on the otherside\r\nTake it on the otherside\r\nTake it on\r\nTake it on\r\n\r\nHow long how long will I slide\r\nSeparate my side I don\'t\r\nI don\'t believe it\'s bad\r\nSlit my throat\r\nIt\'s all I ever\r\n\r\nTurn me on take me for a hard ride\r\nBurn me out leave me on the otherside\r\nI yell and tell it that\r\nIt\'s not my friend\r\nI tear it down I tear it down\r\nAnd then it\'s born again\r\n\r\nHow long how long will I slide\r\nSeparate my side I don\'t\r\nI don\'t believe it\'s bad\r\nSlit my throat\r\nIt\'s all I ever\r\n\r\nHow long I don\'t believe it\'s bad\r\nSlit my throat\r\nIt\'s all I ever', '4:15', 'https://www.youtube.com/embed/rn_YodiJO6k'),
(12, 4, 'Scar Tissue', 'Scar tissue that I wish you saw\r\nSarcastic mister know it all\r\nClose your eyes and I\'ll kiss you\r\n\'Cause with the birds I\'ll share\r\n\r\nWith the birds I\'ll share this lonely view\r\nWith the birds I\'ll share this lonely view\r\n\r\nPush me up against the wall\r\nYoung Kentucky girl in a push-up bra\r\nFallin\' all over myself\r\nTo lick your heart and taste your health\r\n\'Cause with the birds I\'ll share this lonely view\r\n\r\nWith the birds I\'ll share this lonely view\r\nWith the birds I\'ll share this lonely view\r\n\r\nBlood loss in a bathroom stall\r\nA southern girl with a scarlet drawl\r\nWave good-bye to ma and pa\r\n\'Cause with the birds I\'ll share\r\n\r\nWith the birds I\'ll share this lonely view\r\nWith the birds I\'ll share this lonely view\r\n\r\nSoft spoken with a broken jaw\r\nStep outside but not to brawl and\r\nAutumn\'s sweet we call it fall\r\nI\'ll make it to the moon if I have to crawl and\r\nAnd with the birds I\'ll share this lonely view\r\n\r\nWith the birds I\'ll share this lonely view\r\nWith the birds I\'ll share this lonely view\r\n\r\nScar tissue that I wish you saw\r\nSarcastic mister know it all\r\nClose your eyes and I\'ll kiss you\r\n\'Cause with the birds I\'ll share\r\n\r\nWith the birds I\'ll share this lonely view\r\nWith the birds I\'ll share this lonely view\r\nWith the birds I\'ll share this lonely view', '3:36', 'https://www.youtube.com/embed/mzJj5-lubeM'),
(13, 5, 'Cygnus X-1 Book II: Hemispheres', '[I. Prelude]\r\n\r\nWhen our weary world was young\r\nThe struggle of the ancients first began\r\nThe gods of love and reason\r\nSought alone to rule the fate of man\r\n\r\nThey battled through the ages\r\nBut still neither force would yield\r\nThe people were divided\r\nEvery soul a battlefield\r\n\r\n[II. Apollo / Dionysus]\r\n\r\n[Apollo: Bringer Of Wisdom]\r\n\'I bring truth and understanding\r\nI bring wit and wisdom fair\r\nPrecious gifts beyond compare\r\nWe can build a world of wonder\r\nI can make you all aware\r\nI will find you food and shelter\r\nShow you fire to keep you warm\r\nThrough the endless winter storm\r\nYou can live in grace and comfort\r\nIn the world that you transform\'\r\n\r\nThe people were delighted\r\nComing forth to claim their prize\r\nThey ran to build their cities\r\nAnd converse among the wise\r\nBut one day the streets fell silent\r\nYet they knew not what was wrong\r\nThe urge to build these fine things\r\nSeemed not to be so strong\r\nThe wise men were consulted\r\nAnd the Bridge of Death was crossed\r\nIn quest of Dionysus\r\nTo find out what they had lost\r\n\r\n[Dionysus: Bringer Of Love]\r\n\'I bring love to give you solace\r\nIn the darkness of the night\r\nIn the Heart\'s eternal light\r\nYou need only trust your feelings\r\nOnly love can steer you right\r\nI bring laughter, I bring music\r\nI bring joy and I bring tears\r\nI will soothe your primal fears\r\nThrow off those chains of reason\r\nAnd your prison disappears\'\r\n\r\nThe cities were abandoned\r\nAnd the forests echoed song\r\nThey danced and lived as brothers\r\nThey knew love could not be wrong\r\nFood and wine they had aplenty\r\nAnd they slept beneath the stars\r\nThe people were contented\r\nAnd the gods watched from afar\r\nBut the winter fell upon them\r\nAnd it caught them unprepared\r\nBringing wolves and cold starvation\r\nAnd the hearts of men despaired\r\n\r\n[III. Armageddon: The Battle Of Heart and Mind]\r\n\r\nThe universe divided\r\nAs the heart and mind collided\r\nWith the people left unguided\r\nFor so many troubled years\r\nIn a cloud of doubts and fears\r\nTheir world was torn asunder into hollow\r\nHemispheres\r\n\r\nSome fought themselves, some fought each other\r\nMost just followed one another\r\nLost and aimless like their brothers\r\nFor their hearts were so unclear\r\nAnd the truth could not appear\r\nTheir spirits were divided into blinded\r\nHemispheres\r\n\r\nSome who did not fight\r\nBrought tales of old to light\r\n\'My Rocinante sailed by night\r\nOn her final flight\'\r\nTo the heart of Cygnus\' fearsome force\r\nWe set our course\r\nSpiralled through that timeless space\r\nTo this immortal place\r\n\r\n[IV. Cygnus: Bringer Of Balance]\r\n\r\nI have memory and awareness\r\nBut I have no shape or form\r\nAs a disembodied spirit\r\nI am dead and yet unborn\r\nI have passed into Olympus\r\nAs was told in tales of old\r\nTo the city of Immortals\r\nMarble white and purest gold...\r\n\r\nI see the gods in battle rage on high...\r\nThunderbolts across the sky...\r\nI cannot move, I cannot hide...\r\nI feel a silent scream begin inside...\r\n\r\nThen all at once the chaos ceased\r\nA stillness fell, a sudden peace\r\nThe warriors felt my silent cry\r\nAnd stayed their struggle, mystified\r\n\r\nApollo was astonished\r\nDionysus thought me mad\r\nBut they heard my story further\r\nAnd they wondered, and were sad\r\n\r\nLooking down from Olympus\r\nOn a world of doubt and fear\r\nIts surface splintered\r\nInto sorry Hemispheres\r\n\r\nThey sat a while in silence\r\nThen they turned at last to me\r\n\'We will call you Cygnus\r\nThe god of Balance you shall be\'\r\n\r\n[V. The Sphere: A Kind Of Dream]\r\n\r\nWe can walk our road together\r\nIf our goals are all the same\r\nWe can run alone and free\r\nIf we pursue a different aim\r\nLet the truth of love be lighted\r\nLet the love of truth shine clear\r\nSensibility\r\nArmed with sense and liberty\r\nWith the heart and mind united in a single\r\nPerfect\r\nSphere', '18:04', 'https://www.youtube.com/embed/zfloBf5yLi8'),
(14, 5, 'La Villa Strangiato', 'Instrumental', '9:35', 'https://www.youtube.com/embed/PWue-XcFFxw'),
(15, 5, 'The Trees', 'There is unrest in the forest\r\nThere is trouble with the trees\r\nFor the maples want more sunlight\r\nAnd the oaks ignore their pleas\r\n\r\nThe trouble with the maples\r\n(And they\'re quite convinced they\'re right)\r\nThey say the oaks are just too lofty\r\nAnd they grab up all the light\r\nBut the oaks can\'t help their feelings\r\nIf they like the way they\'re made\r\nAnd they wonder why the maples\r\nCan\'t be happy in their shade\r\n\r\nThere is trouble in the forest\r\nAnd the creatures all have fled\r\nAs the maples scream \'Oppression!\'\r\nAnd the oaks just shake their heads\r\n\r\nSo the maples formed a union\r\nAnd demanded equal rights\r\n\'The oaks are just too greedy\r\nWe will make them give us light\'\r\nNow there\'s no more oak oppression\r\nFor they passed a noble law\r\nAnd the trees are all kept equal\r\nBy hatchet, axe and saw', '4:43', 'https://www.youtube.com/embed/iDM8fXhRdWs'),
(16, 6, 'Black Dog', 'Hey, hey mama, said the way you move\r\nGonna make you sweat, gonna make you groove\r\n\r\nUh uh child, way you shake that thing\r\nGonna make you burn, gonna make you sting\r\n\r\nHey, hey, baby, when you walk that way\r\nWatch your honey drip, can\'t keep away\r\n\r\nAh, yeah, ah, yeah, ah, ah, ah\r\nAh, yeah, ah, yeah, ah, ah, ah\r\n\r\nI gotta roll, can\'t stand still\r\nGot a flamin\' heart, can\'t get my fill\r\n\r\nEyes that shine, burnin\' red\r\nDreams of you all through my head\r\n\r\nAh, ah, ah, ah, ah, ah, ah, ah, ah, ah, ah, ah, ah\r\n\r\nHey hey, baby, oh, baby, pretty baby\r\nDarlin\' can\'t you do me now?\r\n\r\nHey, baby, oh, baby, pretty baby\r\nMove me while you do me now\r\n\r\nDidn\'t take too long \'fore I found out\r\nWhat people mean by down and out\r\n\r\nSpent my money, took my car\r\nStarted tellin\' her friends she gonna be a star\r\n\r\nI don\'t know, but I been told\r\nA big legged woman ain\'t got no soul\r\n\r\nOh, yeah, oh, yeah, ah, ah, ah\r\nOh, yeah, oh, yeah, ah, ah, yeah\r\n\r\nAll I ask for, all I pray\r\nSteady-loaded woman gonna come my way\r\n\r\nNeed a woman, gonna hold my hand\r\nWill tell me no lies, make me a happy man\r\n\r\nAh, ah, ah, ah, ah, ah, ah, ah, ah, ah, ah, ah, ah\r\n\r\nLa-da ah e ah\r\n\r\nYes I will. And, yes, I really, really do, baby, baby, baby\r\n\r\nI can really do you, huh? Ooh, wow, you do it, baby\r\nPush it, baby, push it, baby, push it, baby, push it, baby\r\nPush it, baby, push it, babe, babe\r\nOoh, ooh, aah ooh. Ooh. I\'d really like to do it now\r\nI\'d really like to do it now', '4:55', 'https://www.youtube.com/embed/XIiu0JI3I5g'),
(17, 6, 'Stairway to Heaven', 'There\'s a lady who\'s sure all that glitters is gold\r\nAnd she\'s buying a stairway to heaven.\r\nWhen she gets there she knows, if the stores are all closed\r\nWith a word she can get what she came for.\r\nOoh, ooh, and she\'s buying a stairway to heaven.\r\n\r\nThere\'s a sign on the wall but she wants to be sure\r\n\'Cause you know sometimes words have two meanings.\r\nIn a tree by the brook, there\'s a songbird who sings,\r\nSometimes all of our thoughts are misgiven.\r\n\r\nOoh, it makes me wonder,\r\nOoh, it makes me wonder.\r\n\r\nThere\'s a feeling I get when I look to the west,\r\nAnd my spirit is crying for leaving.\r\nIn my thoughts I have seen rings of smoke through the trees,\r\nAnd the voices of those who stand looking.\r\n\r\nOoh, it makes me wonder,\r\nOoh, it really makes me wonder.\r\n\r\nAnd it\'s whispered that soon, if we all call the tune,\r\nThen the piper will lead us to reason.\r\nAnd a new day will dawn for those who stand long,\r\nAnd the forests will echo with laughter.\r\n\r\nIf there\'s a bustle in your hedgerow, don\'t be alarmed now,\r\nIt\'s just a spring clean for the May queen.\r\nYes, there are two paths you can go by, but in the long run\r\nThere\'s still time to change the road you\'re on.\r\nAnd it makes me wonder.\r\n\r\nYour head is humming and it won\'t go, in case you don\'t know,\r\nThe piper\'s calling you to join him,\r\nDear lady, can you hear the wind blow, and did you know\r\nYour stairway lies on the whispering wind?\r\n\r\nAnd as we wind on down the road\r\nOur shadows taller than our soul.\r\nThere walks a lady we all know\r\nWho shines white light and wants to show\r\nHow everything still turns to gold.\r\nAnd if you listen very hard\r\nThe tune will come to you at last.\r\nWhen all are one and one is all\r\nTo be a rock and not to roll.\r\n\r\nAnd she\'s buying a stairway to heaven.', '8:03', 'https://www.youtube.com/embed/iXQUu5Dti4g'),
(18, 6, 'When the Levee Breaks', 'If it keeps on rainin\', levee\'s goin\' to break\r\nIf it keeps on rainin\', levee\'s goin\' to break\r\nWhen the levee breaks I\'ll have no place to stay\r\n\r\nMean old levee taught me to weep and moan\r\nMean old levee taught me to weep and moan\r\nIt\'s got what it takes to make a mountain man leave his home\r\nOh, well, oh, well, oh, well\r\n\r\nDon\'t it make you feel bad\r\nWhen you\'re tryin\' to find your way home\r\nYou don\'t know which way to go?\r\nIf you\'re goin\' down South\r\nThey got no work to do,\r\nIf you don\'t know about Chicago\r\n\r\nCryin\' won\'t help you, prayin\' won\'t do you no good\r\nNow, cryin\' won\'t help you, prayin\' won\'t do you no good\r\nWhen the levee breaks, mama, you got to move\r\n\r\nAll last night sat on the levee and moaned\r\nAll last night sat on the levee and moaned\r\nThinkin\' about my baby and my happy home\r\n\r\nGoing, going to Chicago...\r\nGoing to Chicago...\r\nSorry but I can\'t take you...\r\nGoing down... going down now... going down....', '7:09', 'https://www.youtube.com/embed/FFDYuO53BUk'),
(19, 7, 'Limelight', 'Living on a lighted stage\r\nApproaches the unreal\r\nFor those who think and feel\r\nIn touch with some reality\r\nBeyond the gilded cage\r\n\r\nCast in this unlikely role\r\nIll-equipped to act\r\nWith insufficient tact\r\nOne must put up barriers\r\nTo keep oneself intact\r\n\r\nLiving in the limelight\r\nThe universal dream\r\nFor those who wish to seem\r\nThose who wish to be\r\nMust put aside the alienation\r\nGet on with the fascination\r\nThe real relation\r\nThe underlying theme\r\n\r\nLiving in a fish eye lens\r\nCaught in the camera eye\r\nI have no heart to lie\r\nI can\'t pretend a stranger\r\nIs a long-awaited friend\r\n\r\nAll the world\'s indeed a stage\r\nAnd we are merely players\r\nPerformers and portrayers\r\nEach another\'s audience\r\nOutside the gilded cage\r\n\r\nLiving in the limelight\r\nThe universal dream\r\nFor those who wish to seem\r\nThose who wish to be\r\nMust put aside the alienation\r\nGet on with the fascination\r\nThe real relation\r\nThe underlying theme', '4:20', 'https://www.youtube.com/embed/tgj2br-teu4'),
(20, 7, 'Red Barchetta', 'My uncle has a country place\r\nThat no one knows about\r\nHe says it used to be a farm\r\nBefore the Motor Law\r\nAnd on Sundays I elude the eyes\r\nAnd hop the Turbine Freight\r\nTo far outside the Wire\r\nWhere my white-haired uncle waits\r\n\r\nJump to the ground\r\nAs the Turbo slows to cross the borderline\r\nRun like the wind\r\nAs excitement shivers up and down my spine\r\nDown in his barn\r\nMy uncle preserved for me an old machine\r\nFor fifty odd years\r\nTo keep it as new has been his dearest dream\r\n\r\nI strip away the old debris\r\nThat hides a shining car\r\nA brilliant red Barchetta\r\nFrom a better vanished time\r\nI fire up the willing engine\r\nResponding with a roar\r\nTires spitting gravel\r\nI commit my weekly crime\r\n\r\nWind\r\nIn my hair\r\nShifting and drifting\r\nMechanical music\r\nAdrenaline surge...\r\n\r\nWell-weathered leather\r\nHot metal and oil\r\nThe scented country air\r\nSunlight on chrome\r\nThe blur of the landscape\r\nEvery nerve aware\r\n\r\nSuddenly ahead of me\r\nAcross the mountainside\r\nA gleaming alloy air car\r\nShoots towards me, two lanes wide\r\nI spin around with shrieking tires\r\nTo run the deadly race\r\nGo screaming through the valley\r\nAs another joins the chase\r\n\r\nDrive like the wind\r\nStraining the limits of machine and man\r\nLaughing out loud with fear and hope\r\nI\'ve got a desperate plan\r\nAt the one-lane bridge\r\nI leave the giants stranded at the riverside\r\nRace back to the farm\r\nTo dream with my uncle at the fireside', '6:10', 'https://www.youtube.com/embed/gvcgST_n6Mg'),
(21, 7, 'Tom Sawyer', 'A modern day warrior\r\nMean, mean stride\r\nToday\'s Tom Sawyer\r\nMean, mean pride\r\n\r\nThough his mind is not for rent\r\nDon\'t put him down as arrogant\r\nHis reserve, a quiet defense\r\nRiding out the day\'s events\r\nThe river\r\n\r\nWhat you say about his company\r\nIs what you say about society\r\nCatch the mist, catch the myth\r\nCatch the mystery, catch the drift\r\n\r\nThe world is, the world is\r\nLove and life are deep\r\nMaybe as his skies are wide\r\n\r\nToday\'s Tom Sawyer\r\nHe gets high on you\r\nAnd the space he invades\r\nHe gets by on you\r\n\r\nNo his mind is not for rent\r\nTo any god or government\r\nAlways hopeful, yet discontent\r\nHe knows changes aren\'t permanent\r\nBut change is\r\n\r\nWhat you say about his company\r\nIs what you say about society\r\nCatch the witness, catch the wit\r\nCatch the spirit, catch the spit\r\n\r\nThe world is, the world is\r\nLove and life are deep\r\nMaybe as his eyes are wide\r\n\r\nExit the warrior\r\nToday\'s Tom Sawyer\r\nHe gets high on you\r\nAnd the energy you trade\r\nHe gets right on to the friction of the day', '4:37', 'https://www.youtube.com/embed/QJ4-9tAf9UQ'),
(22, 8, 'Creeping Death', 'Slaves\r\nHebrews born to serve, to the pharaoh\r\nHeed\r\nTo his every word, live in fear\r\nFaith\r\nOf the unknown one, the deliverer\r\nWait\r\nSomething must be done, four hundred years\r\n\r\nSo let it be written\r\nSo let it be done\r\nI\'m sent here by the chosen one\r\nSo let it be written\r\nSo let it be done\r\nTo kill the first born pharaoh son\r\nI\'m creeping death\r\n\r\nNow\r\nLet my people go, Land Of Goshen\r\nGo\r\nI will be with thee, bush of fire\r\nBlood\r\nRunning red and strong, down the Nile\r\nPlague\r\nDarkness three days long, hail to fire\r\n\r\nSo let it be written\r\nSo let it be done\r\nI\'m sent here by the chosen one\r\nSo let it be written\r\nSo let it be done\r\nTo kill the first born pharaoh son\r\nI\'m creeping death\r\n\r\nDie by my hand\r\nI creep across the land\r\nKilling first born man\r\n\r\nDie by my hand\r\nI creep across the land\r\nKilling first born man\r\n\r\nI\r\nRule the midnight air, the destroyer\r\nBorn\r\nI shall soon be there, deadly mass\r\nI\r\nCreep the steps and floor, final darkness\r\nBlood\r\nLamb\'s blood, painted door, I shall pass\r\n\r\nSo let it be written\r\nSo let it be done\r\nI\'m sent here by the chosen one\r\nSo let it be written\r\nSo let it be done\r\nTo kill the first born pharaoh son\r\nI\'m creeping death', '6:36', 'https://www.youtube.com/embed/xAOMEqMXiXI'),
(23, 8, 'Fade To Black', 'Life, it seems, will fade away\r\nDrifting further every day\r\nGetting lost within myself\r\nNothing matters, no one else\r\n\r\nI have lost the will to live\r\nSimply nothing more to give\r\nThere is nothing more for me\r\nNeed the end to set me free\r\n\r\nThings not what they used to be\r\nMissing one inside of me\r\nDeathly lost, this can\'t be real\r\nCannot stand this hell I feel\r\n\r\nEmptiness is filling me\r\nTo the point of agony\r\nGrowing darkness taking dawn\r\nI was me, but now he\'s gone\r\n\r\nNo one but me can save myself, but it\'s too late\r\nNow I can\'t think, think why I should even try\r\n\r\nYesterday seems as though it never existed\r\nDeath greets me warm, now I will just say goodbye', '6:57', 'https://www.youtube.com/embed/HdWw9SksiwQ'),
(24, 8, 'For Whom The Bell Tolls', 'Make his fight on the hill in the early day\r\nConstant chill deep inside\r\nShouting gun, on they run through the endless grey\r\nOn they fight, for they\'re right, yes, but who\'s to say?\r\nFor a hill, men would kill, why? They do not know\r\nStiffened wounds test their pride\r\nMen of five, still alive through the raging glow\r\nGone insane from the pain that they surely know\r\n\r\nFor whom the bell tolls\r\nTime marches on\r\nFor whom the bell tolls\r\n\r\nTake a look to the sky just before you die\r\nIt\'s the last time you will\r\nBlackened roar, massive roar, fills the crumbling sky\r\nShattered goal fills his soul with a ruthless cry\r\nStranger now, are his eyes, to this mystery\r\nHe hears the silence so loud\r\nCrack of dawn, all is gone except the will to be\r\nNow they see what will be, blinded eyes to see\r\n\r\nFor whom the bell tolls\r\nTime marches on\r\nFor whom the bell tolls', '5:10', 'https://www.youtube.com/embed/eeqGuaAl6Ic'),
(25, 9, 'Brain Damage', 'The lunatic is on the grass\r\nThe lunatic is on the grass\r\nRemembering games and daisy chains and laughs\r\nGot to keep the loonies on the path\r\n\r\nThe lunatic is in the hall\r\nThe lunatics are in my hall\r\nThe paper holds their folded faces to the floor\r\nAnd every day the paper boy brings more\r\n\r\nAnd if the dam breaks open many years too soon\r\nAnd if there is no room upon the hill\r\nAnd if your head explodes with dark forebodings too\r\nI\'ll see you on the dark side of the moon\r\n\r\nThe lunatic is in my head\r\nThe lunatic is in my head\r\nYou raise the blade, you make the change\r\nYou re-arrange me \'til I\'m sane\r\n\r\nYou lock the door and throw away the key\r\nThere\'s someone in my head but it\'s not me.\r\n\r\nAnd if the cloud bursts thunder in your ear\r\nYou shout and no one seems to hear\r\nAnd if the band you\'re in starts playing different tunes\r\nI\'ll see you on the dark side of the moon\r\n\r\nI can\'t think of anything to say except...\r\nI think it\'s marvelous! Ha, ha, ha!', '3:47', 'https://www.youtube.com/embed/BhYKN21olBw'),
(26, 9, 'Money', 'Money, get away\r\nGet a good job with more pay and you\'re O.K.\r\nMoney, it\'s a gas\r\nGrab that cash with both hands and make a stash\r\nNew car, caviar, four star daydream,\r\nThink I\'ll buy me a football team\r\n\r\nMoney, get back\r\nI\'m all right, Jack, keep your hands off of my stack.\r\nMoney, it\'s a hit\r\nDon\'t give me that do goody good bullshit\r\nI\'m in the high-fidelity first-class traveling set\r\nAnd I think I need a Learjet\r\n\r\nMoney, it\'s a crime\r\nShare it fairly but don\'t take a slice of my pie\r\nMoney, so they say\r\nIs the root of all evil today\r\nBut if you ask for a rise it\'s no surprise that they\'re giving none away\r\n\r\n\"Ha-ha! I was in the right!\"\r\n\"Yes, absolutely in the right!\"\r\n\"I certainly was in the right!\"\r\n\"Yeah, I was definitely in the right. That geezer was cruising for a bruising!\"\r\n\"Why does anyone do anything?\"\r\n\"Yeah!\"\r\n\"Why does anyone do anything?\"\r\n\"I don\'t know, I was really drunk at the time!\"\r\n\"I was just telling him it was in, he could get it in Number Two. He was asking why it wasn\'t coming up on freight eleven. After, I was yelling and screaming and telling him why it wasn\'t coming up on freight eleven. It came to a heavy blow, which sorted the matter out.\"', '6:23', 'https://www.youtube.com/embed/rwPM01cbQBc'),
(27, 9, 'Time', 'Ticking away the moments that make up a dull day\r\nFritter and waste the hours in an off-hand way\r\nKicking around on a piece of ground in your home town\r\nWaiting for someone or something to show you the way\r\n\r\nTired of lying in the sunshine staying home to watch the rain\r\nYou are young and life is long and there is time to kill today\r\nAnd then one day you find ten years have got behind you\r\nNo one told you when to run, you missed the starting gun\r\n\r\nAnd you run and you run to catch up with the sun but it\'s sinking\r\nRacing around to come up behind you again\r\nThe sun is the same in a relative way, but you\'re older\r\nShorter of breath and one day closer to death\r\n\r\nEvery year is getting shorter, never seem to find the time\r\nPlans that either come to naught or half a page of scribbled lines\r\nHanging on in quiet desperation is the English way\r\nThe time is gone, the song is over, thought I\'d something more to say\r\n\r\nHome, home again\r\nI like to be here when I can\r\nWhen I come home cold and tired\r\nIt\'s good to warm my bones beside the fire\r\nFar away, across the field\r\nThe tolling of the iron bell\r\nCalls the faithful to their knees\r\nTo hear the softly spoken magic spell', '6:54', 'https://www.youtube.com/embed/pgXozIma-Oc'),
(28, 10, 'Comfortably Numb', 'Hello\r\nIs there anybody in there?\r\nJust nod if you can hear me\r\nIs there anyone at home?\r\n\r\nCome on now\r\nI hear you\'re feeling down\r\nWell, I can ease your pain\r\nAnd get you on your feet again\r\n\r\nRelax\r\nI\'ll need some information first\r\nJust the basic facts\r\nCan you show me where it hurts?\r\n\r\nThere is no pain, you are receding\r\nA distant ship smoke on the horizon\r\nYou are only coming through in waves\r\nYour lips move but I can\'t hear what you\'re saying\r\nWhen I was a child I had a fever\r\nMy hands felt just like two balloons\r\nNow I\'ve got that feeling once again\r\nI can\'t explain, you would not understand\r\nThis is not how I am\r\nI have become comfortably numb\r\n\r\nI have become comfortably numb\r\n\r\nO.K.\r\nJust a little pin prick\r\nThere\'ll be no more aaaaaaaah!\r\nBut you may feel a little sick\r\n\r\nCan you stand up?\r\nI do believe it\'s working, good\r\nThat\'ll keep you going through the show\r\nCome on, it\'s time to go\r\n\r\nThere is no pain you are receding\r\nA distant ship smoke on the horizon\r\nYou are only coming through in waves\r\nYour lips move but I can\'t hear what you\'re saying\r\nWhen I was a child\r\nI caught a fleeting glimpse\r\nOut of the corner of my eye\r\nI turned to look but it was gone\r\nI cannot put my finger on it now\r\nThe child is grown\r\nThe dream is gone\r\nI have become comfortably numb', '6:22', 'https://www.youtube.com/embed/x-xTttimcNk'),
(29, 10, 'Hey You', 'Hey, you!\r\nOut there in the cold\r\nGetting lonely, getting old.\r\nCan you feel me?\r\n\r\nHey, you!\r\nStanding in the aisles\r\nWith itchy feet and fading smiles.\r\nCan you feel me?\r\n\r\nHey, you!\r\nDon\'t help them to bury the light.\r\nDon\'t give in without a fight.\r\n\r\nHey, you!\r\nOut there on your own\r\nSitting naked by the phone.\r\nWould you touch me?\r\n\r\nHey, you!\r\nWith your ear against the wall\r\nWaiting for someone to call out.\r\nWould you touch me?\r\n\r\nHey, you!\r\nWould you help me to carry the stone?\r\nOpen your heart, I\'m coming home\r\n\r\nBut it was only fantasy.\r\nThe wall was too high as you can see.\r\nNo matter how he tried he could not break free.\r\nAnd the worms ate into his brain.\r\n\r\nHey, you!\r\nOut there on the road,\r\nAlways doing what you\'re told.\r\nCan you help me?\r\n\r\nHey, you!\r\nOut there beyond the wall,\r\nBreaking bottles in the hall.\r\nCan you help me?\r\n\r\nHey, you!\r\nDon\'t tell me there\'s no hope at all.\r\nTogether we stand,\r\nDivided we fall.', '4:38', 'https://www.youtube.com/embed/soL8JK6kALc'),
(30, 10, 'Mother', 'Mother, do you think they\'ll drop the bomb?\r\nMother, do you think they\'ll like this song?\r\nMother, do you think they\'ll try to break my balls?\r\nOoh, aah, mother, should I build the wall?\r\n\r\nMother, should I run for president?\r\nMother, should I trust the government?\r\nMother, will they put me in the firing line?\r\nOoh, aah, is it just a waste of time?\r\n\r\nHush now, baby, baby, don\'t you cry\r\nMama\'s gonna make all of your nightmares come true\r\nMama\'s gonna put all of her fears into you\r\nMama\'s gonna keep you right here under her wing\r\nShe won\'t let you fly but she might let you sing\r\nMama\'s gonna keep baby cozy and warm\r\n\r\nOoh, babe, ooh, babe, ooh, babe\r\nOf course mama\'s gonna help build the wall\r\n\r\nMother, do you think she\'s good enough for me?\r\nMother, do you think she\'s dangerous to me?\r\nMother, will she tear your little boy apart?\r\nOoh, aah, mother, will she break my heart?\r\n\r\nHush now, baby, baby, don\'t you cry\r\nMama\'s gonna check out all your girlfriends for you\r\nMama won\'t let anyone dirty get through\r\nMama\'s gonna wait up \'til you get in\r\nMama will always find out where you\'ve been\r\nMamma\'s gonna keep baby healthy and clean\r\n\r\nOoh, babe, ooh, babe, ooh, babe\r\nYou\'ll always be a baby to me\r\n\r\nMother, did it need to be so high?', '5:35', 'https://www.youtube.com/embed/xe3NUKCnZp4'),
(31, 11, 'Ain\'t Talkin\' \'Bout Love', 'I heard the news baby, all about your disease\r\nYeah you may have all you want, baby, but I got somethin\' you need\r\nOh yeah, ain\'t talkin\' \'bout love\r\nMy love is rotten to the core\r\nAin\'t talkin\' \'bout love\r\nJust like I told you before, yeah before\r\nYou know you\'re semi-good lookin\', and on the streets again\r\nOh yeah you think you\'re really cookin\' baby, you better find yourself a friend\r\nMy friend, ain\'t talkin\' \'bout love\r\nMy love is rotten to the core\r\nAin\'t talkin\' \'bout love\r\nJust like I told you before, uh before, uh before, before\r\nAin\'t talkin\' \'bout love\r\nBabe it\'s rotten to the core\r\nAin\'t talkin\' \'bout love\r\nJust like I told you before, uh before\r\nI been to the edge, an\' there I stood an\' looked down\r\nYou know I lost a lot of friends there baby, I got no time to mess around\r\nMmmm, so if you want it got to bleed for it baby\r\nYeah, got to got to bleed baby\r\nMmmm, you got to got to bleed baby\r\nHey, got to got to bleed baby\r\nAin\'t talkin\' \'bout love\r\nMy love is rotten to the core\r\nAin\'t talkin\' \'bout love\r\nJust like I told you before, before, before\r\nAin\'t talkin\' \'bout love\r\nDon\'t wanna talk about love\r\nDon\'t need to talk about love\r\nAin\'t gonna talk about love, no more, no more, ah\r\nHey Hey Hey\r\nHey Hey Hey', '3:48', 'https://www.youtube.com/embed/qtwBFz6lfrY'),
(32, 11, 'Eruption', 'Instrumental', '1:42', 'https://www.youtube.com/embed/M4Czx8EWXb0'),
(33, 11, 'Runnin\' with the Devil', 'I live my life like there\'s no tomorrow\r\nAnd all I\'ve got I had to steal\r\nLeast I don\'t need to beg or borrow\r\nYes, I\'m living at a pace that kills\r\n\r\nRunnin\' with the devil\r\nRunnin\' with the devil\r\nI\'ll tell y\'all about it\r\n\r\nI found the simple life ain\'t so simple\r\nWhen I jumped out on that road\r\nI got no love, no love you\'d call real\r\nAin\'t got nobody waiting at home\r\n\r\nRunnin\' with the devil\r\nGod damn it lady, you know I ain\'t lying to ya\r\nI\'m wanna tell you one time\r\nAah-yeah\r\nRunning with the devil\r\nYes I am\r\nYeah\r\n\r\nWoo\r\nWoo\r\n\r\nYou know I, I found the simple life, weren\'t so simple, no\r\nWhen I jumped out on that road\r\nGot no love, no love you\'d call real\r\nGot nobody waiting at home\r\n\r\nRunnin\' with the devil\r\nRunnin\' with the devil\r\n\r\nRunnin\' with the devil\r\nRunnin\' with the devil', '3:35', 'https://www.youtube.com/embed/KLRO4W9pNrQ');

-- --------------------------------------------------------

--
-- Table structure for table `user_data`
--

CREATE TABLE `user_data` (
  `username` varchar(50) CHARACTER SET latin1 NOT NULL,
  `password` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `email` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `first_name` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `last_name` varchar(50) CHARACTER SET latin1 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_data`
--

INSERT INTO `user_data` (`username`, `password`, `email`, `first_name`, `last_name`) VALUES
('agostagec', 'vcwMxo6wrZm', 'agostagec@github.com', 'Alysa', 'Gostage'),
('askirvin2', '9aYuMJn7EvP', 'askirvin2@pinterest.com', 'Ado', 'Skirvin'),
('bgalej', 'PQNekVFOx', 'bgalej@typepad.com', 'Boonie', 'Gale'),
('bkrysztowczyk6', 'fKMJgYRt', 'bkrysztowczyk6@bloomberg.com', 'Belva', 'Krysztowczyk'),
('brosetti1', 'QPXwCJPkK', 'brosetti1@redcross.org', 'Berkley', 'Rosetti'),
('cdencsf', 'ACH9aNIOibI', 'cdencsf@archive.org', 'Cammie', 'Dencs'),
('cranson7', 'PxnQv9K2', 'cranson7@cdc.gov', 'Clementina', 'Ranson'),
('emertinm', 'DEBrFpo', 'emertinm@spotify.com', 'Enrika', 'Mertin'),
('esibyllina8', 'qyInpvil', 'esibyllina8@yelp.com', 'Edee', 'Sibyllina'),
('fspoerle', 'm9Biv8Id', 'fspoerle@rakuten.co.jp', 'Felice', 'Spoerl'),
('fubsdelll', 'iAhvpTe', 'fubsdelll@hugedomains.com', 'Fanchon', 'Ubsdell'),
('ikolakovic5', 'IHpEUB', 'ikolakovic5@hp.com', 'Ingunna', 'Kolakovic'),
('kjewesi', 'pZoqUc5u2XxD', 'kjewesi@skype.com', 'Kahlil', 'Jewes'),
('lgiacomia', 'H0T2L0ee', 'lgiacomia@xing.com', 'Livvie', 'Giacomi'),
('mbrinsford3', '4pY0MEWg', 'mbrinsford3@prnewswire.com', 'Matty', 'Brinsford'),
('mfleming9', 'KJb2IqaUt', 'mfleming9@businessinsider.com', 'Mead', 'Fleming'),
('mkipping0', 'Nr0Y1a0plGSP', 'mkipping0@dot.gov', 'Melina', 'Kipping'),
('mmerrimang', '9wJG2G9Pfd', 'mmerrimang@japanpost.jp', 'Micky', 'Merriman'),
('nmellanby4', 'qRQ3njySDaK', 'nmellanby4@ucoz.com', 'Nata', 'Mellanby'),
('oshufflebothamh', 'BhW5FQsyiZUk', 'oshufflebothamh@hibu.com', 'Osbourn', 'Shufflebotham'),
('pacoh', 'admin123', 'nice@mail.bro', 'Paco', 'Hung'),
('rheathcotek', '4pfmseiu', 'rheathcotek@people.com.cn', 'Robbert', 'Heathcote'),
('sseerd', 'rB6UUODR', 'sseerd@google.com', 'Shepherd', 'Seer'),
('wdoylyn', 'CTmsu9S', 'wdoylyn@microsoft.com', 'William', 'D\'Oyly'),
('wtweedeb', 'uaKiuXuBnA', 'wtweedeb@sogou.com', 'Wynn', 'Tweede');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `albums`
--
ALTER TABLE `albums`
  ADD PRIMARY KEY (`id`),
  ADD KEY `artist_id` (`artist_id`),
  ADD KEY `genre_id` (`genre_id`);

--
-- Indexes for table `artists`
--
ALTER TABLE `artists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `genres`
--
ALTER TABLE `genres`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `songs`
--
ALTER TABLE `songs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `album_id` (`album_id`);

--
-- Indexes for table `user_data`
--
ALTER TABLE `user_data`
  ADD PRIMARY KEY (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `albums`
--
ALTER TABLE `albums`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `songs`
--
ALTER TABLE `songs`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `albums`
--
ALTER TABLE `albums`
  ADD CONSTRAINT `albums_ibfk_1` FOREIGN KEY (`artist_id`) REFERENCES `artists` (`id`),
  ADD CONSTRAINT `albums_ibfk_2` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`id`);

--
-- Constraints for table `songs`
--
ALTER TABLE `songs`
  ADD CONSTRAINT `songs_ibfk_1` FOREIGN KEY (`album_id`) REFERENCES `albums` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
