DROP TABLE WORKS_IN;
DROP TABLE EMPLOYEE_EMAILADDR;
DROP TABLE WORKSFOR;
DROP TABLE EMPLOYEES;
DROP TABLE MEASUREMENT_RECORDS;
DROP TABLE ROOM_PHONENUM;
DROP TABLE ROOMS;
DROP TABLE BUILDINGS;
DROP TABLE DEPARTMENT;

CREATE TABLE DEPARTMENT (
    Deptname varchar(255),
    PhoneNum varchar(255),
    WebAddr varchar(255),
    EmailAddr varchar(255),
    Mail_St varchar(50),
    Mail_City varchar(50),
    Mail_State varchar(50),
    Mail_Zip varchar(5),
    Mailing_Addr varchar(300) GENERATED ALWAYS AS (Mail_St || ' ' || Mail_City || ' ' || Mail_State|| ' ' || Mail_Zip),
    PRIMARY KEY (Deptname)
);

CREATE TABLE BUILDINGS (
    BuildName varchar(255),
    NumFloors int,
    NumRooms int,
    PRIMARY KEY (BuildName)
);

CREATE TABLE ROOMS (
    Build_name varchar(255),
    RmNum int,
    RmArea int,
    RmType varchar(50),
    PRIMARY KEY (Build_name, RmNum),
    FOREIGN KEY (Build_name) REFERENCES BUILDINGS(BuildName)
);

CREATE TABLE ROOM_PHONENUM (
    Build_name1 varchar(255),
    Room_Num1 int,
    Room_PhoneNum varchar(10),
    FOREIGN KEY (Build_name1, Room_Num1) REFERENCES ROOMS (Build_name, RmNum)
    --FOREIGN KEY (Build_Uname) REFERENCES BUILDINGS (BuildName)
);

CREATE TABLE MEASUREMENT_RECORDS (
    Room_Num2 int,
    Build_name2 varchar(255),
    Light int,
    Sound int,
    CurrDate varchar(50),
    CurrTime varchar(50),
    CurrTemp int,
    PRIMARY KEY (Build_name2, Room_Num2),
    FOREIGN KEY (Build_name2, Room_Num2) REFERENCES ROOMS (Build_name, RmNum)
    --FOREIGN KEY (Building_Uname) REFERENCES BUILDINGS (BuildName)
);

CREATE TABLE EMPLOYEES (
    EmpUID varchar(255),
    BirthYear varchar(255),
    EmpName varchar(255),
    PRIMARY KEY (EmpUID)
);

CREATE TABLE WORKSFOR (
    Dept_Uname varchar(255),
    Emp_id varchar(255),
    FOREIGN KEY (Dept_Uname) REFERENCES DEPARTMENT (Deptname),
    FOREIGN KEY (Emp_id) REFERENCES EMPLOYEES (EmpUID)
);

CREATE TABLE EMPLOYEE_EMAILADDR (
    EmpID varchar(255),
    EmpEmailAddr varchar(255),
    --PRIMARY KEY (EmpID),
    FOREIGN KEY (EmpID) REFERENCES EMPLOYEES (EmpUID)
);

CREATE TABLE WORKS_IN (
    Em_ID varchar(255),
    Build_name3 varchar(255),
    Room_Num3 int,
    FOREIGN KEY (Em_ID) REFERENCES EMPLOYEES (EmpUID),
    FOREIGN KEY (Build_name3, Room_Num3) REFERENCES ROOMS (Build_Name, RmNum)
);

DELETE FROM WORKS_IN;
DELETE FROM EMPLOYEE_EMAILADDR;
DELETE FROM WORKSFOR;
DELETE FROM EMPLOYEES;
DELETE FROM MEASUREMENT_RECORDS;
DELETE FROM ROOM_PHONENUM;
DELETE FROM ROOMS;
DELETE FROM BUILDINGS;
DELETE FROM DEPARTMENT;


