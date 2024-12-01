create database PECL2;
create schema if not exists final;
create schema if not exists temp;
CREATE TABLE IF NOT EXISTS collision_crashes_def (
    accident_id SERIAL PRIMARY KEY,
    CRASH_DATE TEXT NOT NULL,
    CRASH_TIME TEXT NOT NULL,
    borough TEXT,
    zip_code TEXT,
    latitude TEXT,
    longitude TEXT,
    on_street_name TEXT,
    cross_street_name TEXT,
    off_street_name TEXT,
    persons_injured TEXT,
    persons_killed TEXT,
    pedestrians_injured TEXT,
    pedestrians_killed TEXT,
    cyclists_injured TEXT,
    cyclists_killed TEXT,
    motorists_injured TEXT,
    motorists_killed TEXT,
    CONTRIBUTING_FACTOR_VEHICLE_1 TEXT,
    CONTRIBUTING_FACTOR_VEHICLE_2 TEXT,
    CONTRIBUTING_FACTOR_VEHICLE_3 TEXT,
    CONTRIBUTING_FACTOR_VEHICLE_4 TEXT,
    CONTRIBUTING_FACTOR_VEHICLE_5 TEXT
);

CREATE TABLE IF NOT EXISTS vehicles_def (
    vehicle_id SERIAL PRIMARY KEY,
    state_registration TEXT,
    vehicle_type TEXT,
    vehicle_make TEXT,
    vehicle_model TEXT,
    vehicle_year TEXT
);

CREATE TABLE IF NOT EXISTS personas2_def (
    person_id SERIAL PRIMARY KEY,
    person_sex TEXT,
    person_lastname TEXT,
    person_firstname TEXT,
    person_phone TEXT,
    person_address TEXT,
    person_city TEXT,
    person_state TEXT,
    person_zip TEXT,
    person_ssn TEXT,
    person_dob TEXT
);

CREATE TABLE IF NOT EXISTS collision_person_def (
    collision_person_id SERIAL PRIMARY KEY,
    accident_id TEXT,
    person_id TEXT,
    vehicle_id TEXT,
    person_type TEXT,
    person_sex TEXT,
    person_injury TEXT,
    person_age TEXT,
    ejection TEXT,
    emotional_status TEXT,
    bodily_injury TEXT,
    position_in_vehicle TEXT,
    safety_equipment TEXT,
    ped_location TEXT,
    ped_action TEXT,
    COMPLAINT TEXT,
    ped_role TEXT,
    CONTRIBUTING_FACTOR_1 TEXT,
    CONTRIBUTING_FACTOR_2 TEXT,
    CONSTRAINT collision_person_def_fk1 FOREIGN KEY (vehicle_id) REFERENCES vehicles_def(vehicle_id),
    CONSTRAINT collision_person_def_fk2 FOREIGN KEY (accident_id) REFERENCES collision_crashes_def(accident_id)
);

CREATE TABLE IF NOT EXISTS collision_vehicles_def (
        collision_vehicle_id SERIAL PRIMARY KEY,
        accident_id TEXT,
        vehicle_id TEXT,
        travel_direction TEXT,
        vehicle_occupants TEXT,
        driver_sex TEXT,
        driver_license_status TEXT,
        driver_license_jurisdiction TEXT,
        pre_crash TEXT,
        point_of_impact TEXT,
        public_property_damage TEXT,
        public_property_damage_type TEXT,
        CONTRIBUTING_FACTOR_1 TEXT,
        CONTRIBUTING_FACTOR_2 TEXT,
        CONSTRAINT collision_vehicles_def_fk1 FOREIGN KEY (accident_id) REFERENCES collision_crashes_def(accident_id),
        CONSTRAINT collision_vehicles_def_fk2 FOREIGN KEY (vehicle_id) REFERENCES vehicles_def(vehicle_id)
);
