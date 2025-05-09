INSERT INTO person
(personId, cellNumber, primaryNumber, city, state, zip, dob, gender, fName, lName) VALUES
(1,'2125550001','6465550001','New York','NY','10001','1980-03-15','Male','John','Doe'),
(2,'2125550002','6465550002','Brooklyn','NY','11201','1982-07-22','Female','Mary','Smith'),
(3,'2125550003','6465550003','Queens','NY','11101','1975-11-09','Male','David','Lee'),
(4,'2125550004','6465550004','Bronx','NY','10451','1990-02-01','Female','Laura','Ng'),
(5,'2125550005','6465550005','Staten Island','NY','10301','1987-06-17','Male','Carlos','Diaz'),
(6,'2125550006','6465550006','New York','NY','10002','1985-09-30','Female','Sara','Kim'),
(7,'2125550007','6465550007','New York','NY','10003','2012-04-05','Female','Emma','Doe'),
(8,'2125550008','6465550008','New York','NY','10003','2011-06-12','Male','Liam','Doe'),
(9,'2125550009','6465550009','Brooklyn','NY','11215','2010-02-19','Female','Olivia','Brown'),
(10,'2125550010','6465550010','Queens','NY','11105','2009-12-30','Male','Noah','Brown');

INSERT INTO membership
(membershipId, personId, membershipType, startDate, endDate, status) VALUES
(1,1,'Family','2024-01-01','2024-12-31','Active'),
(2,2,'Individual','2024-02-01','2025-01-31','Active'),
(3,3,'Senior','2024-03-01','2025-02-28','Active'),
(4,4,'Individual','2024-04-01','2025-03-31','Active'),
(5,5,'Individual','2024-05-01','2025-04-30','Active'),
(6,6,'Family','2024-06-01','2025-05-31','Active'),
(7,7,'Youth','2024-07-01','2025-06-30','Active'),
(8,8,'Youth','2024-07-01','2025-06-30','Active'),
(9,9,'Youth','2024-07-01','2025-06-30','Active'),
(10,10,'Youth','2024-07-01','2025-06-30','Active');

INSERT INTO facility
(facilityId, name, locationDesc, type) VALUES
(1,'Main Gym','1st Floor – East','Court'),
(2,'Pool','Lower Level','Pool'),
(3,'Studio A','2nd Floor','Room'),
(4,'Studio B','2nd Floor','Room'),
(5,'Weight Room','1st Floor – West','Room'),
(6,'Outdoor Field','Back Lot','Field'),
(7,'Conference Room','3rd Floor','Room'),
(8,'Climbing Wall','Lower Level','Wall'),
(9,'Tennis Court 1','Rooftop','Court'),
(10,'Tennis Court 2','Rooftop','Court');

INSERT INTO staff
(staffId, role, fName, lName, email, extension) VALUES
(101,'Coach','Brian','Adams','badams@y.org','2101'),
(102,'Instructor','Chloe','Baker','cbaker@y.org','2102'),
(103,'Lifeguard','Daniel','Chen','dchen@y.org','2103'),
(104,'Counselor','Erin','Davis','edavis@y.org','2104'),
(105,'Counselor','Frank','Evans','fevans@y.org','2105'),
(106,'Counselor','Grace','Flores','gflores@y.org','2106'),
(107,'Trainer','Henry','Ghosh','hghosh@y.org','2107'),
(108,'Instructor','Isla','Hernandez','ihernandez@y.org','2108'),
(109,'Coach','Jack','Ibrahim','jibrahim@y.org','2109'),
(110,'Admin','Kelly','Jones','kjones@y.org','2110');

INSERT INTO works
(facilityId, staffId, startDate, roleAtFacility, endDate) VALUES
(1,101,'2024-01-01','Basketball Coach',NULL),
(2,103,'2024-01-01','Pool Lifeguard',NULL),
(3,102,'2024-01-01','Dance Instructor',NULL),
(4,108,'2024-01-01','Yoga Instructor',NULL),
(6,104,'2024-06-01','Camp Counselor',NULL),
(6,105,'2024-06-01','Camp Counselor',NULL),
(6,106,'2024-06-01','Camp Counselor',NULL),
(5,107,'2024-01-01','Personal Trainer',NULL),
(9,109,'2024-04-01','Tennis Coach',NULL),
(7,110,'2024-01-01','Program Admin',NULL);

