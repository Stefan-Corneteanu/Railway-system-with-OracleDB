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