INSERT INTO DEPARTMENT (Deptname, PhoneNum, WebAddr, EmailAddr, Mail_St, Mail_City, Mail_State, Mail_Zip)
VALUES ('A', '7031234566', 'abcd.com', 'abcd@gmail.com', 'Pennsylvania St', 'Colonial Heights', 'VA', '23834');

INSERT INTO DEPARTMENT (Deptname, PhoneNum, WebAddr, EmailAddr, Mail_St, Mail_City, Mail_State, Mail_Zip)
VALUES ('B', '7032345677', 'bcde.com', 'bcde@gmail.com', 'Mayflower St', 'Colonial Heights', 'VA', '23834');

INSERT INTO DEPARTMENT (Deptname, PhoneNum, WebAddr, EmailAddr, Mail_St, Mail_City, Mail_State, Mail_Zip)
VALUES ('C', '7033456788', 'cdef.com', 'cdef@gmail.com', 'Middle River Dr', 'Colonial Heights', 'VA', '23834');

INSERT INTO DEPARTMENT (Deptname, PhoneNum, WebAddr, EmailAddr, Mail_St, Mail_City, Mail_State, Mail_Zip)
VALUES ('D', '7034567899', 'dfgh.com', 'dfgh@gmail.com', 'Trussel St', 'Colonial Heights', 'VA', '23834');

INSERT INTO DEPARTMENT (Deptname, PhoneNum, WebAddr, EmailAddr, Mail_St, Mail_City, Mail_State, Mail_Zip)
VALUES ('E', '7035678900', 'fghi.com', 'fghi@gmail.com', 'Mulberry Rd', 'Colonial Heights', 'VA', '23834');

INSERT INTO DEPARTMENT (Deptname, PhoneNum, WebAddr, EmailAddr, Mail_St, Mail_City, Mail_State, Mail_Zip)
VALUES ('F', '7030123455', 'ghij.com', 'ghij@gmail.com', 'Cross Rd', 'Colonial Heights', 'VA', '23834');


INSERT INTO BUILDINGS (BuildName, NumFloors, NumRooms)
VALUES ('Rune Mound', '3', '8');

INSERT INTO BUILDINGS (BuildName, NumFloors, NumRooms)
VALUES ('Fallen Shore', '2', '5');

INSERT INTO BUILDINGS (BuildName, NumFloors, NumRooms)
VALUES ('Crest Meadow', '3', '9');

INSERT INTO BUILDINGS (BuildName, NumFloors, NumRooms)
VALUES ('Starlight Tower', '4', '10');


INSERT INTO EMPLOYEES (EmpUID, BirthYear, EmpName)
VALUES ('227', '1969', 'Henry');

INSERT INTO EMPLOYEES (EmpUID, BirthYear, EmpName)
VALUES ('614', '1982', 'Koby');

INSERT INTO EMPLOYEES (EmpUID, BirthYear, EmpName)
VALUES ('366', '1985', 'Zhen');

INSERT INTO EMPLOYEES (EmpUID, BirthYear, EmpName)
VALUES ('170', '1956', 'Tayah');

INSERT INTO EMPLOYEES (EmpUID, BirthYear, EmpName)
VALUES ('279', '1992', 'Sadiyah');

INSERT INTO EMPLOYEES (EmpUID, BirthYear, EmpName)
VALUES ('541', '1972', 'Hailie');


INSERT INTO WORKSFOR (Dept_Uname, Emp_id)
VALUES ('C', '170');

INSERT INTO WORKSFOR (Dept_Uname, Emp_id)
VALUES ('C', '227');

INSERT INTO WORKSFOR (Dept_Uname, Emp_id)
VALUES ('A', '227');

INSERT INTO WORKSFOR (Dept_Uname, Emp_id)
VALUES ('F', '366');

INSERT INTO WORKSFOR (Dept_Uname, Emp_id)
VALUES ('D', '614');

INSERT INTO WORKSFOR (Dept_Uname, Emp_id)
VALUES ('F', '541');


INSERT INTO EMPLOYEE_EMAILADDR(EmpID, EmpEmailAddr)
VALUES ('227', 'henry@theworkcompany.com');

