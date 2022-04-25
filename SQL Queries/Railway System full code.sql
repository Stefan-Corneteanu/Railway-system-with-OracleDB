--Drop the tables if they exist
DROP TABLE COMPANY CASCADE CONSTRAINTS;
DROP TABLE OCCUPATIONS CASCADE CONSTRAINTS;
DROP TABLE PRIORITY CASCADE CONSTRAINTS;
DROP TABLE REGION CASCADE CONSTRAINTS;
DROP TABLE ROUTECK CASCADE CONSTRAINTS;
DROP TABLE ROUTE CASCADE CONSTRAINTS;
DROP TABLE TARRIFS CASCADE CONSTRAINTS;
DROP TABLE TRACKMAINTENANCE CASCADE CONSTRAINTS;
DROP TABLE TRAINMAINTENANCE CASCADE CONSTRAINTS;
DROP TABLE TRAVELTYPE CASCADE CONSTRAINTS;
DROP TABLE USERTABLECK CASCADE CONSTRAINTS;
DROP TABLE USERTABLE CASCADE CONSTRAINTS;
DROP TABLE WAGONMAINTENANCE CASCADE CONSTRAINTS;
DROP TABLE WAGON CASCADE CONSTRAINTS;
DROP TABLE TRAINSCHEDULE CASCADE CONSTRAINTS;
DROP TABLE TOWN CASCADE CONSTRAINTS;
DROP TABLE STATION CASCADE CONSTRAINTS;
DROP TABLE TRACKS CASCADE CONSTRAINTS;
DROP TABLE TRAIN CASCADE CONSTRAINTS;
DROP TABLE TICKET CASCADE CONSTRAINTS;
DROP TABLE PASSENGER CASCADE CONSTRAINTS;
DROP TABLE TRAINSTAFF CASCADE CONSTRAINTS;

--Create tables

CREATE TABLE Tarrifs ("tarrifs_id" NUMBER(4) CONSTRAINT "tarrifs_id_PK" PRIMARY KEY,
"standard" NUMBER(3),
"discount" NUMBER(3),
"subscription" NUMBER(4),
"cabin" NUMBER(4),
"group_discount" NUMBER(5)
);

CREATE TABLE TravelType (
"travel_type_id" NUMBER(3,0) CONSTRAINT "traveltype_id_PK" PRIMARY KEY,
"is_twoway" NUMBER(1,0) CONSTRAINT "istwoway_nn" NOT NULL ENABLE,
"tarrif" VARCHAR(20)
);

CREATE TABLE Region ("region_id" varchar(4) CONSTRAINT "region_id_PK" PRIMARY KEY,
"region_name" varchar(15)
);

CREATE TABLE Priority ("priority_code" int CONSTRAINT "priority_code_PK" PRIMARY KEY,
"main_priority" varchar(4),
"branch_priority" varchar(6),
"freight_priority" varchar(7)
);

CREATE TABLE TrainMaintenance (
"train_maintenance_code" int CONSTRAINT "trainmaintenance_code_PK" PRIMARY KEY,
"good_state" VARCHAR(4),
"acceptable_state" VARCHAR(10),
"damaged_state" VARCHAR(7),
"in_repair" VARCHAR(6)
);

CREATE TABLE TrackMaintenance (
"track_maintenance_code" int CONSTRAINT "track_maintenance_code_PK" PRIMARY KEY,
"good_state" varchar(4),
"damaged_state" varchar(7),
"obstacles_in_path" varchar(9),
"in_construction" varchar(14),
"in_repair" varchar(6),
"missing" varchar(7)
);

CREATE TABLE WagonMaintenance ("wagon_maintenance_code" NUMBER(4) CONSTRAINT "wagonmaintenance_code_PK" PRIMARY KEY,
"good_state" varchar(4),
"bad_state" varchar(3),
"in_repair" varchar(6)
);

CREATE TABLE Company ("company_id" NUMBER(3) CONSTRAINT "company_id_PK" PRIMARY KEY,
"company_name" varchar(30),
"is_private" NUMBER(1,0) CONSTRAINT "isprivate_nn" NOT NULL ENABLE
);

CREATE TABLE Occupations ("occupation_id" NUMBER(2) CONSTRAINT "occupation_id_PK" PRIMARY KEY,
"occupation_name" varchar(12),
"salary" int
);


CREATE TABLE UserTableCK ("user_CK_id" NUMBER(3) CONSTRAINT "userck_id_PK" PRIMARY KEY,
"hashed_password" varchar(30) CONSTRAINT "hashedpassword_nn" NOT NULL ENABLE,
"email" varchar(25) CONSTRAINT "email_nn" NOT NULL ENABLE
);

CREATE TABLE RouteCK ("route_CK_id" NUMBER(3) CONSTRAINT "routeck_id_PK" PRIMARY KEY,
"start_station" varchar(50),
"stop_station" varchar(50),
"via" varchar(50)
);

