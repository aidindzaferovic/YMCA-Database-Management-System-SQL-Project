-- question 1

SELECT  cs.sessionDate                       AS camp_day,
        COUNT(cr.personId)                   AS num_children_under_18
FROM    holiday_camp       AS hc
JOIN    program            AS p  ON p.programId      = hc.programId         
JOIN    course_session     AS cs ON cs.programId     = p.programId
JOIN    course_registration AS cr ON cr.courseSessionId = cs.courseSessionId
JOIN    person             AS pe ON pe.personId      = cr.personId
WHERE   p.title = 'Spring Break Camp'                          
  AND   TIMESTAMPDIFF(YEAR, pe.dob, cs.sessionDate) < 18       
GROUP   BY cs.sessionDate
ORDER   BY cs.sessionDate;

-- question 2

SELECT  pe.personId,
        CONCAT(pe.fName, ' ', pe.lName)       AS donor_name,
        SUM(pa.amount)                        AS total_donated
FROM    person     AS pe
JOIN    payment    AS pa ON pa.personId     = pe.personId
JOIN    donation   AS d  ON d.transactionId = pa.transactionId
GROUP   BY pe.personId, donor_name
ORDER   BY total_donated DESC;


-- question 3

SELECT  pe.personId ,
        pe.fName ,
        pe.lName ,
        pe.city ,
        pe.state ,
        pe.zip ,
        m.membershipId ,
        m.membershipType ,
        m.status ,
        m.startDate ,
        m.endDate
FROM    person      pe
LEFT    JOIN membership m  ON m.personId = pe.personId
ORDER   BY pe.lName , pe.fName;

-- Question 4
SELECT 
    p.title AS program_name,
    COUNT(DISTINCT s.segmentId) AS number_of_segments,
    COUNT(r.personId) AS total_registered
FROM 
    program p
JOIN 
    sports_segment s ON p.programId = s.programId
LEFT JOIN 
    sports_registration r ON s.segmentId = r.segmentId
WHERE 
    p.programType = 'SPORTS'
GROUP BY 
    p.programId, p.title;
    
-- Qestion 5
SELECT 
    s.staffId,
    CONCAT(s.fName, ' ', s.lName) AS name,
    s.role AS position,
    s.extension AS phone
FROM 
    staff s
WHERE 
    s.staffId NOT IN (
        SELECT ss.staffId
        FROM session_staff ss
        JOIN course_session cs ON ss.courseSessionId = cs.courseSessionId
        JOIN program p ON cs.programId = p.programId
        WHERE p.programType IN ('LESSON', 'FITNESS', 'SPORTS')
    );

-- Question 6
SELECT 
    f.facilityId,
    f.name,
    f.locationDesc,
    f.type
FROM 
    facility f
JOIN 
    booking b ON f.facilityId = b.facilityId
WHERE 
    b.date = '2025-11-01';
    
    
  -- Question 7
SELECT  cs.courseSessionId,
        sc.campId,
        cs.sessionDate,
        COUNT(ss.staffId) AS staff_count
FROM    summer_camp      AS sc
JOIN    program          AS p  ON p.programId     = sc.programId      
JOIN    course_session   AS cs ON cs.programId    = p.programId       
LEFT    JOIN session_staff ss  ON ss.courseSessionId = cs.courseSessionId
GROUP   BY cs.courseSessionId, sc.campId, cs.sessionDate
HAVING  COUNT(ss.staffId) < 3
ORDER   BY cs.sessionDate;

    
-- Question 8
SELECT  
        CONCAT(p.fName, ' ', p.lName)                            AS participant_name,
        CONCAT(p.city, ', ', p.state, ' ', p.zip)                AS address,
        p.cellNumber                                             AS phone,
        MAX(m.membershipId)                                      AS membershipId   
FROM    course_registration  AS cr
JOIN    course_session       AS cs  ON cs.courseSessionId = cr.courseSessionId
JOIN    program              AS pr  ON pr.programId       = cs.programId
JOIN    person               AS p   ON p.personId         = cr.personId
LEFT    JOIN membership       m  ON  m.personId = p.personId
                                    AND m.status  = 'Active'
WHERE   pr.title = 'Lifeguard Certification'          
  AND   cs.sessionDate = '2025-05-10'                 
GROUP BY p.personId, participant_name, address, phone
ORDER BY p.lName, p.fName;
    
-- Question 9
SELECT 
    sc.campId AS camp_id,
    p.title AS camp_name,
    p.programType AS level,
    f.name AS location,
    cs.sessionDate AS session_date,
    sc.booking AS trips_info,
    sc.terms AS themes
FROM 
    summer_camp sc
JOIN 
    program p ON sc.programId = p.programId
JOIN 
    course_session cs ON p.programId = cs.programId
JOIN 
    facility f ON (
        
        SELECT w.facilityId 
        FROM works w
        JOIN session_staff ss ON w.staffId = ss.staffId
        WHERE ss.courseSessionId = cs.courseSessionId
        LIMIT 1
    )
ORDER BY 
    sc.campId, cs.sessionDate;
  
    
-- Number 10
SELECT 
    p.programType,
    CASE 
        WHEN per.dob BETWEEN DATE '2015-01-01' AND DATE '2020-01-01' THEN 'Kids (0-9)'
        WHEN per.dob BETWEEN DATE '2008-01-01' AND DATE '2014-12-31' THEN 'Teens (10-16)'
        WHEN per.dob <= DATE '2007-12-31' THEN 'Adults (17+)'
        ELSE 'Unknown'
    END AS age_group,
    COUNT(*) AS total_registrations
FROM 
    person per
JOIN 
    sports_registration sr ON per.personId = sr.personId
JOIN 
    sports_segment ss ON sr.segmentId = ss.segmentId
JOIN 
    program p ON ss.programId = p.programId
WHERE 
    p.programType IN ('SPORTS', 'LESSON', 'COURSE', 'FITNESS')
GROUP BY 
    p.programType,
    age_group
ORDER BY 
    age_group,
    total_registrations DESC;
    
-- -- This query combines participant data with program data to show what kinds of programs are most attended by each age group. This helps in targeted program planning and marketing
-- For example: If Teens (10–16) have 100+ sports registrations, that suggests increasing sports staff or sessions. If Adults (17+) have low fitness registrations, the Y might consider promotional discounts or schedule adjustments.