INSERT INTO EMPLOYEE_EMAILADDR(EmpID, EmpEmailAddr)
VALUES ('614', 'koby@theworkcompany.com');

INSERT INTO EMPLOYEE_EMAILADDR(EmpID, EmpEmailAddr)
VALUES ('366', 'zhen@theworkcompany.com');

INSERT INTO EMPLOYEE_EMAILADDR(EmpID, EmpEmailAddr)
VALUES ('366', 'zheng@theworkcompany.com');

INSERT INTO EMPLOYEE_EMAILADDR(EmpID, EmpEmailAddr)
VALUES ('170', 'tayah@theworkcompany.com');

INSERT INTO EMPLOYEE_EMAILADDR(EmpID, EmpEmailAddr)
VALUES ('279', 'sadiyah@theworkcompany.com');

INSERT INTO EMPLOYEE_EMAILADDR(EmpID, EmpEmailAddr)
VALUES ('541', 'hailie@company.com');

--DELETE FROM MEASUREMENT_RECORDS;
--DELETE FROM ROOM_PHONENUM;
--DELETE FROM ROOMS;

--BUILDING: RUNE MOUND (8)--
INSERT INTO ROOMS(Build_name, RmNum, RmArea, RmType)
VALUES ('Rune Mound', '1', '380', 'Office');

INSERT INTO ROOMS(Build_name, RmNum, RmArea, RmType)
VALUES ('Rune Mound', '2', '190', 'Office');

INSERT INTO ROOMS(Build_name, RmNum, RmArea, RmType)
VALUES ('Rune Mound', '3', '340', 'Office Lab');

INSERT INTO ROOMS(Build_name, RmNum, RmArea, RmType)
VALUES ('Rune Mound', '4', '750', 'Conference');

INSERT INTO ROOMS(Build_name, RmNum, RmArea, RmType)
VALUES ('Rune Mound', '5', '390', 'Office');

INSERT INTO ROOMS(Build_name, RmNum, RmArea, RmType)
VALUES ('Rune Mound', '6', '290', 'Office');

INSERT INTO ROOMS(Build_name, RmNum, RmArea, RmType)
VALUES ('Rune Mound', '7', '290', 'Office');

INSERT INTO ROOMS(Build_name, RmNum, RmArea, RmType)
VALUES ('Rune Mound', '8', '290', 'Office');


--BUILDING: Fallen Shore (5)--
INSERT INTO ROOMS(Build_name, RmNum, RmArea, RmType)
VALUES ('Fallen Shore', '1', '530', 'Office');

INSERT INTO ROOMS(Build_name, RmNum, RmArea, RmType)
VALUES ('Fallen Shore', '2', '490', 'Office');

INSERT INTO ROOMS(Build_name, RmNum, RmArea, RmType)
VALUES ('Fallen Shore', '3', '290', 'Office');

INSERT INTO ROOMS(Build_name, RmNum, RmArea, RmType)
VALUES ('Fallen Shore', '4', '590', 'Office');

INSERT INTO ROOMS(Build_name, RmNum, RmArea, RmType)
VALUES ('Fallen Shore', '5', '530', 'Office');



--BUILDING: Crest Meadow (9)--

INSERT INTO ROOMS(Build_name, RmNum, RmArea, RmType)
VALUES ('Crest Meadow', '1', '180', 'Office Lab');

INSERT INTO ROOMS(Build_name, RmNum, RmArea, RmType)
VALUES ('Crest Meadow', '2', '840', 'Conference');

INSERT INTO ROOMS(Build_name, RmNum, RmArea, RmType)
VALUES ('Crest Meadow', '3', '470', 'Conference');

INSERT INTO ROOMS(Build_name, RmNum, RmArea, RmType)
VALUES ('Crest Meadow', '4', '320', 'Office Lab');

INSERT INTO ROOMS(Build_name, RmNum, RmArea, RmType)
VALUES ('Crest Meadow', '5', '850', 'Conference');

INSERT INTO ROOMS(Build_name, RmNum, RmArea, RmType)
VALUES ('Crest Meadow', '6', '290', 'Office Lab');