CREATE TABLE UserTable ("user_id" NUMBER(10) CONSTRAINT "user_id_PK" PRIMARY KEY,
"name" varchar(30) CONSTRAINT "name_nn" NOT NULL ENABLE,
"user_CK_id" NUMBER(3)
);

CREATE TABLE Route ("route_id" int CONSTRAINT "route_id_PK" PRIMARY KEY,
"route_CK_id" NUMBER(3),
"is_available" NUMBER(1)
);

CREATE TABLE TrainSchedule ("ts_id" VARCHAR(20) CONSTRAINT "trainschedule_ts_id_PK" PRIMARY KEY,
"start_hour" VARCHAR(6),
"stop_hour" VARCHAR(6),
"delay" VARCHAR(6),
"route_id" NUMBER(10)
);

CREATE TABLE Town ("town_id" int CONSTRAINT "town_id_PK" PRIMARY KEY,
"town_name" varchar(30),
"region_id" varchar(4)
);

CREATE TABLE Station ("station_id" varchar(50) CONSTRAINT "station_id_PK" PRIMARY KEY,
"station_name" varchar(50) CONSTRAINT "station_name_nn" NOT NULL ENABLE,
"no_tracks" int CONSTRAINT "no_tracks_nn" NOT NULL ENABLE,
"town_id" int
);


CREATE TABLE Tracks ("tracks_id" NUMBER(10) CONSTRAINT "tracks_id_PK" PRIMARY KEY,
"is_electrified" NUMBER(1,0) CONSTRAINT "is_electrified_nn" NOT NULL ENABLE,
"track_maintenance_code" int,
"station1_id" varchar(50),
"station2_id" varchar(50),
"priority_code" NUMBER(3)
);

CREATE TABLE Train ("train_id" varchar(10) CONSTRAINT "train_id_PK" PRIMARY KEY, 
"no_wagons" NUMBER(30), 
"type_of_train" varchar(50), 
"train_class" varchar(3) CONSTRAINT "train_class_nn" NOT NULL ENABLE, 
"train_schedule_id" VARCHAR(20),
"current_station" varchar(50),
"train_maintenance_code" NUMBER(3)
);


CREATE TABLE Ticket ("ticket_id" NUMBER(10) CONSTRAINT "ticket_id_PK" PRIMARY KEY,
"date_of_departure" VARCHAR(10),
"date_of_arrival" VARCHAR(10),
"tarrifs_id" NUMBER(4),
"travel_type_id" NUMBER(3),
"user_id" NUMBER(10),
"train_id" varchar(10),
"station1_id" varchar(50),
"station2_id" varchar(50)
);

CREATE TABLE Passenger ("passenger_id" NUMBER(10) CONSTRAINT "passenger_id_PK" PRIMARY KEY,
"train_id" varchar(10),
"ticket_id" NUMBER(10),
"user_id" NUMBER(10)
);


CREATE TABLE Wagon ("wagon_id" NUMBER(5) CONSTRAINT "wagon_id_PK" PRIMARY KEY,
"wagon_class" varchar(3),
"no_seats" NUMBER(30),
"wagon_maintenance_code" NUMBER(4),
"train_id" varchar(10)
);




CREATE TABLE TrainStaff ("staff_id" NUMBER(3) CONSTRAINT "staff_id_PK" PRIMARY KEY,
"staff_name" VARCHAR(30) CONSTRAINT "staff_name_nn" NOT NULL ENABLE,
"staff_company" NUMBER(3),
"occupation_id" NUMBER(2),
"train_id" varchar(10)
);

--add foreign keys

ALTER TABLE UserTable ADD CONSTRAINT "user_ck_FK" FOREIGN KEY ("user_CK_id") REFERENCES UserTableCK("user_CK_id") ENABLE;

ALTER TABLE Route ADD CONSTRAINT "route_ck_FK" FOREIGN KEY ("route_CK_id") REFERENCES RouteCK("route_CK_id") ENABLE;

ALTER TABLE Town ADD CONSTRAINT "town_region_id_FK" FOREIGN KEY ("region_id") REFERENCES Region ("region_id") ENABLE;

ALTER TABLE TrainSchedule ADD CONSTRAINT "trainschedule_route_id_FK" FOREIGN KEY ("route_id") REFERENCES Route ("route_id") ENABLE;

ALTER TABLE Station ADD CONSTRAINT "station_town_id_FK" FOREIGN KEY ("town_id") REFERENCES Town ("town_id") ENABLE;

ALTER TABLE Tracks ADD CONSTRAINT "tracks_station_id_FK1" FOREIGN KEY ("station1_id") REFERENCES Station ("station_id") ENABLE;

ALTER TABLE Tracks ADD CONSTRAINT "tracks_station_id_FK2" FOREIGN KEY ("station2_id") REFERENCES Station ("station_id") ENABLE;