INSERT INTO booking
(bookingId, personId, facilityId, date, time, bookingStatus) VALUES
(1,1,9,'2025-11-01','09:00:00','Confirmed'),
(2,2,2,'2025-11-01','10:00:00','Confirmed'),
(3,3,1,'2025-11-02','11:00:00','Confirmed'),
(4,4,3,'2025-10-15','12:00:00','Cancelled'),
(5,5,4,'2025-09-01','08:00:00','Confirmed'),
(6,6,6,'2025-11-01','14:00:00','Confirmed'),
(7,7,8,'2025-07-12','15:00:00','Confirmed'),
(8,8,5,'2025-05-05','16:00:00','Confirmed'),
(9,9,10,'2025-11-01','18:00:00','Confirmed'),
(10,10,7,'2025-03-03','13:00:00','Confirmed');

INSERT INTO payment
(transactionId, personId, amount, paymentMethod) VALUES
(1001,1,50.00,'Card'),
(1002,2,75.00,'Card'),
(1003,3,30.00,'Cash'),
(1004,4,60.00,'Card'),
(1005,5,40.00,'Card'),
(1006,6,90.00,'Card'),
(1007,7,25.00,'Card'),
(1008,8,20.00,'Card'),
(1009,9,55.00,'Cash'),
(1010,10,35.00,'Card');

INSERT INTO donation
(transactionId, campaign, donationType) VALUES
(1001,'Annual Fund','General'),
(1002,'Capital Campaign','Building'),
(1003,'Annual Fund','General'),
(1004,'Annual Fund','General'),
(1005,'Capital Campaign','Building'),
(1006,'Scholarship Fund','Youth'),
(1007,'Scholarship Fund','Youth'),
(1008,'Capital Campaign','Equipment'),
(1009,'Annual Fund','General'),
(1010,'Annual Fund','General');

INSERT INTO program
(programId, programType, title, description, minAge, maxAge,
 defaultMemberPrice, defaultNonmemberPrice) VALUES
(1,'SPORTS','Basketball League','Adult 5‑on‑5',18,65,60.00,80.00),
(2,'SPORTS','Volleyball League','Co‑ed',18,65,55.00,75.00),
(3,'LESSON','Private Swim','1‑on‑1 Swim',5,65,40.00,60.00),
(4,'LESSON','Private Pickleball','1‑on‑1 Pickleball',10,65,45.00,65.00),
(5,'COURSE','Lifeguard Certification','Red Cross',15,65,120.00,150.00),
(6,'COURSE','Spring Break Camp','Ages 8‑12',8,12,180.00,220.00),
(7,'COURSE','Summer Camp Junior','Ages 7‑10',7,10,300.00,350.00),
(8,'FITNESS','Zumba Drop‑In','Group Fitness',13,65,10.00,15.00),
(9,'FITNESS','Yoga Drop‑In','Group Fitness',13,65,10.00,15.00),
(10,'SPORTS','Soccer League','Adult Co‑ed',18,65,65.00,85.00);

INSERT INTO sports_segment
(segmentId, programId, segmentDate, startTs, endTs, capacity,
 memberPrice, nonmemberPrice) VALUES
(1,1,'2025-06-01','10:00:00','12:00:00',20,60,80),
(2,1,'2025-06-08','10:00:00','12:00:00',20,60,80),
(3,1,'2025-06-15','10:00:00','12:00:00',20,60,80),
(4,2,'2025-05-03','09:00:00','11:00:00',18,55,75),
(5,2,'2025-05-10','09:00:00','11:00:00',18,55,75),
(6,2,'2025-05-17','09:00:00','11:00:00',18,55,75),
(7,10,'2025-07-05','10:00:00','12:00:00',22,65,85),
(8,10,'2025-07-12','10:00:00','12:00:00',22,65,85),
(9,10,'2025-07-19','10:00:00','12:00:00',22,65,85),
(10,10,'2025-07-26','10:00:00','12:00:00',22,65,85);

