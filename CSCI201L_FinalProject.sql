DROP DATABASE IF EXISTS CSCI201L_FinalProject;

CREATE DATABASE CSCI201L_FinalProject;
USE CSCI201L_FinalProject;

CREATE TABLE Users (
	userID INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    email VARCHAR(45) NOT NULL,
    passHash VARCHAR(45) NOT NULL,
    fname VARCHAR(45),
    lname VARCHAR(45),
    phone VARCHAR(45),
    profilepic VARCHAR(45),
    gradyear int(4),
    major VARCHAR(45)
);

CREATE TABLE Activities (
	activityID INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    userID INT(11) NOT NULL,
    title VARCHAR(45),
    description VARCHAR(45),
    lat FLOAT(8,4),
    lon FLOAT(8,4),
    startDate VARCHAR(8),
    startTime VARCHAR(6),
    endDate VARCHAR(8),
    endTime VARCHAR(6),
    timeCreated VARCHAR(14),
    picture VARCHAR(45),
    FOREIGN KEY(userID) REFERENCES Users(userID)
);

CREATE TABLE Comments (
	commentID INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    userID INT(11) NOT NULL,
    activityID INT(11) NOT NULL,
    content VARCHAR(200),
    timeCreated VARCHAR(14),
    FOREIGN KEY(userID) REFERENCES Users(userID),
    FOREIGN KEY(activityID) REFERENCES Activities(activityID)
);