ALTER TABLE Tracks ADD CONSTRAINT "tracks_priority_code_FK" FOREIGN KEY ("priority_code") REFERENCES Priority ("priority_code") ENABLE;

ALTER TABLE Tracks ADD CONSTRAINT "tracks_tm_code_FK" FOREIGN KEY ("track_maintenance_code") REFERENCES TrackMaintenance ("track_maintenance_code") ENABLE;

ALTER TABLE Train ADD CONSTRAINT "train_trainschedule_ts_id_FK" FOREIGN KEY ("train_schedule_id") REFERENCES TrainSchedule ("ts_id") ENABLE;

ALTER TABLE Train ADD CONSTRAINT "train_station_station_id_FK" FOREIGN KEY ("current_station") REFERENCES Station ("station_id") ENABLE;

ALTER TABLE Train ADD CONSTRAINT "train_tm_code_FK" FOREIGN KEY ("train_maintenance_code") REFERENCES TrainMaintenance ("train_maintenance_code") ENABLE;

ALTER TABLE Ticket ADD CONSTRAINT "ticket_tarrifs_id_FK" FOREIGN KEY ("tarrifs_id") REFERENCES Tarrifs("tarrifs_id") ENABLE;

ALTER TABLE Ticket ADD CONSTRAINT "ticket_traveltype_id_FK" FOREIGN KEY ("travel_type_id") REFERENCES TravelType ("travel_type_id") ENABLE;

ALTER TABLE Ticket ADD CONSTRAINT "ticket_train_id_FK" FOREIGN KEY ("train_id") REFERENCES Train ("train_id") ENABLE;

ALTER TABLE Ticket ADD CONSTRAINT "ticket_user_id_FK" FOREIGN KEY ("user_id") REFERENCES UserTable ("user_id") ENABLE;

ALTER TABLE Ticket ADD CONSTRAINT "ticket_station1_id_FK" FOREIGN KEY ("station1_id") REFERENCES Station ("station_id") ENABLE;

ALTER TABLE Ticket ADD CONSTRAINT "ticket_station2_id_FK" FOREIGN KEY ("station2_id") REFERENCES Station ("station_id") ENABLE;

ALTER TABLE Passenger ADD CONSTRAINT "passenger_train_id_FK" FOREIGN KEY ("train_id") REFERENCES Train ("train_id") ENABLE;

ALTER TABLE Passenger ADD CONSTRAINT "passenger_ticket_id_FK" FOREIGN KEY ("ticket_id") REFERENCES Ticket ("ticket_id") ENABLE;

ALTER TABLE Passenger ADD CONSTRAINT "passenger_user_id_FK" FOREIGN KEY ("user_id") REFERENCES UserTable ("user_id") ENABLE;

ALTER TABLE Wagon ADD  CONSTRAINT "wagon_wagonmaintenance_code_FK" FOREIGN KEY ("wagon_maintenance_code")
REFERENCES WagonMaintenance ("wagon_maintenance_code") ENABLE;

ALTER TABLE Wagon ADD CONSTRAINT "wagon_train_id_FK" FOREIGN KEY ("train_id") REFERENCES Train ("train_id") ENABLE;

ALTER TABLE TrainStaff ADD CONSTRAINT "trainstaff_company_id_FK" FOREIGN KEY ("staff_company") REFERENCES Company ("company_id") ENABLE;

ALTER TABLE TrainStaff ADD CONSTRAINT "trainstaff_occupations_id_FK" FOREIGN KEY ("occupation_id") REFERENCES Occupations ("occupation_id") ENABLE;

ALTER TABLE TrainStaff ADD CONSTRAINT "trainstaff_train_id_FK" FOREIGN KEY ("train_id") REFERENCES Train ("train_id") ENABLE;

-- Populate Tables

-- Populate Tariffs table
INSERT INTO Tarrifs ("tarrifs_id", "standard", "discount", "subscription", "cabin", "group_discount")
VALUES (10, 75, 30, 120, 90, 140);

INSERT INTO Tarrifs ("tarrifs_id", "standard", "discount", "subscription", "cabin", "group_discount")
VALUES (11, 115, 50, 175, 130, 200);

INSERT INTO Tarrifs ("tarrifs_id", "standard", "discount", "subscription", "cabin", "group_discount")
VALUES (12, 400, 200, 500, 430, 750);

INSERT INTO Tarrifs ("tarrifs_id", "standard", "discount", "subscription", "cabin", "group_discount")
VALUES (13, 150, 75, 240, 200, 700);

INSERT INTO Tarrifs ("tarrifs_id", "standard", "discount", "subscription", "cabin", "group_discount")
VALUES (14, 900, 450, 1300, 1100, 1500);

-- Populate TravelType
INSERT INTO TravelType ("travel_type_id", "is_twoway", "tarrif")
VALUES (20, 0, 'standard');