INSERT INTO sports_registration
(paymentId, personId, segmentId, registeredTs) VALUES
(1001,1,1,'2025-04-15 09:00:00'),
(1002,2,2,'2025-04-15 09:05:00'),
(1003,3,3,'2025-04-16 10:00:00'),
(1004,4,4,'2025-04-16 11:00:00'),
(1005,5,5,'2025-04-17 12:00:00'),
(1006,6,6,'2025-04-17 12:15:00'),
(NULL ,7,7,'2025-04-18 08:30:00'),
(NULL ,8,8,'2025-04-18 09:45:00'),
(NULL ,9,9,'2025-04-19 10:15:00'),
(NULL ,10,10,'2025-04-19 10:30:00');

INSERT INTO lesson_package
(packageId, programId, numSessions, memberPrice, nonmemberPrice) VALUES
(1,3,5,180,270),
(2,3,10,320,450),
(3,3,15,450,650),
(4,3,20,600,850),
(5,4,5,200,300),
(6,4,10,350,480),
(7,4,15,480,650),
(8,4,20,620,880),
(9,3,25,720,1000),
(10,4,25,750,1050);

INSERT INTO lesson_registration
(paymentId, personId, packageId, registeredTs) VALUES
(1001,1,1,'2025-02-01 10:00:00'),
(1002,2,2,'2025-02-02 11:00:00'),
(1003,3,3,'2025-02-03 12:00:00'),
(1004,4,4,'2025-02-04 13:00:00'),
(1005,5,5,'2025-02-05 14:00:00'),
(1006,6,6,'2025-02-06 15:00:00'),
(1007,7,7,'2025-02-07 16:00:00'),
(1008,8,8,'2025-02-08 17:00:00'),
(1009,9,9,'2025-02-09 18:00:00'),
(1010,10,10,'2025-02-10 19:00:00');

INSERT INTO course_session
(courseSessionId, programId, sessionDate, startTs, endTs, capacity) VALUES
(1,5,'2025-05-10','09:00:00','17:00:00',15),
(2,5,'2025-06-15','09:00:00','17:00:00',15),
(3,6,'2025-04-07','09:00:00','15:00:00',40),
(4,6,'2025-04-08','09:00:00','15:00:00',40),
(5,6,'2025-04-09','09:00:00','15:00:00',40),
(6,7,'2025-07-01','09:00:00','15:00:00',50),
(7,7,'2025-07-02','09:00:00','15:00:00',50),
(8,7,'2025-07-03','09:00:00','15:00:00',50),
(9,5,'2025-07-20','09:00:00','17:00:00',15),
(10,5,'2025-08-10','09:00:00','17:00:00',15);

INSERT INTO course_registration
(paymentId, personId, courseSessionId, registeredTs) VALUES
(1001,1,1,'2025-04-01 08:00:00'),
(1002,2,2,'2025-04-01 08:05:00'),
(NULL ,7,3,'2025-03-25 09:00:00'),
(NULL ,8,4,'2025-03-25 09:10:00'),
(NULL ,9,5,'2025-03-25 09:15:00'),
(NULL ,7,6,'2025-05-20 10:00:00'),
(NULL ,8,7,'2025-05-20 10:05:00'),
(NULL ,9,8,'2025-05-20 10:10:00'),
(NULL ,10,9,'2025-06-15 11:00:00'),
(NULL ,10,10,'2025-06-15 11:05:00');

INSERT INTO fitness_session
(fitnessSessionId, programId, sessionDate, startTs, endTs, capacity, description) VALUES
(1,8,'2025-05-01','18:00:00','19:00:00',25,'Zumba Thu'),
(2,8,'2025-05-08','18:00:00','19:00:00',25,'Zumba Thu'),
(3,8,'2025-05-15','18:00:00','19:00:00',25,'Zumba Thu'),
(4,8,'2025-05-22','18:00:00','19:00:00',25,'Zumba Thu'),
(5,9,'2025-05-03','09:00:00','10:00:00',25,'Yoga Sat'),
(6,9,'2025-05-10','09:00:00','10:00:00',25,'Yoga Sat'),
(7,9,'2025-05-17','09:00:00','10:00:00',25,'Yoga Sat'),
(8,9,'2025-05-24','09:00:00','10:00:00',25,'Yoga Sat'),
(9,8,'2025-05-29','18:00:00','19:00:00',25,'Zumba Thu'),
(10,9,'2025-05-31','09:00:00','10:00:00',25,'Yoga Sat');

