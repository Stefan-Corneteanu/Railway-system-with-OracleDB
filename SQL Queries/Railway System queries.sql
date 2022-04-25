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
