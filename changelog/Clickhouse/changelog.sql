CREATE DATABASE 'bsd';

CREATE TABLE IF NOT EXISTS bsd.blood_sugar_monitor
(
    bloodSugar Float32,
    mac        String,
    timestamp  DateTime64(3),
    uuid Nullable (String),
    sourceIP Nullable (String)
)
    ENGINE = MergeTree() ORDER BY (timestamp);

CREATE TABLE if not exists bsd.bLood_sugar_kafka
(
    bloodSugar Float32,
    mac        String,
    timestamp  DateTime64(3),
    uuid Nullable (String),
    sourceIP Nullable (String)
)
    ENGINE = Kafka SETTINGS kafka_broker_list = '{{kafka_host}}:{{kafka_port}',
        kafka_topic_list = '{{kafka_read_topic}}',
        kafka_group_name = 'ck-group',
        kafka_format = 'JSONEachRow',
        kafka_skip_broken_messages = 20000,
        kafka_num_consumers = 1;

CREATE MATERIALIZED VIEW IF NOT EXISTS
    blood_sugar_data_mv To bsd.blood_sugar_monitor AS
SELECT bloodSugar, mac, timestamp, uuid, sourceIP
FROM bsd.blood_sugar_kafka;