create database cases
use cases;
]

create table LawEnforcementAgency (
AgencyID INT PRIMARY KEY,
AgencyName VARCHAR(255) NOT NULL,
Jurisdiction VARCHAR(255),
AggencyAddress text,
AgencyPhn varchar(20)
);

create table Victim
(
VictimID int primary key,
FirstName varchar(20) not null,
LastName varchar(30) not null,
DateOfBirth Date,
Gender varchar(20),
VictimAddress text,
VictimPhn varchar(20)
);

create table Suspects
(
SuspectID int primary key ,
FirstName varchar(20) not null,
LastName varchar(30) not null,
DateOfBirth Date,
Gender varchar(30),
SuspectAddress text,
SuspectPhn varchar(20)
);

create table Officers
(
OfficerID int primary key,
FirstName varchar(30),
LastName Varchar(30),
BadgeNumber Varchar(20),
Ranks varchar(20),
OfficerAddress text,
OfficerPhn varchar(20),
AgencyID int,
foreign key(AgencyID) references LawEnforcementAgency(AgencyID)
);

Create table Incidents
(
IncidentID int primary key,
IncidentType varchar (20),
IncidentDate Date ,
Latitude decimal(9,6),
Longitude decimal(9,6),
Descriptions TEXT,
VictimID int,
SuspectID int,
OfficerID int,
statuss varchar(30) check (statuss in ('Open', 'Closed', 'Under Investigation')),
Foreign key (VictimID) references Victim(VictimID),
foreign key (SuspectID) references Suspects(SuspectID),
foreign key (OfficerID) references Officers(OfficerID)
);

create table Evidence
(
EvidenceID int primary key,
Descriptions TEXT,
LocationFound varchar(3000),
IncidentID int,
Foreign key (IncidentID) references Incidents(IncidentID)
);

create table Reports
(
ReportID int primary key,
IncidentID int ,
ReportingOfficer int,
ReportDate Date,
ReportDetail TEXT,
statuss varchar(30) check(statuss in ('Draft','Finished')),
FOREIGN KEY (IncidentID) REFERENCES Incidents(IncidentID),  
FOREIGN KEY (ReportingOfficer) REFERENCES Officers(OfficerID)
);

INSERT INTO LawEnforcementAgency (AgencyID, AgencyName, Jurisdiction, AggencyAddress, AgencyPhn) VALUES
(1, 'City Police Department', 'Citywide', '123 Main Street, Cityville', 9876543210),
(2, 'County Sheriff Office', 'Countywide', '456 Oak Avenue, Countyland', 8765432109),
(3, 'State Investigation Bureau', 'Statewide', '789 Pine Road, Statecity', 7654321098),
(4, 'Federal Enforcement Agency', 'Nationwide', '321 Maple Lane, Capitol City', 6543210987);

INSERT INTO Victim (VictimID, FirstName, LastName, DateOfBirth, Gender, VictimAddress, VictimPhn) VALUES
(1, 'Alice', 'Brown', '1990-05-10', 'Female', '12 Elm Street, Cityville', 9123456780),
(2, 'Bob', 'Smith', '1985-11-22', 'Male', '34 Oak Avenue, Countyland', 9234567810),
(3, 'Carol', 'Johnson', '1978-03-15', 'Female', '56 Pine Road, Statecity', 9345678921),
(4, 'David', 'Lee', '1995-09-30', 'Male', '78 Maple Lane, Capitol City', 9456789032);

INSERT INTO Suspects (SuspectID, FirstName, LastName, DateOfBirth, Gender, SuspectAddress, SuspectPhn) VALUES
(1, 'Eve', 'Adams', '1988-07-19', 'Female', '90 Cedar Blvd, Cityville', 9567890143),
(2, 'Frank', 'White', '1992-12-05', 'Male', '123 Spruce St, Countyland', 9678901254),
(3, 'Grace', 'Martin', '1983-04-25', 'Female', '456 Birch Ave, Statecity', 9789012365),
(4, 'Hank', 'Green', '1975-08-18', 'Male', '789 Willow Rd, Capitol City', 9890123476);

INSERT INTO Officers (OfficerID, FirstName, LastName, BadgeNumber, Ranks, OfficerAddress, OfficerPhn, AgencyID) VALUES
(1, 'Ivy', 'Clark', 'B1234', 'Sergeant', '11 Redbud St, Cityville', 9001122334, 1),
(2, 'Jack', 'Lewis', 'B5678', 'Lieutenant', '22 Dogwood St, Countyland', 9002233445, 2),
(3, 'Kelly', 'Walker', 'B9101', 'Captain', '33 Aspen Ave, Statecity', 9003344556, 3),
(4, 'Liam', 'Hall', 'B1122', 'Chief', '44 Chestnut St, Capitol City', 9004455667, 4);

INSERT INTO Incidents (IncidentID, IncidentType, IncidentDate, Latitude, Longitude, Descriptions, VictimID, SuspectID, OfficerID, statuss) VALUES
(1, 'Robbery', '2024-04-01', 12.971598, 77.594566, 'Armed robbery at convenience store', 1, 1, 1, 'Open'),
(2, 'Assault', '2024-04-05', 28.704060, 77.102493, 'Physical assault reported', 2, 2, 2, 'Under Investigation'),
(3, 'Burglary', '2024-04-10', 19.076090, 72.877426, 'Home burglary', 3, 3, 3, 'Closed'),
(4, 'Fraud', '2024-04-15', 13.082680, 80.270718, 'Financial fraud case', 4, 4, 4, 'Open');

INSERT INTO Evidence (EvidenceID, Descriptions, LocationFound, IncidentID) VALUES
(1, 'CCTV footage', 'Convenience Store CCTV', 1),
(2, 'Bloody shirt', 'Victim residence', 2),
(3, 'Broken window glass', 'Crime scene backyard', 3),
(4, 'Fake documents', 'Office desk', 4);

INSERT INTO Reports (ReportID, IncidentID, ReportingOfficer, ReportDate, ReportDetail, statuss) VALUES
(1, 1, 1, '2024-04-02', 'Initial investigation started, suspect identified.', 'Draft'),
(2, 2, 2, '2024-04-06', 'Victim statements collected, suspect interrogated.', 'Finished'),
(3, 3, 3, '2024-04-11', 'Evidence analyzed, suspect arrested.', 'Finished'),
(4, 4, 4, '2024-04-16', 'Investigation ongoing, awaiting forensic reports.', 'Draft');





