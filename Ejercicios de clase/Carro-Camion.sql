
CREATE TABLE vehicle(
    vehicle_id INT NOT NULL CONSTRAINT vehicle_id_pk PRIMARY KEY,
    license_plate_no INT,
    price FLOAT,
    tipo VARCHAR(30) NOT NULL CHECK(tipo IN('car','truck')),
    UNIQUE (vehicle_id, tipo)
);

CREATE TABLE car(
    vehicle_id INT NOT NULL PRIMARY KEY REFERENCES vehicle(vehicle_id),
    tipo VARCHAR(30) DEFAULT 'car',
    max_speed INT NOT NULL CONSTRAINT max_speed_ck CHECK(max_speed<250),
    no_of_passengers INT NOT NULL CONSTRAINT no_of_passengers_ck CHECK(no_of_passengers<6),
    FOREIGN KEY(vehicle_id,tipo) REFERENCES vehicle(vehicle_id,tipo),
    CONSTRAINT tipo_car CHECK (tipo='car')
);

CREATE TABLE truck(
    vehicle_id INT NOT NULL PRIMARY KEY REFERENCES vehicle(vehicle_id),
    tipo VARCHAR(30) DEFAULT 'truck',
    no_of_axles INT NOT NULL CONSTRAINT no_of_axles_ck CHECK(no_of_axles<6),
    tonnage INT NOT NULL CONSTRAINT tonnage CHECK(tonnage<40),
    FOREIGN KEY(vehicle_id,tipo) REFERENCES vehicle(vehicle_id,tipo),
    CONSTRAINT tipo_truck CHECK(tipo='truck')
);

INSERT INTO vehicle (   )