INSERT INTO TravelType ("travel_type_id", "is_twoway", "tarrif")
VALUES (21, 1, 'discount');

INSERT INTO TravelType ("travel_type_id", "is_twoway", "tarrif")
VALUES (22, 0, 'subscription');

INSERT INTO TravelType ("travel_type_id", "is_twoway", "tarrif")
VALUES (23, 1, 'cabin');

INSERT INTO TravelType ("travel_type_id", "is_twoway", "tarrif")
VALUES (24, 0, 'group_discount');

-- Populate Region
INSERT INTO Region ("region_id", "region_name")
VALUES ('MT', 'Muntenia');

INSERT INTO Region ("region_id", "region_name")
VALUES ('OT', 'Oltenia');

INSERT INTO Region ("region_id", "region_name")
VALUES ('BN', 'Banat');

INSERT INTO Region ("region_id", "region_name")
VALUES ('TS', 'Transilvania');

INSERT INTO Region ("region_id", "region_name")
VALUES ('MD', 'Moldova');

INSERT INTO Region ("region_id", "region_name")
VALUES ('DB', 'Dobrogea');

--Populate PRIORITY
INSERT INTO Priority ("priority_code", "main_priority", "branch_priority", "freight_priority")
VALUES (40, 'main', null, null);

INSERT INTO Priority ("priority_code", "main_priority", "branch_priority", "freight_priority")
VALUES (41, null, 'branch', null);

INSERT INTO Priority ("priority_code", "main_priority", "branch_priority", "freight_priority")
VALUES (42, null, null, 'freight');


-- Populate TrainMaintenance
INSERT INTO TrainMaintenance ("train_maintenance_code", "good_state", "acceptable_state", "damaged_state", "in_repair")
VALUES (111, 'good', null, null, null);

INSERT INTO TrainMaintenance ("train_maintenance_code", "good_state", "acceptable_state", "damaged_state", "in_repair")
VALUES (222, null, 'acceptable', null, null);

INSERT INTO TrainMaintenance ("train_maintenance_code", "good_state", "acceptable_state", "damaged_state", "in_repair")
VALUES (223, null, 'acceptable', null, 'repair');

INSERT INTO TrainMaintenance ("train_maintenance_code", "good_state", "acceptable_state", "damaged_state", "in_repair")
VALUES (333, null, null, 'damaged', null);

INSERT INTO TrainMaintenance ("train_maintenance_code", "good_state", "acceptable_state", "damaged_state", "in_repair")
VALUES (334, null, null, 'damaged', 'repair');


-- Populate TrackMaintenance
INSERT INTO TrackMaintenance ("track_maintenance_code", "good_state", "damaged_state", "obstacles_in_path", "in_construction", "in_repair", "missing")
VALUES (6340, 'good', null, null, null, null, null);

INSERT INTO TrackMaintenance ("track_maintenance_code", "good_state", "damaged_state", "obstacles_in_path", "in_construction", "in_repair", "missing")
VALUES (6342, null, 'damaged', null, null, 'repair', null);

INSERT INTO TrackMaintenance ("track_maintenance_code", "good_state", "damaged_state", "obstacles_in_path", "in_construction", "in_repair", "missing")
VALUES (6345, null, null, 'obstacles', null, 'repair', null);

INSERT INTO TrackMaintenance ("track_maintenance_code", "good_state", "damaged_state", "obstacles_in_path", "in_construction", "in_repair", "missing")
VALUES (6346, null, null, null, 'construction', null, null);

INSERT INTO TrackMaintenance ("track_maintenance_code", "good_state", "damaged_state", "obstacles_in_path", "in_construction", "in_repair", "missing")
VALUES (6347, null, null, null, null, null, 'missing');


--Populate WagonMaintenance
INSERT INTO WagonMaintenance ("wagon_maintenance_code", "good_state", "bad_state", "in_repair")
VALUES (2320, 'good', null, null);

INSERT INTO WagonMaintenance ("wagon_maintenance_code", "good_state", "bad_state", "in_repair")
VALUES (2330, null, 'bad', null);

INSERT INTO WagonMaintenance ("wagon_maintenance_code", "good_state", "bad_state", "in_repair")
VALUES (2340, null, null, 'repair');

INSERT INTO WagonMaintenance ("wagon_maintenance_code", "good_state", "bad_state", "in_repair")
VALUES (2350, null, 'bad', 'repair');

--Populate COMPANY
INSERT INTO Company ("company_id", "company_name", "is_private")
VALUES (1, 'CFR', 0);

INSERT INTO Company ("company_id", "company_name", "is_private")
VALUES (2, 'Electroputere', 0);

INSERT INTO Company ("company_id", "company_name", "is_private")
VALUES (3, 'Softrans', 1);

INSERT INTO Company ("company_id", "company_name", "is_private")
VALUES (4, 'Astra Trans', 1);