INSERT INTO ROOMS(Build_name, RmNum, RmArea, RmType)
VALUES ('Crest Meadow', '7', '380', 'Office Lab');

INSERT INTO ROOMS(Build_name, RmNum, RmArea, RmType)
VALUES ('Crest Meadow', '8', '390', 'Office Lab');

INSERT INTO ROOMS(Build_name, RmNum, RmArea, RmType)
VALUES ('Crest Meadow', '9', '210', 'Office Lab');


--BUILDING: Starlight Tower (10)--

INSERT INTO ROOMS(Build_name, RmNum, RmArea, RmType)
VALUES ('Starlight Tower', '1', '250', 'Office Lab');

INSERT INTO ROOMS(Build_name, RmNum, RmArea, RmType)
VALUES ('Starlight Tower', '2', '800', 'Conference');

INSERT INTO ROOMS(Build_name, RmNum, RmArea, RmType)
VALUES ('Starlight Tower', '3', '480', 'Office Lab');

INSERT INTO ROOMS(Build_name, RmNum, RmArea, RmType)
VALUES ('Starlight Tower', '4', '230', 'Office Lab');

INSERT INTO ROOMS(Build_name, RmNum, RmArea, RmType)
VALUES ('Starlight Tower', '5', '850', 'Conference');

INSERT INTO ROOMS(Build_name, RmNum, RmArea, RmType)
VALUES ('Starlight Tower', '6', '580', 'Conference');

INSERT INTO ROOMS(Build_name, RmNum, RmArea, RmType)
VALUES ('Starlight Tower', '7', '280', 'Office Lab');

INSERT INTO ROOMS(Build_name, RmNum, RmArea, RmType)
VALUES ('Starlight Tower', '8', '580', 'Office Lab');

INSERT INTO ROOMS(Build_name, RmNum, RmArea, RmType)
VALUES ('Starlight Tower', '9', '480', 'Office Lab');

INSERT INTO ROOMS(Build_name, RmNum, RmArea, RmType)
VALUES ('Starlight Tower', '10', '190', 'Office Lab');


--ROOM PHONE NUM--
--RUNE MOUND (8)--
INSERT INTO ROOM_PHONENUM (Build_name1, Room_Num1, Room_PhoneNum)
VALUES ('Rune Mound', '1', '7030909090');

INSERT INTO ROOM_PHONENUM (Build_name1, Room_Num1, Room_PhoneNum)
VALUES ('Rune Mound', '2', '7031919191');

INSERT INTO ROOM_PHONENUM (Build_name1, Room_Num1, Room_PhoneNum)
VALUES ('Rune Mound', '3', '7032929292');

INSERT INTO ROOM_PHONENUM (Build_name1, Room_Num1, Room_PhoneNum)
VALUES ('Rune Mound', '4', '7033939393');

INSERT INTO ROOM_PHONENUM (Build_name1, Room_Num1, Room_PhoneNum)
VALUES ('Rune Mound', '4', '7034444444');

INSERT INTO ROOM_PHONENUM (Build_name1, Room_Num1, Room_PhoneNum)
VALUES ('Rune Mound', '5', '7034949494');

INSERT INTO ROOM_PHONENUM (Build_name1, Room_Num1, Room_PhoneNum)
VALUES ('Rune Mound', '6', '7035959595');

INSERT INTO ROOM_PHONENUM (Build_name1, Room_Num1, Room_PhoneNum)
VALUES ('Rune Mound', '7', '7036969696');

INSERT INTO ROOM_PHONENUM (Build_name1, Room_Num1, Room_PhoneNum)
VALUES ('Rune Mound', '8', '7037979797');


--Fallen Shore (5)--
INSERT INTO ROOM_PHONENUM (Build_name1, Room_Num1, Room_PhoneNum)
VALUES ('Fallen Shore', '1', '7031717171');

INSERT INTO ROOM_PHONENUM (Build_name1, Room_Num1, Room_PhoneNum)
VALUES ('Fallen Shore', '2', '7032727272');