INSERT INTO fitness_registration
(paymentId, personId, fitnessSessionId, registeredTs) VALUES
(1001,1,1,'2025-04-25 10:00:00'),
(1002,2,2,'2025-04-25 10:05:00'),
(1003,3,3,'2025-04-25 10:10:00'),
(1004,4,4,'2025-04-26 11:00:00'),
(1005,5,5,'2025-04-26 11:05:00'),
(1006,6,6,'2025-04-26 11:10:00'),
(1007,7,7,'2025-04-27 12:00:00'),
(1008,8,8,'2025-04-27 12:05:00'),
(1009,9,9,'2025-04-28 13:00:00'),
(1010,10,10,'2025-04-28 13:05:00');

INSERT INTO session_staff
(staffId, courseSessionId) VALUES
(104,3),(105,3),(104,4),(105,4),(106,4),
(104,5),(104,6),(105,6),(104,7),(105,7);

INSERT INTO volunteer
(volunteerId, ssn, fName, mName, lName, phone, city, state, zip,
 dateOfAppointment, skills, employment, activeFlag) VALUES
(201,'123-45-0001','Adam',NULL,'Price','2125552001','NYC','NY','10001','2024-01-15','Fundraising','PT',1),
(202,'123-45-0002','Bella',NULL,'Quinn','2125552002','NYC','NY','10001','2024-02-20','Coaching','FT',1),
(203,'123-45-0003','Cody',NULL,'Reed','2125552003','NYC','NY','10001','2024-03-10','First Aid','PT',1),
(204,'123-45-0004','Dana',NULL,'Stone','2125552004','NYC','NY','10001','2024-03-15','Photography','PT',1),
(205,'123-45-0005','Eli',NULL,'Tate','2125552005','NYC','NY','10001','2024-04-01','Counseling','FT',1),
(206,'123-45-0006','Faye',NULL,'Underwood','2125552006','NYC','NY','10001','2024-04-05','Coaching','PT',1),
(207,'123-45-0007','Gina',NULL,'Vega','2125552007','NYC','NY','10001','2024-04-10','Fundraising','PT',1),
(208,'123-45-0008','Hank',NULL,'Wong','2125552008','NYC','NY','10001','2024-04-12','First Aid','PT',1),
(209,'123-45-0009','Ivy',NULL,'Xu','2125552009','NYC','NY','10001','2024-04-15','Photography','PT',1),
(210,'123-45-0010','Jake',NULL,'Young','2125552010','NYC','NY','10001','2024-04-20','Counseling','PT',1);

INSERT INTO volunteer_assignment
(volunteerId, eventId, eventType, hoursWorked) VALUES
(201,3,'COURSE_SESSION',6.0),
(202,4,'COURSE_SESSION',6.0),
(203,5,'COURSE_SESSION',6.0),
(204,6,'COURSE_SESSION',6.0),
(205,7,'COURSE_SESSION',6.0),
(206,8,'COURSE_SESSION',6.0),
(207,1,'SPORTS_SEGMENT',4.0),
(208,2,'SPORTS_SEGMENT',4.0),
(209,3,'SPORTS_SEGMENT',4.0),
(210,4,'SPORTS_SEGMENT',4.0);

INSERT INTO summer_camp
(campId, programId, booking, terms, payment) VALUES
(1,7,'online','waiver','card'),
(2,7,'online','waiver','card'),
(3,7,'phone','waiver','cash'),
(4,7,'online','waiver','card'),
(5,7,'online','waiver','card'),
(6,7,'online','waiver','card'),
(7,7,'phone','waiver','cash'),
(8,7,'online','waiver','card'),
(9,7,'online','waiver','card'),
(10,7,'online','waiver','card');

INSERT INTO holiday_camp
(holidayCampId, programId, booking, terms, payment) VALUES
(1,6,'online','waiver','card'),
(2,6,'online','waiver','card'),
(3,6,'online','waiver','card'),
(4,6,'online','waiver','card'),
(5,6,'online','waiver','card'),
(6,6,'online','waiver','card'),
(7,6,'online','waiver','card'),
(8,6,'online','waiver','card'),
(9,6,'online','waiver','card'),
(10,6,'online','waiver','card');
