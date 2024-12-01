create table if not exists collision_crashes_def(
    accident_id SERIAL PRIMARY KEY,
    CRASH_DATE date not null,
    CRASH_TIME  time not null ,
    borough Varchar(30),
    zip_code CHAR(5),
    latitude NUMERIC(9,6),
    longitude NUMERIC(9,6),
    on_street_name	VARCHAR(100),
    cross_street_name	VARCHAR(100),
    off_street_name	VARCHAR(100),
    persons_injured	smallint,
    persons_killed	smallint,
    pedestrians_injured	smallint,
    pedestrians_killed	smallint,
    cyclists_injured	smallint,
    cyclists_killed	smallint,
    motorists_injured	smallint,
    motorists_killed	smallint,
    CONTRIBUTING_FACTOR_VEHICLE_1 VARCHAR(255),
    CONTRIBUTING_FACTOR_VEHICLE_2 VARCHAR(255),
    CONTRIBUTING_FACTOR_VEHICLE_3 VARCHAR(255),
    CONTRIBUTING_FACTOR_VEHICLE_4 VARCHAR(255),
    CONTRIBUTING_FACTOR_VEHICLE_5 VARCHAR(255),
    Constraint collision_crashes_def PRIMARY KEY(accident_id)
);
create table if not exists vehicles_def(
    vehicle_id	SERIAL PRIMARY KEY,
    state_registration CHAR(2),
    vehicle_type	VARCHAR(20),
    vehicle_make	VARCHAR(20),
    vehicle_model	VARCHAR(30),
    vehicle_year	smallint,
    Constraint vehicles_def PRIMARY KEY(vehicle_id)
);
Create table if not exists personas2_def(
    person_id SERIAL PRIMARY KEY,
    person_sex	CHAR(1),
    person_lastname	VARCHAR(20),
    person_firstname VARCHAR(20),
    person_phone	VARCHAR(15),
    person_address	VARCHAR(100),
    person_city	VARCHAR(30)	,
    person_state CHAR(2),
    person_zip	CHAR(5)	,
    person_ssn	CHAR(11),
    person_dob	DATE,
    Constraint personas2_def PRIMARY KEY(person_id)
);
CREATE TABLE IF NOT EXISTS collision_person_def (
    collision_person_id SERIAL PRIMARY KEY,
    accident_id INT,
    person_id INT,
    vehicle_id INT,
    person_type VARCHAR(20),
    person_sex CHAR(1),
    person_injury VARCHAR(50),
    person_age SMALLINT,
    ejection BOOLEAN,
    emotional_status VARCHAR(50),
    bodily_injury VARCHAR(50),
    position_in_vehicle VARCHAR(50),
    safety_equipment VARCHAR(50),
    ped_location VARCHAR(50),
    ped_action VARCHAR(50),
    COMPLAINT VARCHAR(255),
    ped_role VARCHAR(50),
    CONTRIBUTING_FACTOR_1 VARCHAR(255),
    CONTRIBUTING_FACTOR_2 VARCHAR(255),
    CONSTRAINT fk_accident FOREIGN KEY (accident_id) REFERENCES collision_crashes_def(accident_id),
    CONSTRAINT fk_person FOREIGN KEY (person_id) REFERENCES personas2_def(person_id),
    CONSTRAINT fk_vehicle FOREIGN KEY (vehicle_id) REFERENCES vehicles_def(vehicle_id)
);
CREATE TABLE IF NOT EXISTS collision_vehicles_def (
    collision_vehicle_id SERIAL PRIMARY KEY,
    accident_id INT,
    vehicle_id INT,
    travel_direction VARCHAR(50),
    vehicle_occupants SMALLINT,
    driver_sex CHAR(1),
    driver_license_status VARCHAR(20),
    driver_license_jurisdiction VARCHAR(50),
    pre_crash VARCHAR(50),
    point_of_impact VARCHAR(50),
    public_property_damage VARCHAR(100),
    public_property_damage_type VARCHAR(100),
    CONTRIBUTING_FACTOR_1 VARCHAR(255),
    CONTRIBUTING_FACTOR_2 VARCHAR(255),
    CONSTRAINT fk_accident FOREIGN KEY (accident_id) REFERENCES collision_crashes_def(accident_id),
    CONSTRAINT fk_vehicle FOREIGN KEY (vehicle_id) REFERENCES vehicles_def(vehicle_id)
);