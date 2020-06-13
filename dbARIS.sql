CREATE TABLE `Device (Rehab)` (
  `deviceID` int,
  `Device_Name` varchar(50),
  `Model_Number` int,
  `appliedWeight` int,
  `force` int,
  `weightLimit` int,
  `limitCrossed` bool,
  `leftSock` bool,
  `rightSock` bool,
  PRIMARY KEY (`deviceID`)
);

CREATE TABLE `Patient` (
  `patientID` int,
  `firstName` varchar(50),
  `lastName` varchar(50),
  `email` varchar(50),
  `username` varchar(50),
  `password` varchar(50),
  `street` varchar(50),
  `city` varchar(50),
  `postalCode` varchar(10),
  `injuryDesc` varchar(50),
  `height` int,
  `weight` int,
  `age` int,
  `gender` varchar(10),
  `org` varchar(50),
  PRIMARY KEY (`patientID`)
);

CREATE TABLE `Organization` (
  `orgID` int,
  `doctor` varchar(50),
  `street` varchar(50),
  `city` varchar(50),
  `postalCode` varchar(10),
  PRIMARY KEY (`orgID`)
);

CREATE TABLE `Injury` (
  `patientID` int,
  `orgID` int,
  `injuryDesc` varchar(50),
  `progress` int,
  KEY `PK, FK` (`patientID`, `orgID`),
  KEY `FK` (`injuryDesc`)
);


