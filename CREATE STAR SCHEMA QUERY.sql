DROP TABLE IF EXISTS DIM_STUDENT_DEMOGRAPHICS;
CREATE TABLE  DIM_STUDENT_DEMOGRAPHICS(
	STUDENT_ID INT NOT NULL auto_increment,
    GENDER VARCHAR(25),
    AGE INT,
    CURRENT_ACCOMODATION VARCHAR(30),
    YEAR_OF_STUDY VARCHAR(25),
    DEGREE VARCHAR(50),
    PRIMARY KEY (STUDENT_ID)

);

DROP TABLE IF EXISTS DIM_MENTAL_HEALTH_STATUS;
CREATE TABLE DIM_MENTAL_HEALTH_STATUS (
	MENTAL_HEALTH_STATUS_ID INT NOT NULL auto_increment,
    MENTAL_HEALTH_RATING varchar(25),
    PROPER_SLEEPING_HABITS VARCHAR(25),
    OVERWHELMED_BY_ACADEMICS VARCHAR(25),
	ANXIETY_ABOUT_FUTURE VARCHAR(25),
	PRIMARY KEY (MENTAL_HEALTH_STATUS_ID)
);

DROP TABLE IF EXISTS DIM_COPING_MECHANISMS;
CREATE TABLE DIM_COPING_MECHANISMS (
	COPING_MECHANISMS_ID INT NOT NULL AUTO_INCREMENT,
    COPING_MECHANISMS VARCHAR(50),
    COPING_MECHANISM_EFFECTIVENESS VARCHAR(50),
    USE_OF_SUPPORT_SERVICES VARCHAR(50),
    SUPPORT_SERVICES_STUDENTS_USE VARCHAR(50),
    PRIMARY KEY (COPING_MECHANISMS_ID)
);
    
DROP TABLE IF EXISTS FACT_SURVEY;
CREATE TABLE FACT_SURVEY (
	SURVEY_RESPONSE_ID INT NOT NULL auto_increment,
    STUDENT_ID INT NOT NULL,
    MENTAL_HEALTH_STATUS_ID INT NOT NULL,
    COPING_MECHANISMS_ID INT NOT NULL,
    PRIMARY KEY (SURVEY_RESPONSE_ID),
    FOREIGN KEY (MENTAL_HEALTH_STATUS_ID) REFERENCES DIM_MENTAL_HEALTH_STATUS(MENTAL_HEALTH_STATUS_ID),
	FOREIGN KEY (STUDENT_ID) REFERENCES DIM_STUDENT_DEMOGRAPHICS(STUDENT_ID),
	FOREIGN KEY (COPING_MECHANISMS_ID) REFERENCES DIM_COPING_MECHANISMS(COPING_MECHANISMS_ID)

);