INSERT INTO ROOM_PHONENUM (Build_name1, Room_Num1, Room_PhoneNum)
VALUES ('Fallen Shore', '3', '7033737373');

INSERT INTO ROOM_PHONENUM (Build_name1, Room_Num1, Room_PhoneNum)
VALUES ('Fallen Shore', '4', '7034747474');

INSERT INTO ROOM_PHONENUM (Build_name1, Room_Num1, Room_PhoneNum)
VALUES ('Fallen Shore', '5', '7035759000');


--Crest Meadow (9)--
INSERT INTO ROOM_PHONENUM (Build_name1, Room_Num1, Room_PhoneNum)
VALUES ('Crest Meadow', '1', '7030505000');

INSERT INTO ROOM_PHONENUM (Build_name1, Room_Num1, Room_PhoneNum)
VALUES ('Crest Meadow', '2', '7031515111');

INSERT INTO ROOM_PHONENUM (Build_name1, Room_Num1, Room_PhoneNum)
VALUES ('Crest Meadow', '3', '7032525222');

INSERT INTO ROOM_PHONENUM (Build_name1, Room_Num1, Room_PhoneNum)
VALUES ('Crest Meadow', '4', '7033535333');

INSERT INTO ROOM_PHONENUM (Build_name1, Room_Num1, Room_PhoneNum)
VALUES ('Crest Meadow', '5', '7034545444');

INSERT INTO ROOM_PHONENUM (Build_name1, Room_Num1, Room_PhoneNum)
VALUES ('Crest Meadow', '6', '7036565666');

INSERT INTO ROOM_PHONENUM (Build_name1, Room_Num1, Room_PhoneNum)
VALUES ('Crest Meadow', '7', '7038585888');

INSERT INTO ROOM_PHONENUM (Build_name1, Room_Num1, Room_PhoneNum)
VALUES ('Crest Meadow', '8', '7039595999');

INSERT INTO ROOM_PHONENUM (Build_name1, Room_Num1, Room_PhoneNum)
VALUES ('Crest Meadow', '9', '7035551111');


--Starlight Tower (10)--
INSERT INTO ROOM_PHONENUM (Build_name1, Room_Num1, Room_PhoneNum)
VALUES ('Starlight Tower', '1', '7031011000');

INSERT INTO ROOM_PHONENUM (Build_name1, Room_Num1, Room_PhoneNum)
VALUES ('Starlight Tower', '2', '7031212000');

INSERT INTO ROOM_PHONENUM (Build_name1, Room_Num1, Room_PhoneNum)
VALUES ('Starlight Tower', '3', '7031313000');

INSERT INTO ROOM_PHONENUM (Build_name1, Room_Num1, Room_PhoneNum)
VALUES ('Starlight Tower', '4', '7031414000');

INSERT INTO ROOM_PHONENUM (Build_name1, Room_Num1, Room_PhoneNum)
VALUES ('Starlight Tower', '5', '7031515000');

INSERT INTO ROOM_PHONENUM (Build_name1, Room_Num1, Room_PhoneNum)
VALUES ('Starlight Tower', '6', '7031616000');

INSERT INTO ROOM_PHONENUM (Build_name1, Room_Num1, Room_PhoneNum)
VALUES ('Starlight Tower', '7', '7031717000');

INSERT INTO ROOM_PHONENUM (Build_name1, Room_Num1, Room_PhoneNum)
VALUES ('Starlight Tower', '8', '7031919000');

INSERT INTO ROOM_PHONENUM (Build_name1, Room_Num1, Room_PhoneNum)
VALUES ('Starlight Tower', '9', '7039999000');

INSERT INTO ROOM_PHONENUM (Build_name1, Room_Num1, Room_PhoneNum)
VALUES ('Starlight Tower', '10', '7039009000');


--WORKS IN--
INSERT INTO WORKS_IN (Em_ID, Build_name3, Room_Num3)
VALUES ('227', 'Crest Meadow', '5');

INSERT INTO WORKS_IN (Em_ID, Build_name3, Room_Num3)
VALUES ('279', 'Crest Meadow', '6');