INSERT INTO Company ("company_id", "company_name", "is_private")
VALUES (5, 'Regio Calatori', 1);

--Populate Occupations
INSERT INTO Occupations ("occupation_id", "occupation_name", "salary")
VALUES (10, 'CEO', 10000);

INSERT INTO Occupations ("occupation_id", "occupation_name", "salary")
VALUES (20, 'conductor', 4500);

INSERT INTO Occupations ("occupation_id", "occupation_name", "salary")
VALUES (30, 'mechanic', 5000);

INSERT INTO Occupations ("occupation_id", "occupation_name", "salary")
VALUES (40, 'announcer', 3900);

INSERT INTO Occupations ("occupation_id", "occupation_name", "salary")
VALUES (50, 'sales agent', 3200);

--Populate UserTableCK
INSERT INTO UserTableCK ("user_CK_id", "hashed_password", "email")
VALUES (100, 'e41668dc898d663a8cbc', 'A_predesel@yahoo.com');

INSERT INTO UserTableCK ("user_CK_id", "hashed_password", "email")
VALUES (101, '8af56f778ff05b1804e', 'NarcisaD1301@gmail.com');

INSERT INTO UserTableCK ("user_CK_id", "hashed_password", "email")
VALUES (102, 'bfcc32fcc0c3a8a2dff2', 'AlexBradoianu@yahoo.com');

INSERT INTO UserTableCK ("user_CK_id", "hashed_password", "email")
VALUES (103, 'd9ea180ac884ea862f166', 'Walter.S@gmail.com');

INSERT INTO UserTableCK ("user_CK_id", "hashed_password", "email")
VALUES (104, '5c2e8d03983cb4919c06', 'A_Bianca@yahoo.com');

--Populate RouteCK
INSERT INTO RouteCK ("route_CK_id", "start_station", "stop_station", "via")
VALUES (1, 'Bucuresti_Nord', 'Timisoara', 'Videle');

INSERT INTO RouteCK ("route_CK_id", "start_station", "stop_station", "via")
VALUES (2, 'Bucuresti_Nord', 'Constanta', null);

INSERT INTO RouteCK ("route_CK_id", "start_station", "stop_station", "via")
VALUES (3, 'Bucuresti_Nord', 'Sibiu', 'Ploiesti');

INSERT INTO RouteCK ("route_CK_id", "start_station", "stop_station", "via")
VALUES (4, 'Bucuresti_Nord', 'Iasi', 'Buzau');

INSERT INTO RouteCK ("route_CK_id", "start_station", "stop_station", "via")
VALUES (5, 'Bucuresti_Nord', 'Timisoara', 'Pitesti');

--Populate UserTable
INSERT INTO UserTable ("user_id", "name", "user_CK_id")
VALUES (0, 'Andrei Predesel', 100);

INSERT INTO UserTable ("user_id", "name", "user_CK_id")
VALUES (1, 'Narcisa Dagadita', 101);

INSERT INTO UserTable ("user_id", "name", "user_CK_id")
VALUES (2, 'Alexandru Bradoianu', 102);

INSERT INTO UserTable ("user_id", "name", "user_CK_id")
VALUES (3, 'Walter Smarandache', 103);

INSERT INTO UserTable ("user_id", "name", "user_CK_id")
VALUES (4, 'Antonescu Bianca', 104);

--Populate Route
INSERT INTO Route ("route_id", "route_CK_id", "is_available")
VALUES (101, 1, 1);

INSERT INTO Route ("route_id", "route_CK_id", "is_available")
VALUES (102, 2, 1);

INSERT INTO Route ("route_id", "route_CK_id", "is_available")
VALUES (103, 3, 1);

INSERT INTO Route ("route_id", "route_CK_id", "is_available")
VALUES (104, 4, 1);

INSERT INTO Route ("route_id", "route_CK_id", "is_available")
VALUES (105, 5, 1);

--Populate TrainSchedule
INSERT INTO TrainSchedule ("ts_id", "start_hour", "stop_hour", "delay", "route_id")
VALUES ('IR41s', '08:00', '20:00', '00:15', 101);

INSERT INTO TrainSchedule ("ts_id", "start_hour", "stop_hour", "delay", "route_id")
VALUES ('IR20s', '04:00', '19:30', '00:00', 102);

INSERT INTO TrainSchedule ("ts_id", "start_hour", "stop_hour", "delay", "route_id")
VALUES ('R32s', '07:30', '23:00', '00:10', 103);

INSERT INTO TrainSchedule ("ts_id", "start_hour", "stop_hour", "delay", "route_id")
VALUES ('R67s', '07:00', '20:00', '00:00', 104);

INSERT INTO TrainSchedule ("ts_id", "start_hour", "stop_hour", "delay", "route_id")
VALUES ('IR42s', '08:30', '20:45', '01:00', 105);

--Populate Town
INSERT INTO Town ("town_id", "town_name", "region_id")
VALUES (301, 'Bucuresti', 'MT');

