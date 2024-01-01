INSTALL sqlite_scanner;
LOAD sqlite_scanner;
CALL sqlite_attach('musicbrainz-cmudb2023.db');
PRAGMA show_tables;

ALTER VIEW area RENAME TO area_old;
CREATE TABLE area AS SELECT * FROM area_old;
DROP VIEW area_old;

ALTER VIEW artist RENAME TO artist_old;
CREATE TABLE artist AS SELECT * FROM artist_old;
DROP VIEW artist_old;

ALTER VIEW artist_alias RENAME TO artist_alias_old;
CREATE TABLE artist_alias AS SELECT * FROM artist_alias_old;
DROP VIEW artist_alias_old;

ALTER VIEW artist_credit RENAME TO artist_credit_old;
CREATE TABLE artist_credit AS SELECT * FROM artist_credit_old;
DROP VIEW artist_credit_old;

ALTER VIEW artist_credit_name RENAME TO artist_credit_name_old;
CREATE TABLE artist_credit_name AS SELECT * FROM artist_credit_name_old;
DROP VIEW artist_credit_name_old;

ALTER VIEW artist_type RENAME TO artist_type_old;
CREATE TABLE artist_type AS SELECT * FROM artist_type_old;
DROP VIEW artist_type_old;

ALTER VIEW gender RENAME TO gender_old;
CREATE TABLE gender AS SELECT * FROM gender_old;
DROP VIEW gender_old;

ALTER VIEW language RENAME TO language_old;
CREATE TABLE language AS SELECT * FROM language_old;
DROP VIEW language_old;

ALTER VIEW medium RENAME TO medium_old;
CREATE TABLE medium AS SELECT * FROM medium_old;
DROP VIEW medium_old;

ALTER VIEW medium_format RENAME TO medium_format_old;
CREATE TABLE medium_format AS SELECT * FROM medium_format_old;
DROP VIEW medium_format_old;

ALTER VIEW release RENAME TO release_old;
CREATE TABLE release AS SELECT * FROM release_old;
DROP VIEW release_old;

ALTER VIEW release_info RENAME TO release_info_old;
CREATE TABLE release_info AS SELECT * FROM release_info_old;
DROP VIEW release_info_old;

ALTER VIEW release_status RENAME TO release_status_old;
CREATE TABLE release_status AS SELECT * FROM release_status_old;
DROP VIEW release_status_old;

ALTER VIEW work RENAME TO work_old;
CREATE TABLE work AS SELECT * FROM work_old;
DROP VIEW work_old;

ALTER VIEW work_type RENAME TO work_type_old;
CREATE TABLE work_type AS SELECT * FROM work_type_old;
DROP VIEW work_type_old;

SELECT * from duckdb_tables();
