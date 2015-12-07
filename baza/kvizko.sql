-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 07, 2015 at 06:45 PM
-- Server version: 5.6.26
-- PHP Version: 5.5.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kvizko`
--

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE IF NOT EXISTS `questions` (
  `id` int(11) NOT NULL,
  `question` varchar(400) DEFAULT NULL,
  `a` varchar(100) DEFAULT NULL,
  `b` varchar(100) DEFAULT NULL,
  `c` varchar(100) DEFAULT NULL,
  `answer` varchar(100) NOT NULL,
  `d` varchar(100) DEFAULT NULL,
  `quiz_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `question`, `a`, `b`, `c`, `answer`, `d`, `quiz_id`) VALUES
(5, 'Q1', NULL, NULL, NULL, 'ans', NULL, 3),
(6, 'Q2', NULL, NULL, NULL, 'ans', NULL, 5),
(7, 'Q3', 'a', 'b', 'c', 'a', 'd', 3),
(8, 'Q4', NULL, NULL, NULL, 'w', NULL, 6),
(9, 'Q5', NULL, NULL, NULL, 're', NULL, 6),
(10, 'h', NULL, NULL, NULL, '10', NULL, 5),
(11, 'how are you', NULL, NULL, NULL, '10', NULL, 5),
(12, 'how are you!', NULL, NULL, NULL, '10', NULL, 5),
(13, 'how ar,e you!', NULL, NULL, NULL, '10', NULL, 5);

-- --------------------------------------------------------

--
-- Table structure for table `quiz`
--

CREATE TABLE IF NOT EXISTS `quiz` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `teacher_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `quiz`
--

INSERT INTO `quiz` (`id`, `name`, `teacher_id`) VALUES
(3, 'Kviz1', 1),
(5, 'Kviz2', 1),
(6, 'Kviz3', 2),
(8, 'SuperQuiz', 2),
(9, 'SuperQuiz', 2),
(10, 'SuperQuiz', 2),
(11, 'SuperQuiz', 2),
(12, 'SuperQuiz', 2),
(13, 'SuperQuiz', 2),
(14, 'SuperQuiz', 2),
(15, 'SuperQuiz', 2),
(16, 'SuperQuiz23', 2);

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE IF NOT EXISTS `student` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `pwd` varchar(150) NOT NULL,
  `email` varchar(50) NOT NULL,
  `points` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`id`, `name`, `lastname`, `pwd`, `email`, `points`) VALUES
(1, 'Matej', 'Mohar', '1111', 'matej@mohar.com', 0),
(2, 'Nejc', 'Gutnik', '2222', 'nejc@gutnik.com', 0),
(3, 'Ales', 'Polajnar', '3333', 'ales@polajnar.com', 0),
(4, 'Ekaterina', 'Ivanova', '4444', 'ekaterina@ivanova.com', 0),
(5, 'name', 'lastname', '3c9909afec25354d551dae21590bb26e38d53f2173b8d3dc3eee4c047e7ab1c1eb8b85103e3be7ba613b31bb5c9c36214dc9f14a42fd7a2fdb84856bca5c44c2', 'e@e.com', 0);

-- --------------------------------------------------------

--
-- Table structure for table `student_questions`
--

CREATE TABLE IF NOT EXISTS `student_questions` (
  `student_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student_questions`
--

INSERT INTO `student_questions` (`student_id`, `question_id`) VALUES
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(2, 6),
(4, 7);

-- --------------------------------------------------------

--
-- Table structure for table `teacher`
--

CREATE TABLE IF NOT EXISTS `teacher` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `pwd` varchar(150) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `teacher`
--

INSERT INTO `teacher` (`id`, `name`, `lastname`, `email`, `pwd`) VALUES
(1, 'Ursa', 'Novak', 'ursa@nova.com', '1123'),
(2, 'Bojan', 'Ribak', 'bojan@ribak.com', '233333'),
(3, 'name', 'lastname', 'e@e.com', '3c9909afec25354d551dae21590bb26e38d53f2173b8d3dc3eee4c047e7ab1c1eb8b85103e3be7ba613b31bb5c9c36214dc9f14a42fd7a2fdb84856bca5c44c2');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_questions_quiz_id` (`quiz_id`);

--
-- Indexes for table `quiz`
--
ALTER TABLE `quiz`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_quiz_teacher_id` (`teacher_id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_questions`
--
ALTER TABLE `student_questions`
  ADD PRIMARY KEY (`question_id`,`student_id`),
  ADD KEY `FK_student_questions_student_id` (`student_id`);

--
-- Indexes for table `teacher`
--
ALTER TABLE `teacher`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `quiz`
--
ALTER TABLE `quiz`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `teacher`
--
ALTER TABLE `teacher`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `FK_questions_quiz_id` FOREIGN KEY (`quiz_id`) REFERENCES `quiz` (`id`);

--
-- Constraints for table `quiz`
--
ALTER TABLE `quiz`
  ADD CONSTRAINT `FK_quiz_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`id`);

--
-- Constraints for table `student_questions`
--
ALTER TABLE `student_questions`
  ADD CONSTRAINT `FK_student_questions_questions_id` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_student_questions_student_id` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