INSERT INTO Town ("town_id", "town_name", "region_id")
VALUES (302, 'Constanta', 'DB');

INSERT INTO Town ("town_id", "town_name", "region_id")
VALUES (303, 'Timisoara', 'BN');

INSERT INTO Town ("town_id", "town_name", "region_id")
VALUES (304, 'Sibiu', 'TS');

INSERT INTO Town ("town_id", "town_name", "region_id")
VALUES (305, 'Iasi', 'MD');

--Populate Station
INSERT INTO Station ("station_id", "station_name", "no_tracks", "town_id")
VALUES ('BNordStation', 'Bucuresti Nord', 20, 301);

INSERT INTO Station ("station_id", "station_name", "no_tracks", "town_id")
VALUES ('CTStation', 'Constanta', 15, 302);

INSERT INTO Station ("station_id", "station_name", "no_tracks", "town_id")
VALUES ('TMStation', 'Timisoara', 15, 303);

INSERT INTO Station ("station_id", "station_name", "no_tracks", "town_id")
VALUES ('SBStation', 'Sibiu', 10, 304);

INSERT INTO Station ("station_id", "station_name", "no_tracks", "town_id")
VALUES ('ISStation', 'Iasi', 10, 305);

--Populate Tracks
INSERT INTO Tracks ("tracks_id", "is_electrified", "track_maintenance_code", "station1_id", "station2_id", "priority_code")
VALUES (401, 1, 6340, 'BNordStation', 'TMStation', 40);

INSERT INTO Tracks ("tracks_id", "is_electrified", "track_maintenance_code", "station1_id", "station2_id", "priority_code")
VALUES (402, 1, 6342, 'BNordStation', 'CTStation', 40);

INSERT INTO Tracks ("tracks_id", "is_electrified", "track_maintenance_code", "station1_id", "station2_id", "priority_code")
VALUES (403, 1, 6345, 'BNordStation', 'SBStation', 41);

INSERT INTO Tracks ("tracks_id", "is_electrified", "track_maintenance_code", "station1_id", "station2_id", "priority_code")
VALUES (404, 1, 6346, 'BNordStation', 'ISStation', 41);

INSERT INTO Tracks ("tracks_id", "is_electrified", "track_maintenance_code", "station1_id", "station2_id", "priority_code")
VALUES (405, 1, 6347, 'BNordStation', 'TMStation', 42);

--Populate Train
INSERT INTO Train ("train_id", "no_wagons", "type_of_train", "train_class", "train_schedule_id", "current_station", "train_maintenance_code")
VALUES ('IR41', 3, 'people', 'E1', 'IR41s', 'BNordStation', 111);

INSERT INTO Train ("train_id", "no_wagons", "type_of_train", "train_class", "train_schedule_id", "current_station", "train_maintenance_code")
VALUES ('IR20', 4, 'people', 'E1', 'IR20s', 'BNordStation', 222);

INSERT INTO Train ("train_id", "no_wagons", "type_of_train", "train_class", "train_schedule_id", "current_station", "train_maintenance_code")
VALUES ('R32', 20, 'freight', 'E2', 'R32s', 'SBStation', 223);

INSERT INTO Train ("train_id", "no_wagons", "type_of_train", "train_class", "train_schedule_id", "current_station", "train_maintenance_code")
VALUES ('R67', 30, 'freight', 'E3', 'R67s', 'ISStation', 333);

INSERT INTO Train ("train_id", "no_wagons", "type_of_train", "train_class", "train_schedule_id", "current_station", "train_maintenance_code")
VALUES ('IR42', 5, 'people', 'E1', 'IR42s', 'TMStation', 334);

--Populate Ticket
INSERT INTO Ticket ("ticket_id", "date_of_departure", "date_of_arrival", "tarrifs_id", "travel_type_id", "user_id", "train_id", "station1_id", "station2_id")
VALUES (601, '15.12.2020', '16.12.2020', 10, 20, 0, 'IR41', 'BNordStation', 'TMStation'); 

INSERT INTO Ticket ("ticket_id", "date_of_departure", "date_of_arrival", "tarrifs_id", "travel_type_id", "user_id", "train_id", "station1_id", "station2_id")
VALUES (602, '17.12.2020', '17.12.2020', 11, 21, 1, 'IR20', 'BNordStation', 'CTStation'); 

INSERT INTO Ticket ("ticket_id", "date_of_departure", "date_of_arrival", "tarrifs_id", "travel_type_id", "user_id", "train_id", "station1_id", "station2_id")
VALUES (603, '20.12.2020', '20.12.2020', 12, 20, 2, 'IR42', 'BNordStation', 'SBStation'); 

INSERT INTO Ticket ("ticket_id", "date_of_departure", "date_of_arrival", "tarrifs_id", "travel_type_id", "user_id", "train_id", "station1_id", "station2_id")
VALUES (604, '5.1.2021', '6.1.2021', 13, 21, 3, 'IR41', 'BNordStation', 'ISStation'); 

