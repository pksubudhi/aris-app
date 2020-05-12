CREATE TABLE `Patient` (
  `patientID` int,
  `firstName` varchar(50),
  `lastName` varchar(50),
  `email` varchar(50),
  `username` varchar(50),
  `password` varchar(50),
  `address` varchar(50),
  `injuryDesc` varchar(50),
  `height` int,
  `weight` int,
  `age` int,
  PRIMARY KEY (`patientID`)
);

CREATE TABLE `Device (Rehab)` (
  `deviceID` int,
  `Device_Name` varchar(50),
  `Model_Number` int,
  `appliedWeight` int,
  `force` int,
  `weightLimit` int,
  `limitCrossed` bool,
  PRIMARY KEY (`deviceID`)
);

CREATE TABLE `Injury` (
  `patientID` int,
  `clinicID` int,
  `injuryDesc` varchar(50),
  `progress` int,
  KEY `PK, FK` (`patientID`, `clinicID`),
  KEY `FK` (`injuryDesc`)
);

CREATE TABLE `Clinic` (
  `clinicID` int,
  `doctor` varchar(50),
  `address` varchar(50),
  PRIMARY KEY (`clinicID`)
);

