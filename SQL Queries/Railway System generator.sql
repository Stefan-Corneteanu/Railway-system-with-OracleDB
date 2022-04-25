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