INSERT INTO Ticket ("ticket_id", "date_of_departure", "date_of_arrival", "tarrifs_id", "travel_type_id", "user_id", "train_id", "station1_id", "station2_id")
VALUES (605, '6.1.2021', '6.1.2021', 14, 21, 4, 'IR42', 'BNordStation', 'TMStation'); 

--Populate Passenger
INSERT INTO Passenger ("passenger_id", "train_id", "ticket_id", "user_id")
VALUES (701, 'IR41', 601, 0);

INSERT INTO Passenger ("passenger_id", "train_id", "ticket_id", "user_id")
VALUES (702, 'IR20', 602, 1);

INSERT INTO Passenger ("passenger_id", "train_id", "ticket_id", "user_id")
VALUES (703, 'IR42', 603, 2);

INSERT INTO Passenger ("passenger_id", "train_id", "ticket_id", "user_id")
VALUES (704, 'IR42', 604, 3);

INSERT INTO Passenger ("passenger_id", "train_id", "ticket_id", "user_id")
VALUES (705, 'IR20', 605, 4);

--Populate Wagon
INSERT INTO Wagon ("wagon_id", "wagon_class", "no_seats", "wagon_maintenance_code", "train_id")
VALUES (801, 'P1', 80, 2320, 'IR41');

INSERT INTO Wagon ("wagon_id", "wagon_class", "no_seats", "wagon_maintenance_code", "train_id")
VALUES (802, 'P2', 160, 2330, 'IR20');

INSERT INTO Wagon ("wagon_id", "wagon_class", "no_seats", "wagon_maintenance_code", "train_id")
VALUES (803, 'CG', 0, 2340, 'R32');

INSERT INTO Wagon ("wagon_id", "wagon_class", "no_seats", "wagon_maintenance_code", "train_id")
VALUES (804, 'CC', 0, 2350, 'R67');

INSERT INTO Wagon ("wagon_id", "wagon_class", "no_seats", "wagon_maintenance_code", "train_id")
VALUES (805, 'P1', 80, 2320, 'IR42');

--Populate TrainStaff
INSERT INTO TrainStaff ("staff_id", "staff_name", "staff_company", "occupation_id", "train_id")
VALUES (901, 'Popa Daniel', 1, 10, 'IR41');

INSERT INTO TrainStaff ("staff_id", "staff_name", "staff_company", "occupation_id", "train_id")
VALUES (902, 'Papuc Cosmin', 2, 20, 'IR20');

INSERT INTO TrainStaff ("staff_id", "staff_name", "staff_company", "occupation_id", "train_id")
VALUES (903, 'Dragos Robert', 3, 30, 'R32');

INSERT INTO TrainStaff ("staff_id", "staff_name", "staff_company", "occupation_id", "train_id")
VALUES (904, 'Marcu Vasile', 4, 40, 'R67');

INSERT INTO TrainStaff ("staff_id", "staff_name", "staff_company", "occupation_id", "train_id")
VALUES (905, 'Ionescu Carmen', 5, 50, 'IR42');

--QUERIES

--1 Show all functional trains having assignated disfunctional wagons (joins Wagon, Wagonmaintenancecode, Train, Trainmaintenancecode)
SELECT DISTINCT tr."train_id"
FROM Train tr
JOIN TrainMaintenance trm
ON (tr."train_maintenance_code" = trm."train_maintenance_code")
JOIN Wagon w
ON (tr."train_id" = w."train_id")
JOIN WagonMaintenance wm
ON (w."wagon_maintenance_code" = w."wagon_maintenance_code")
WHERE (trm."train_maintenance_code" IN (111, 222) AND wm."wagon_maintenance_code" IN (2330, 2340, 2350));

--2 Walter Smarandache wants to travel from Bucharest to (whatever station he goes to). Can he travel? (joins user, ticket, train, trainmaintenancecode, station, tracks, trackmaintenancecode)
SELECT u."name", CASE trm."train_maintenance_code"
WHEN 111 THEN 'The train is functional'
WHEN 222 THEN 'The train is functional'
ELSE 'The train is disfunctional'
END
||' and '||
CASE tkm."track_maintenance_code"
WHEN 6340 THEN 'the track is in good state'
ELSE 'the track is unusable'
END
AS "Voyage possibility"
FROM UserTable u
JOIN Ticket ti
ON (u."user_id" = ti."user_id")
JOIN Train tr
ON (ti."train_id" = tr."train_id")
JOIN TrainMaintenance trm
ON (tr."train_maintenance_code" = trm."train_maintenance_code")
JOIN Station s
ON (s."station_id" = ti."station2_id")
JOIN Tracks tk
ON (s."station_id" = tk."station2_id")
JOIN TrackMaintenance tkm
ON (tk."track_maintenance_code" = tkm."track_maintenance_code")
WHERE (u."name" = 'Walter Smarandache');

