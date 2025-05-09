CREATE TABLE person (
    personId INT PRIMARY KEY,
    cellNumber VARCHAR(15),
    primaryNumber VARCHAR(15),
    city VARCHAR(50),
    state VARCHAR(50),
    zip VARCHAR(10),
    dob DATE,
    gender VARCHAR(10),
    fName VARCHAR(50),
    lName VARCHAR(50)
);

CREATE TABLE membership (
    membershipId INT PRIMARY KEY,
    personId INT,
    membershipType VARCHAR(50),
    startDate DATE,
    endDate DATE,
    status VARCHAR(20),
    FOREIGN KEY (personId) REFERENCES person(personId)
);

CREATE TABLE facility (
    facilityId INT PRIMARY KEY,
    name VARCHAR(100),
    locationDesc TEXT,
    type VARCHAR(50)
);

CREATE TABLE staff (
    staffId INT PRIMARY KEY,
    role VARCHAR(50),
    fName VARCHAR(50),
    lName VARCHAR(50),
    email VARCHAR(100),
    extension VARCHAR(10)
);

CREATE TABLE works (
    facilityId INT,
    staffId INT,
    startDate DATE,
	roleAtFacility  VARCHAR(60)  NOT NULL,
    endDate DATE,
    PRIMARY KEY (facilityId, staffId),
    FOREIGN KEY (facilityId) REFERENCES facility(facilityId),
    FOREIGN KEY (staffId) REFERENCES staff(staffId)
);

CREATE TABLE booking (
    bookingId INT PRIMARY KEY,
    personId INT,
    facilityId INT,
    date DATE,
    time TIME,
    bookingStatus VARCHAR(20),
    FOREIGN KEY (personId) REFERENCES person(personId),
    FOREIGN KEY (facilityId) REFERENCES facility(facilityId)
);

CREATE TABLE payment (
    transactionId INT PRIMARY KEY,
    personId INT,
    amount DECIMAL(10,2),
    paymentMethod VARCHAR(50),
    FOREIGN KEY (personId) REFERENCES person(personId)
);

CREATE TABLE donation (
    transactionId INT PRIMARY KEY,
    campaign VARCHAR(100),
    donationType VARCHAR(50),
    FOREIGN KEY (transactionId) REFERENCES payment(transactionId)
);

CREATE TABLE program (
    programId INT PRIMARY KEY,
    programType ENUM('SPORTS', 'LESSON', 'COURSE', 'FITNESS'),
    title VARCHAR(100),
    description TEXT,
    minAge INT,
    maxAge INT,
    defaultMemberPrice DECIMAL(10,2),
    defaultNonmemberPrice DECIMAL(10,2)
);

CREATE TABLE sports_segment (
    segmentId INT PRIMARY KEY,
    programId INT,
    segmentDate DATE,
    startTs TIME,
    endTs TIME,
    capacity INT,
    memberPrice DECIMAL(10,2),
    nonmemberPrice DECIMAL(10,2),
    FOREIGN KEY (programId) REFERENCES program(programId)
);

CREATE TABLE sports_registration (
    paymentId INT,
    personId INT,
    segmentId INT,
    registeredTs TIMESTAMP,
    PRIMARY KEY (personId, segmentId),
    FOREIGN KEY (personId) REFERENCES person(personId),
    FOREIGN KEY (segmentId) REFERENCES sports_segment(segmentId)
);

CREATE TABLE lesson_package (
    packageId INT PRIMARY KEY,
    programId INT,
    numSessions INT,
    memberPrice DECIMAL(10,2),
    nonmemberPrice DECIMAL(10,2),
    FOREIGN KEY (programId) REFERENCES program(programId)
);

CREATE TABLE lesson_registration (
    paymentId INT,
    personId INT,
    packageId INT,
    registeredTs TIMESTAMP,
    PRIMARY KEY (personId, packageId),
    FOREIGN KEY (personId) REFERENCES person(personId),
    FOREIGN KEY (packageId) REFERENCES lesson_package(packageId)
);

CREATE TABLE course_session (
    courseSessionId INT PRIMARY KEY,
    programId INT,
    sessionDate DATE,
    startTs TIME,
    endTs TIME,
    capacity INT,
    FOREIGN KEY (programId) REFERENCES program(programId)
);

CREATE TABLE course_registration (
    paymentId INT,
    personId INT,
    courseSessionId INT,
    registeredTs TIMESTAMP,
    PRIMARY KEY (personId, courseSessionId),
    FOREIGN KEY (personId) REFERENCES person(personId),
    FOREIGN KEY (courseSessionId) REFERENCES course_session(courseSessionId)
);

CREATE TABLE fitness_session (
    fitnessSessionId INT PRIMARY KEY,
    programId INT,
    sessionDate DATE,
    startTs TIME,
    endTs TIME,
    capacity INT,
    description TEXT,
    FOREIGN KEY (programId) REFERENCES program(programId)
);

CREATE TABLE fitness_registration (
    paymentId INT,
    personId INT,
    fitnessSessionId INT,
    registeredTs TIMESTAMP,
    PRIMARY KEY (personId, fitnessSessionId),
    FOREIGN KEY (personId) REFERENCES person(personId),
    FOREIGN KEY (fitnessSessionId) REFERENCES fitness_session(fitnessSessionId)
);

CREATE TABLE session_staff (
    staffId INT,
    courseSessionId INT,
    PRIMARY KEY (staffId, courseSessionId),
    FOREIGN KEY (staffId) REFERENCES staff(staffId),
    FOREIGN KEY (courseSessionId) REFERENCES course_session(courseSessionId)
);

CREATE TABLE volunteer (
    volunteerId INT PRIMARY KEY,
    ssn VARCHAR(20),
    fName VARCHAR(50),
    mName VARCHAR(50),
    lName VARCHAR(50),
    phone VARCHAR(20),
    city VARCHAR(50),
    state VARCHAR(50),
    zip VARCHAR(10),
    dateOfAppointment DATE,
    skills TEXT,
    employment VARCHAR(50),
    activeFlag BOOLEAN
);

CREATE TABLE volunteer_assignment (
    volunteerId INT,
    eventId INT,
    eventType ENUM('COURSE_SESSION', 'FITNESS_SESSION', 'SPORTS_SEGMENT'),
    hoursWorked DECIMAL(5,2),
    PRIMARY KEY (volunteerId, eventId, eventType),
    FOREIGN KEY (volunteerId) REFERENCES volunteer(volunteerId)
);

CREATE TABLE summer_camp (
    campId INT PRIMARY KEY,
    programId INT,
    booking TEXT,
    terms TEXT,
    payment TEXT,
    FOREIGN KEY (programId) REFERENCES program(programId)
);

CREATE TABLE holiday_camp (
    holidayCampId INT PRIMARY KEY,
    programId INT,
    booking TEXT,
    terms TEXT,
    payment TEXT,
    FOREIGN KEY (programId) REFERENCES program(programId)
);