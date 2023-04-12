-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2023-04-12 01:30:56.552

-- tables
-- Table: Actor
CREATE TABLE Actor (
    A_ID int  NOT NULL,
    A_Name varchar(50)  NOT NULL,
    A_Gender varchar(10)  NOT NULL,
    Character_C_ID int  NOT NULL,
    CONSTRAINT Actor_pk PRIMARY KEY (A_ID)
);

-- Table: Actor_Movie
CREATE TABLE Actor_Movie (
    AM_ID int  NOT NULL,
    A_ID int  NOT NULL,
    M_ID int  NOT NULL,
    Actor_A_ID int  NOT NULL,
    CONSTRAINT Actor_Movie_pk PRIMARY KEY (AM_ID,A_ID,M_ID)
);

-- Table: Box_Office
CREATE TABLE Box_Office (
    BO_ID int  NOT NULL,
    M_ID int  NOT NULL,
    BO_Revenue int  NOT NULL,
    CONSTRAINT Box_Office_pk PRIMARY KEY (BO_ID)
);

-- Table: Character
CREATE TABLE `Character` (
    C_ID int  NOT NULL,
    C_Name varchar(50)  NOT NULL,
    C_Gender varchar(10)  NOT NULL,
    C_Universe varchar(10)  NOT NULL,
    CONSTRAINT Character_pk PRIMARY KEY (C_ID)
);

-- Table: Movie
CREATE TABLE Movie (
    M_ID int  NOT NULL,
    M_Name varchar(50)  NOT NULL,
    M_Release_Year int  NULL,
    M_Result_Hit bool  NOT NULL,
    PT_ID int  NOT NULL,
    Production Team_PT_ID int  NOT NULL,
    CONSTRAINT Movie_pk PRIMARY KEY (M_ID)
);

-- Table: Movie_Character
CREATE TABLE Movie_Character (
    MC_ID int  NOT NULL,
    M_ID int  NOT NULL,
    C_ID int  NOT NULL,
    Movie_M_ID int  NOT NULL,
    Character_C_ID int  NOT NULL,
    CONSTRAINT Movie_Character_pk PRIMARY KEY (MC_ID,M_ID,C_ID)
);

-- Table: Production Team
CREATE TABLE Production Team (
    PT_ID int  NOT NULL,
    PT_Name varchar(50)  NOT NULL,
    PT_Country varchar(50)  NOT NULL,
    PT_Website nvarchar(100)  NOT NULL,
    CONSTRAINT Production Team_pk PRIMARY KEY (PT_ID)
);

-- Table: Sequels
CREATE TABLE Sequels (
    S_ID int  NOT NULL,
    S_Name varchar(50)  NOT NULL,
    S_Release_Year int  NOT NULL,
    S_Franchise varchar(50)  NOT NULL,
    PT_ID int  NOT NULL,
    Production Team_PT_ID int  NOT NULL,
    CONSTRAINT Sequels_pk PRIMARY KEY (S_ID)
);

-- foreign keys
-- Reference: Actor_Character (table: Actor)
ALTER TABLE Actor ADD CONSTRAINT Actor_Character FOREIGN KEY Actor_Character (Character_C_ID)
    REFERENCES `Character` (C_ID);

-- Reference: Actor_Movie_Actor (table: Actor_Movie)
ALTER TABLE Actor_Movie ADD CONSTRAINT Actor_Movie_Actor FOREIGN KEY Actor_Movie_Actor (Actor_A_ID)
    REFERENCES Actor (A_ID);

-- Reference: Box_Office_Movie (table: Box_Office)
ALTER TABLE Box_Office ADD CONSTRAINT Box_Office_Movie FOREIGN KEY Box_Office_Movie (M_ID)
    REFERENCES Movie (Production Team_PT_ID);

-- Reference: Character_Movie (table: Character)
ALTER TABLE `Character` ADD CONSTRAINT Character_Movie FOREIGN KEY Character_Movie ()
    REFERENCES Movie ();

-- Reference: Movie_Character_Character (table: Movie_Character)
ALTER TABLE Movie_Character ADD CONSTRAINT Movie_Character_Character FOREIGN KEY Movie_Character_Character (Character_C_ID)
    REFERENCES `Character` (C_ID);

-- Reference: Movie_Character_Movie (table: Movie_Character)
ALTER TABLE Movie_Character ADD CONSTRAINT Movie_Character_Movie FOREIGN KEY Movie_Character_Movie (Movie_M_ID)
    REFERENCES Movie (M_ID);

-- Reference: Movie_Character_Movie_Character (table: Movie_Character)
ALTER TABLE Movie_Character ADD CONSTRAINT Movie_Character_Movie_Character FOREIGN KEY Movie_Character_Movie_Character (<EMPTY>,<EMPTY>,<EMPTY>)
    REFERENCES Movie_Character (MC_ID,M_ID,C_ID);

-- Reference: Movie_Production Team (table: Movie)
ALTER TABLE Movie ADD CONSTRAINT Movie_Production Team FOREIGN KEY Movie_Production Team (Production Team_PT_ID)
    REFERENCES Production Team (PT_ID);

-- Reference: Sequels_Production Team (table: Sequels)
ALTER TABLE Sequels ADD CONSTRAINT Sequels_Production Team FOREIGN KEY Sequels_Production Team (Production Team_PT_ID)
    REFERENCES Production Team (PT_ID);

-- End of file.

