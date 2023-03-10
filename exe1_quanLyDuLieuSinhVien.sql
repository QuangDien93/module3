create database student_management;

use `student_management`;
create table `student`(
`id` INT NOT NULL PRIMARY KEY,
`name` VARCHAR(45) NULL,
`age` INT NULL,
`country` VARCHAR(45)
);
create table `class`(
`id` INT NOT NULL PRIMARY KEY,
`name` VARCHAR(45) NULL
);
create table `teacher`(
`id` INT NOT NULL PRIMARY KEY,
`name` VARCHAR(45) NULL,
`age` INT NULL,
`country` VARCHAR(45)
);

