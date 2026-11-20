#create database f1_project;
use f1_project;
DROP TABLE IF EXISTS pit_stops;
DROP TABLE IF EXISTS results;
DROP TABLE IF EXISTS races;
DROP TABLE IF EXISTS drivers;
DROP TABLE IF EXISTS constructors;

CREATE TABLE constructors (
    constructorId INT PRIMARY KEY,
    constructorRef VARCHAR(50) NOT NULL,
    name VARCHAR(100) NOT NULL,
    nationality VARCHAR(50),
    url VARCHAR(255)
);

CREATE TABLE drivers (
    driverId INT PRIMARY KEY,
    driverRef VARCHAR(50) NOT NULL,
    number INT NULL,              -- Restored to INT
    code VARCHAR(10) NULL,
    forename VARCHAR(50) NOT NULL,
    surname VARCHAR(50) NOT NULL,
    dob DATE NULL,                -- Restored to DATE
    nationality VARCHAR(50),
    url VARCHAR(255)
);

CREATE TABLE races (
    raceId INT PRIMARY KEY,
    year INT NOT NULL,
    round INT NOT NULL,
    circuitId INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    date DATE NOT NULL,
    time TIME NULL,               -- Restored to TIME
    url VARCHAR(255),
    fp1_date VARCHAR(20) NULL,
    fp1_time VARCHAR(20) NULL,
    fp2_date VARCHAR(20) NULL,
    fp2_time VARCHAR(20) NULL,
    fp3_date VARCHAR(20) NULL,
    fp3_time VARCHAR(20) NULL,
    quali_date VARCHAR(20) NULL,
    quali_time VARCHAR(20) NULL,
    sprint_date VARCHAR(20) NULL,
    sprint_time VARCHAR(20) NULL
);

CREATE TABLE results (
    resultId INT PRIMARY KEY,
    raceId INT NOT NULL,
    driverId INT NOT NULL,
    constructorId INT NOT NULL,
    number INT NULL,               -- Restored to INT
    grid INT NOT NULL,
    position INT NULL,             -- Restored to INT (Safe, only holds numbers or NULL)
    positionText VARCHAR(10) NOT NULL, -- Holds the 'R' and 'D' values
    positionOrder INT NOT NULL,
    points DECIMAL(5,2) NOT NULL,
    laps INT NOT NULL,
    time VARCHAR(50) NULL,
    milliseconds INT NULL,         -- Restored to INT
    fastestLap INT NULL,           -- Restored to INT
    `rank` INT NULL,               -- Restored to INT
    fastestLapTime VARCHAR(20) NULL,
    fastestLapSpeed DECIMAL(6,3) NULL, -- Restored to DECIMAL
    statusId INT NOT NULL,
    FOREIGN KEY (raceId) REFERENCES races(raceId),
    FOREIGN KEY (driverId) REFERENCES drivers(driverId),
    FOREIGN KEY (constructorId) REFERENCES constructors(constructorId)
);

CREATE TABLE pit_stops (
    raceId INT NOT NULL,
    driverId INT NOT NULL,
    stop INT NOT NULL,
    lap INT NOT NULL,
    time VARCHAR(20) NULL,
    duration VARCHAR(20) NULL,     -- Kept as VARCHAR due to formatting like "1:22.413"
    milliseconds INT NULL,         -- Restored to INT
    FOREIGN KEY (raceId) REFERENCES races(raceId),
    FOREIGN KEY (driverId) REFERENCES drivers(driverId)
);