INSERT INTO WORKS_IN (Em_ID, Build_name3, Room_Num3)
VALUES ('614', 'Crest Meadow', '7');

INSERT INTO WORKS_IN (Em_ID, Build_name3, Room_Num3)
VALUES ('170', 'Crest Meadow', '8');

INSERT INTO WORKS_IN (Em_ID, Build_name3, Room_Num3)
VALUES ('279', 'Starlight Tower', '1');

INSERT INTO WORKS_IN (Em_ID, Build_name3, Room_Num3)
VALUES ('614', 'Starlight Tower', '2');

INSERT INTO WORKS_IN (Em_ID, Build_name3, Room_Num3)
VALUES ('541', 'Starlight Tower', '3');

INSERT INTO WORKS_IN (Em_ID, Build_name3, Room_Num3)
VALUES ('366', 'Starlight Tower', '4');

INSERT INTO WORKS_IN (Em_ID, Build_name3, Room_Num3)
VALUES ('227', 'Starlight Tower', '5');

INSERT INTO WORKS_IN (Em_ID, Build_name3, Room_Num3)
VALUES ('279', 'Starlight Tower', '6');

INSERT INTO WORKS_IN (Em_ID, Build_name3, Room_Num3)
VALUES ('614', 'Starlight Tower', '7');

INSERT INTO WORKS_IN (Em_ID, Build_name3, Room_Num3)
VALUES ('170', 'Starlight Tower', '8');

INSERT INTO WORKS_IN (Em_ID, Build_name3, Room_Num3)
VALUES ('541', 'Starlight Tower', '9');

INSERT INTO WORKS_IN (Em_ID, Build_name3, Room_Num3)
VALUES ('279', 'Fallen Shore', '1');

INSERT INTO WORKS_IN (Em_ID, Build_name3, Room_Num3)
VALUES ('541', 'Fallen Shore', '3');

INSERT INTO WORKS_IN (Em_ID, Build_name3, Room_Num3)
VALUES ('614', 'Rune Mound', '2');

INSERT INTO WORKS_IN (Em_ID, Build_name3, Room_Num3)
VALUES ('541', 'Rune Mound', '3');

INSERT INTO WORKS_IN (Em_ID, Build_name3, Room_Num3)
VALUES ('366', 'Rune Mound', '4');

INSERT INTO WORKS_IN (Em_ID, Build_name3, Room_Num3)
VALUES ('227', 'Rune Mound', '5');



--ROOM MEASUREMENTS--
INSERT INTO MEASUREMENT_RECORDS (Room_Num2, Build_name2, Light, Sound, CurrDate, CurrTime, CurrTemp)
VALUES ('1', 'Rune Mound', '3', '3', '2021-10-01', '10:27', '70');

INSERT INTO MEASUREMENT_RECORDS (Room_Num2, Build_name2, Light, Sound, CurrDate, CurrTime, CurrTemp)
VALUES ('2', 'Rune Mound', '3', '3', '2021-10-01', '10:27', '70');

INSERT INTO MEASUREMENT_RECORDS (Room_Num2, Build_name2, Light, Sound, CurrDate, CurrTime, CurrTemp)
VALUES ('4', 'Rune Mound', '4', '3', '2021-10-01', '10:27', '75');

INSERT INTO MEASUREMENT_RECORDS (Room_Num2, Build_name2, Light, Sound, CurrDate, CurrTime, CurrTemp)
VALUES ('5', 'Rune Mound', '3', '3', '2021-10-01', '10:27', '70');

INSERT INTO MEASUREMENT_RECORDS (Room_Num2, Build_name2, Light, Sound, CurrDate, CurrTime, CurrTemp)
VALUES ('6', 'Rune Mound', '4', '3', '2021-10-01', '10:27', '74');

INSERT INTO MEASUREMENT_RECORDS (Room_Num2, Build_name2, Light, Sound, CurrDate, CurrTime, CurrTemp)
VALUES ('7', 'Rune Mound', '4', '3', '2021-10-01', '10:27', '72');

