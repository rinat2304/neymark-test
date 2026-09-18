CREATE TABLE cities (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE stops (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    city_id BIGINT UNSIGNED NOT NULL,
    name VARCHAR(150) NOT NULL,

    CONSTRAINT fk_stops_city
        FOREIGN KEY (city_id)
        REFERENCES cities (id)
);

CREATE TABLE buses (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    plate_number VARCHAR(20) NOT NULL UNIQUE
);

CREATE TABLE routes (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(150) NOT NULL
);

CREATE TABLE route_stops (
    route_id BIGINT UNSIGNED NOT NULL,
    stop_id BIGINT UNSIGNED NOT NULL,
    stop_order SMALLINT UNSIGNED NOT NULL,

    PRIMARY KEY (route_id, stop_id),

    CONSTRAINT fk_route_stops_route
        FOREIGN KEY (route_id)
        REFERENCES routes (id),

    CONSTRAINT fk_route_stops_stop
        FOREIGN KEY (stop_id)
        REFERENCES stops (id),

    CONSTRAINT uq_route_stops_order
        UNIQUE (route_id, stop_order)
);

CREATE TABLE trips (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    route_id BIGINT UNSIGNED NOT NULL,
    bus_id BIGINT UNSIGNED NOT NULL,
    departure_at DATETIME NOT NULL,

    CONSTRAINT fk_trips_route
        FOREIGN KEY (route_id)
        REFERENCES routes (id),

    CONSTRAINT fk_trips_bus
        FOREIGN KEY (bus_id)
        REFERENCES buses (id)
);

CREATE TABLE trip_stops (
    trip_id BIGINT UNSIGNED NOT NULL,
    stop_id BIGINT UNSIGNED NOT NULL,
    stop_order SMALLINT UNSIGNED NOT NULL,
    arrival_at DATETIME NULL,
    departure_at DATETIME NOT NULL,

    PRIMARY KEY (trip_id, stop_id),

    CONSTRAINT fk_trip_stops_trip
        FOREIGN KEY (trip_id)
        REFERENCES trips (id),

    CONSTRAINT fk_trip_stops_stop
        FOREIGN KEY (stop_id)
        REFERENCES stops (id),

    CONSTRAINT uq_trip_stops_order
        UNIQUE (trip_id, stop_order)
);