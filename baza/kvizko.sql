﻿-- Script was generated by Devart dbForge Studio for MySQL, Version 6.0.622.0
-- Product home page: http://www.devart.com/dbforge/mysql/studio
-- Script date 02-Jan-16 4:53:53 PM
-- Server version: 5.6.26
-- Client version: 4.1

USE kvizko;

CREATE TABLE questions (,
  PRIMARY KEY (id)
  CONSTRAINT FK_questions_quiz_id FOREIGN KEY (quiz_id)
    REFERENCES quiz(id) ON DELETE RESTRICT ON UPDATE RESTRICT
)
ENGINE = INNODB
AUTO_INCREMENT = 14
AVG_ROW_LENGTH = 1820
CHARACTER SET latin1
COLLATE latin1_swedish_ci;

CREATE TABLE student (
  id int(11) NOT NULL AUTO_INCREMENT,
  name varchar(50) NOT NULL,
  lastname varchar(50) NOT NULL,
  pwd varchar(150) NOT NULL,
  email varchar(50) NOT NULL,
  points int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (id)
)
ENGINE = INNODB
AUTO_INCREMENT = 6
AVG_ROW_LENGTH = 4096
CHARACTER SET latin1
COLLATE latin1_swedish_ci;

CREATE TABLE teacher (
  id int(11) NOT NULL AUTO_INCREMENT,
  name varchar(50) NOT NULL,
  lastname varchar(50) NOT NULL,
  email varchar(50) NOT NULL,
  pwd varchar(150) NOT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB
AUTO_INCREMENT = 4
AVG_ROW_LENGTH = 8192
CHARACTER SET latin1
COLLATE latin1_swedish_ci;

CREATE TABLE quiz (
  id int(11) NOT NULL AUTO_INCREMENT,
  name varchar(50) NOT NULL,
  teacher_id int(11) NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT FK_quiz_teacher_id FOREIGN KEY (teacher_id)
  REFERENCES teacher (id) ON DELETE RESTRICT ON UPDATE RESTRICT
)
ENGINE = INNODB
AUTO_INCREMENT = 17
AVG_ROW_LENGTH = 1365
CHARACTER SET latin1
COLLATE latin1_swedish_ci;

CREATE TABLE student_questions (
  student_id int(11) NOT NULL,
  question_id int(11) NOT NULL,
  PRIMARY KEY (question_id, student_id),
  CONSTRAINT FK_student_questions_questions_id FOREIGN KEY (question_id)
  REFERENCES questions (id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT FK_student_questions_student_id FOREIGN KEY (student_id)
  REFERENCES student (id) ON DELETE CASCADE ON UPDATE CASCADE
)
ENGINE = INNODB
AVG_ROW_LENGTH = 2730
CHARACTER SET latin1
COLLATE latin1_swedish_ci;