INSERT INTO MEASUREMENT_RECORDS (Room_Num2, Build_name2, Light, Sound, CurrDate, CurrTime, CurrTemp)
VALUES ('8', 'Rune Mound', '3', '2', '2021-10-01', '10:27', '67');


INSERT INTO MEASUREMENT_RECORDS (Room_Num2, Build_name2, Light, Sound, CurrDate, CurrTime, CurrTemp)
VALUES ('1', 'Fallen Shore', '3', '3', '2021-10-01', '10:27', '79');

INSERT INTO MEASUREMENT_RECORDS (Room_Num2, Build_name2, Light, Sound, CurrDate, CurrTime, CurrTemp)
VALUES ('2', 'Fallen Shore', '4', '3', '2021-10-01', '10:27', '77');

INSERT INTO MEASUREMENT_RECORDS (Room_Num2, Build_name2, Light, Sound, CurrDate, CurrTime, CurrTemp)
VALUES ('4', 'Fallen Shore', '3', '3', '2021-10-01', '10:27', '75');

INSERT INTO MEASUREMENT_RECORDS (Room_Num2, Build_name2, Light, Sound, CurrDate, CurrTime, CurrTemp)
VALUES ('5', 'Fallen Shore', '4', '2', '2021-10-01', '10:27', '70');


INSERT INTO MEASUREMENT_RECORDS (Room_Num2, Build_name2, Light, Sound, CurrDate, CurrTime, CurrTemp)
VALUES ('2', 'Crest Meadow', '1', '3', '2021-10-01', '10:27', '72');

INSERT INTO MEASUREMENT_RECORDS (Room_Num2, Build_name2, Light, Sound, CurrDate, CurrTime, CurrTemp)
VALUES ('6', 'Crest Meadow', '1', '4', '2021-10-01', '10:27', '72');

INSERT INTO MEASUREMENT_RECORDS (Room_Num2, Build_name2, Light, Sound, CurrDate, CurrTime, CurrTemp)
VALUES ('7', 'Crest Meadow', '1', '1', '2021-10-01', '10:27', '72');

INSERT INTO MEASUREMENT_RECORDS (Room_Num2, Build_name2, Light, Sound, CurrDate, CurrTime, CurrTemp)
VALUES ('8', 'Crest Meadow', '1', '2', '2021-10-01', '10:27', '72');


--QUERIES--

-- 1) List the phone number and department name and street address for each department. 
SELECT PhoneNum, Deptname, Mail_St FROM DEPARTMENT;

-- 2) Find the names of all buildings that have less than 4 floors.
SELECT BuildName FROM BUILDINGS WHERE NUMFLOORS < 4;

-- 3) Find the building names and the room numbers of all labs that are also used as office.
SELECT Build_name, Rmnum FROM ROOMS WHERE RMTYPE = 'Office Lab';

-- 4) Find the average temperature for each room. 
SELECT AVG(CURRTEMP) FROM MEASUREMENT_RECORDS;

-- 5)  Count the number of rooms for each building
SELECT COUNT(*) FROM ROOMS GROUP BY Build_name;

-- 6)  Find the id of each employee who has exactly two email addresses.
SELECT EMPID FROM EMPLOYEE_EMAILADDR GROUP BY EMPID HAVING COUNT (EMPID) = 2;

-- 7) Find the name of each employee who works in at least two rooms. **
SELECT EmpName FROM EMPLOYEES INNER JOIN WORKS_IN ON EmpUID=EM_ID GROUP BY EmpName HAVING COUNT(*) > 1;

-- 8) Find the area of the conference rooms that haven’t had any measurements recorded yet
SELECT RMAREA FROM ROOMS WHERE RMTYPE = 'Conference' MINUS SELECT Room_Num2 FROM MEASUREMENT_RECORDS;

-- 9) Find the phone numbers of the brightest room based on daily average of measured light value. 
SELECT Room_PhoneNum FROM ROOM_PHONENUM INNER JOIN MEASUREMENT_RECORDS ON Room_Num1=Room_Num2 WHERE LIGHT > (SELECT AVG(Light) FROM MEASUREMENT_RECORDS);
