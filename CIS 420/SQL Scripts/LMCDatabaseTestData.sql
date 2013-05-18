-- Test data for LMC database

USE lmcdbase;

INSERT INTO PERSON VALUES(NULL,
    'Mark', 'D', 'Goodwin', '5202 Frankfort Ln', '', 'Louisville', 'KY', '40277',
    'm0good04@louisville.edu', '5555555555', '5555555556', '5555555557');
INSERT INTO PERSON VALUES(NULL,
    'Crystal', 'A', 'Goodwin', '5202 Frankfort Ln', '', 'Louisville', 'KY', '40277',
    'crystal@louisville.edu', '5555555554', '5555555550', '5555555527');
    
INSERT INTO SYSTEMUSER 
    VALUES((SELECT PERSON_ID FROM PERSON WHERE (PERSON_FIRSTNAME='Mark' AND PERSON_LASTNAME='Goodwin')),
        'mark', MD5('@123!mark^5AS'), 1);