CREATE DATABASE 'device';
CREATE DATABASE 'kaa';

CREATE TABLE IF NOT EXISTS device.device_info
(
    id           serial
        primary key,
    mac          varchar(17)
        constraint device_info_pk
            unique,
    device_type  varchar(20),
    display_name varchar(50),
    bind_status  boolean default false
);

ALTER TABLE device.device_info
    OWNER TO postgres;

CREATE TABLE IF NOT EXISTS device.device_bind
(
    id           serial,
    mac          varchar(17)
        constraint device_bind_pk
            unique,
    patient_uuid varchar(36)
);

ALTER TABLE device.device_bind
    OWNER TO postgres;