--3 based on the main priority lines, show the inaccessible stations (joins tracks, trackmaintenancecode, stations, priority)
SELECT s."station_name", CASE tm."track_maintenance_code"
WHEN 6340 THEN 'Available'
ELSE 'Not Available' END
AS "Main Track Availability"
FROM Station s
JOIN Tracks t
ON (s."station_id" = t."station2_id")
JOIN TrackMaintenance tm
ON (t."track_maintenance_code" = tm."track_maintenance_code")
JOIN Priority p
ON (t."priority_code" = p."priority_code")
WHERE (p."priority_code" = 40);

--4 show all companies having malfunctioning trains (joins company, staff, train, trainmaintenancecode)
SELECT c."company_name"
FROM Company c
JOIN TrainStaff ts
ON (ts."staff_company" = c."company_id")
JOIN Train tr
ON (tr."train_id" = ts."train_id")
JOIN TrainMaintenance tm
ON (tm."train_maintenance_code" = tr."train_maintenance_code")
WHERE (tm."train_maintenance_code" IN (223, 333, 334));


--5 check for each user if the ticket he bought is for a functional train or not (joins User cu Ticket cu Train cu Trainmaintenancecode)
SELECT u."name", CASE tm."train_maintenance_code"
WHEN 111 THEN 'functional train'
WHEN 222 THEN 'functional train'
ELSE 'disfunctional train'
END
AS "train availability"
FROM UserTable u
JOIN Ticket ti
ON (u."user_id" = ti."user_id")
JOIN Train tr
ON (ti."train_id" = tr."train_id")
JOIN TrainMaintenance tm
ON (tr."train_maintenance_code" = tm."train_maintenance_code");

--6 Describe the ticket bought by Narcisa Dagadita (joins user, ticket, traveltype, tarrifs)
SELECT u."name"||' has bought the ticket with the ID '|| ti."ticket_id"||' which is '|| CASE tt."is_twoway"
WHEN 1 THEN 'two way'
ELSE 'one way'
END
||' and '|| tt."tarrif"||' costing '|| CASE tt."tarrif"
WHEN 'standard' THEN tar."standard"
WHEN 'discount' THEN tar."discount"
WHEN 'subscription' THEN tar."subscription"
WHEN 'cabin' THEN tar."cabin"
WHEN 'group_discount' THEN tar."group_discount"
END
||' lei'
AS "ticket analysis"
FROM UserTable u
JOIN ticket ti
ON (ti."user_id" = u."user_id")
JOIN TravelType tt
ON (ti."travel_type_id" = tt."travel_type_id")
JOIN Tarrifs tar
ON (ti."tarrifs_id" = tar."tarrifs_id")
WHERE (u."name" = 'Narcisa Dagadita');

--7 describe employee Ionescu Carmen  (joins trainstaff, occupations, train, company)
SELECT ts."staff_name"||' works as '|| o."occupation_name" ||' for the company '||c."company_name" || ' at the train ' || tr."train_id" AS "employee analysis"
FROM TrainStaff ts
JOIN Company c
ON (ts."staff_company" = c."company_id")
JOIN Occupations o
ON (ts."occupation_id" = o."occupation_id")
JOIN Train tr
on (ts."train_id" = tr."train_id")
WHERE (ts."staff_name" = 'Ionescu Carmen');

--8 describe a passenger based on their ID 
SELECT u."name"||' bought the ticket with the ID '|| ti."ticket_id"||' for the train with the ID '|| tr."train_id" AS "Passenger Analysis"
FROM Passenger p
JOIN UserTable u
ON (p."user_id" = u."user_id")
JOIN Ticket ti
ON (p."ticket_id" = ti."ticket_id")
JOIN Train tr
ON (p."train_id" = tr."train_id")
WHERE (p."passenger_id" = 701);

--9 Which line goes to Constanta (region)? (joins tracks, station, city, region)
SELECT "tracks_id"
FROM Tracks tr
JOIN Station s
ON (tr."station2_id" = s."station_id")
JOIN Town tw
ON (tw."town_id" = s."town_id")
JOIN Region r
ON (r."region_id" = tw."region_id")
WHERE (r."region_id" = 'DB');

--10 Show all staff members of CFR working at functional trains (joins trainstaff, train, occupations, trainmaintenance)
SELECT "staff_name"
FROM TrainStaff ts
JOIN Company c
ON (ts."staff_company" = c."company_id")
JOIN Train tr
ON (tr."train_id" = ts."train_id")
JOIN TrainMaintenance tm
ON (tr."train_maintenance_code" = tm."train_maintenance_code")
WHERE (c."company_name" = 'CFR' AND (tm."train_maintenance_code" = 111 OR tm."train_maintenance_code" = 222));
