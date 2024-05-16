www.mockaroo.com

# default psql connection parameters ###########################################################

## host: localhost
## port: 5432
## username: $username

# TERMINAL #####################################################################################

## runs PostgreSQL CLI
psql 

## shows psql command line 
psql --help

## connect to a database
psql -h <host> -p <port> -U <username> 
psql --host=<host> --port=<port> --username=<username>


# PSQL #########################################################################################

## lists all databases
\l

## connect to a database
\c <db_name>

## describe connected database tables & sequences
\d 

## describe connected database (only) tables 
\dt

## describe table "table_name"
\d <table_name>

## execute a SQL file "filename"
\i <path-to-file/filename>

## expandend display
\x

## list available functions
\df

## generate csv from query
\copy (SELECT <columns> FROM <table_name> [...]) TO 'path/filename.ext' DELIMITER ',' CSV [HEADER];

# SQL (case in-sensitive , end with semicolon ) ################################################

## Character Types 
## 1. Char(5) : Stores up to a max number of 5 characters
## 2. Varchar : Store any length of characters
## 3. Varchar(20) : Store up to 20 characters
## 4.  Text : Store any length of characters
## Numeric Types : Used when you need accuracy / precision
## Serial : Whole numbers that also auto increment. Always used for column ids.
## 1. Smallserial : 1 to 32,767
## 2. Serial : 1 to 2147483647
## 3. Bigserial : 1 to 9223372036854775807
## Integer : Whole numbers only Always used when you don’t need a decimal
## 1. Smallint : -32,768 to 32, 767
## 2. Integer : -2,147,583,648 to 2,174,483,647
## 3. Bigint : -9223372036854775808 to 9223372036854775807
## Floats
## 1. Decimal : 131072 whole digits and 16383 after decimal
## 2. Numeric : 131072 whole digits and 16383 after decimal
## 3. Real : 1E-37 to 1E37 (6 places of precision)
## 4. Double Precision : 1E-307 to 1E308 (15 places of precision) Used when decimal doesn’t have to be very precise
## 5. Float : Same as double
## Boolean
## 1. True, 1, t, y, yes, on
## 2. False, 0, f, n, no, off
## 3. null
## Date / Time 
## DATE
## 1. No matter what format you enter you get this : 1974-12-21
## TIME
## 1. TIME WITHOUT TIME ZONE (Default)
## 2. ‘1:30:30 PM’:: TIME WITHOUT TIME ZONE -> 13:30:30
## 3. 01:30 AM EST -> 01:30-5:00 (UTC Format)
## 4. 01:30 PM PST -> 01:30-8:00
## 5. 01:30 PM UTC -> 01:30+00:00
## 6. ’01:30:30 PM EST’::TIME WITH TIME ZONE -> 13:30:30-5:00
## TIMESTAMP
## 1. ‘DEC-21-1974 1:30 PM EST’::TIMESTAMP WITH TIME ZONE -> 1974-12-21 13:30-5:00
## INTERVAL
## 1. Represents a duration of time
## 2. ‘1 day’::INTERVAL -> 01:00
## 3. ‘1 D 1 H 1 M 1 S’::INTERVAL -> 01:01:01:01
## 4. You can add and subtract intervals
## 5. You can add or subtract intervals from dates
## 6. (‘DEC-21-1974 1:30 PM EST’::TIMESTAMP WITH TIME ZONE) – (‘1 D’::INTERVAL)
## Also Currency, Binary, JSON, Range, Geometric, Arrays, XML, UUID

## declare a variable
DECLARE @<var_name> AS <var_type> = <var_value>
SELECT @<var_name>=<column_name> FROM <table_name> WHERE <criteria>

## print a variable value
PRINT @<var_name>

## set a variable value
SET @<var_name> = <var_value>

## create a type
CREATE TYPE <type_name> AS ENUM ('<enum_value1>',[...])
ALTER TABLE <table_name> ALTER COLUMN <column_name> TYPE <type_name> USING <column_name>::<type_name>

## create index
CREATE INDEX <index_name> ON <table_name>(<column_name>,[...]);

## creates a database named "db_name"
CREATE DATABASE <db_name>;

## deletes a database named "db_name"
DROP DATABASE <db_name>;

## creates a table named "table_name"
### <entry> = <column_name> <column_type> <constraint(s)> [...]
### <entries> = <entry>, [...]

CREATE TABLE <table_name> (
    <entries>
);

## deletes a table named "table_name"
DROP TABLE <table_name>;

## manipulate tables
ALTER TABLE <table_name> RENAME TO <table_new_name>;

## delete data in a table
TRUNCATE TABLE <table_name>

## insert value(s) into "table_name"
### <columns>=<column_name>, [...]
### <values>=<value>, [...]

INSERT INTO <table_name> (
    <columns>
)
VALUES (
    <values>
);

## add details in create table
CREATE TABLE <table_name> (
    <primary_key_name> SERIAL NOT NULL PRIMARY KEY
    <entry> [...] DEFAULT <default_value>
    <entry> TIMESTAMP 
    <entry> CHECK ([...])
    <entry> UNIQUE ([...])
);

## manipulate columns
ALTER TABLE <table_name> ADD <entry>;
ALTER TABLE <table_name> ALTER COLUMN <column_name> SET NOT NULL [...];
ALTER TABLE <table_name> ALTER COLUMN <column_name> TYPE <type_name>;
ALTER TABLE <table_name> RENAME COLUMN <column_name> TO <column_new_name>;
ALTER TABLE <table_name> DROP COLUMN <column_name>;

INSERT INTO <table_name>(<column_name>,[...]) VALUES (<column_value>,[...])

INSERT INTO  <table_name> VALUES
(<values1>),
(<values2>),
(<values3>),
(<values4>);

## show entry(s) for all columns from "table_name"
SELECT * FROM <table_name>;

## show entry(s) for "column_name",[...] from "table_name"
### <columns>=<column_name>, [...]

SELECT <columns> FROM <tablename>;

## show entry(s) in ascending order for "column_name_x",[...]
SELECT <columns1> FROM <tablename> ORDER BY <columns2>;
SELECT <columns1> FROM <tablename> ORDER BY <columns2> ASC;

## show entry(s) in descending order for "column_name",[...]
SELECT <columns1> FROM <tablename> ORDER BY <columns2> DESC;

## show every distinct entry(s) 
SELECT DISTINCT <columns> FROM <tablename>;

## show only entry(s) which meeting some criterias
### <pair> = <column_name_x>=<value_x>
### <criteria> = <pair1> AND / OR <pair2>

SELECT <columns> FROM <table_name> WHERE <criteria>;

## show only entry(s) which meeting values from "value_list" for "column_name"
### <values> = '<value>',[...]
### <value_list> = (<values>)

SELECT <columns> FROM <table_name> WHERE <column_name> IN <value_list>

## operations on expressions
### <exp> = <exp1> / < / <= / = / >= / > / <> <exp2>

SELECT <exp>;

## show first "limit_number" entry(s) 
SELECT <columns> FROM <table_name> LIMIT <limit_number>;
SELECT <columns> FROM <table_name> FETCH FIRST 5 ONLY; 

## show entry(s) from "start"+1 line 
SELECT <columns> FROM <table_name> OFFSET <start>;

## show entry(s) between two values of "column_name"
SELECT <columns> FROM <table_name> WHERE <column_name> BETWEEN <value1> AND <value2>;

## show entry(s) matching a pattern (case sensitive)
### <pattern> = 'a___b@%.co%' ( 'a', (3 char), 'b@', [...], '.co', [...] ) 

SELECT <columns> FROM <table_name> WHERE <column_name> LIKE <pattern>;

## show entry(s) matching a pattern (case in-sensitive)
SELECT <columns> FROM <table_name> WHERE <column_name> LIKE <pattern>;

## count entry(s) in "table_name"
SELECT COUNT(*) FROM <table_name>;

## count entry(s) in "table_name" meeting some criteria
SELECT COUNT(*) FROM <table_name> WHERE <criteria>;

## count entry(s) in "table_name" with "column_name" value NOT NULL
SELECT COUNT(<column_name>) FROM <table_name>;

## count entry(s) in "table_name" with "column_name" value NOT NULL and distinct
SELECT COUNT(DISTINCT <column_name>) FROM <table_name>;

## show entry(s) in "table_name" with "column_name" distinct values
SELECT DISTINCT <column_name> FROM <table_name>;

## show for each <column_name> value, how many entry(s) have the same value
SELECT <column_name>, COUNT(*) FROM <table_name> GROUP BY <column_name>; 

## filter by <condition>
### <condition> =  COUNT(*)>5

SELECT <column_name>, COUNT(*) FROM <table_name> GROUP BY <column_name> HAVING <condition>; 

## min/max/avg/sum value of "column_name" entry(s)
SELECT MIN(<column_name>) FROM <table_name>;
SELECT MAX(<column_name>) FROM <table_name>;
SELECT AVG(<column_name>) FROM <table_name>;
SELECT SUM(<column_name>) FROM <table_name>

## min/max/avg/sum value of "column_name" for each "column(s)" values
SELECT <column(s)>, MIN(<column_name>) FROM <table_name> GROUP BY <column(s)>;
SELECT <column(s)>, MAX(<column_name>) FROM <table_name> GROUP BY <column(s)>;
SELECT <column(s)>, AVG(<column_name>) FROM <table_name> GROUP BY <column(s)>;
SELECT <column(s)>, SUM(<column_name>) FROM <table_name> GROUP BY <column(s)>;

## arithmetic operations
SELECT <n> + <n> - <n> * <n> / <n> % <n>;
SELECT <n>*.10
SELECT ROUND(<n>, <decimals>)

## alias
SELECT <column_name> AS <alias>

## coalesce returns first not null value in list
### <list> = null, null, ... , <value1>, <value2>
SELECT COALESCE(<list>); 
SELECT COALESCE(<column_name>, <default_value>)

## nullif return null if first value is equal to second value
## null if n=m, n if n!=m
SELECT NULLIF(<n>, <m>);

## current timestamp
SELECT NOW();
## current date
SELECT NOW()::DATE;

## operations with timestamps
SELECT NOW() - INTERVAL '<n> DAY(s)';
SELECT NOW() - INTERVAL '<n> MONTH(s)';
SELECT NOW() - INTERVAL '<n> YEAR(s)';

## operations with dates
SELECT (NOW() - INTERVAL '<n> DAY(s)')::DATE;
SELECT (NOW() - INTERVAL '<n> MONTH(s)')::DATE;
SELECT (NOW() - INTERVAL '<n> YEAR(s)')::DATE;

## extract from timestamp
SELECT EXTRACT (DAY FROM NOW());
SELECT EXTRACT (MONTH FROM NOW());
SELECT EXTRACT (YEAR FROM NOW());
## day of week (0-6)
SELECT EXTRACT (DOW FROM NOW()); 
SELECT EXTRACT (CENTURY FROM NOW());

## concat
SELECT CONCAT(<column1>, '<separator>', <column2>) AS <column_name> FROM <table_name>;

## age
SELECT AGE(NOW(), <date2>);
SELECT AGE(<date1>, <date2>);

## add primary key
ALTER TABLE <table_name> ADD PRIMARY KEY (<id>, [...]);

## delete primary key
ALTER TABLE <table_name> DROP CONTRAINT <contraint_of_primary_key>;

## delete entry(s)
DELETE FROM <table_name> WHERE <criteria>

## add UNIQUE constraint
ALTER TABLE <table_name> ADD CONTRAINT <unique_contraint> UNIQUE (<column(s)>);
ALTER TABLE <table_name> ADD UNIQUE (<column(s)>);

## delete UNIQUE constraint
ALTER TABLE <table_name> DROP CONTRAINT <unique_contraint>;

## add CHECK constraint
ALTER TABLE <table_name> ADD CONTRAINT <check_contraint> CHECK (<criteria>);

## delete CHECK constraint
ALTER TABLE <table_name> DROP CONSTRAINT <check_contraint>;

## delete entry(s)
DELETE FROM <table_name> WHERE <criteria>;

## update entry(s)
UPDATE <table_name> SET <column_name> = <column_value>, [...] WHERE <criteria>;

## handle error unique/primarykey constraint violation

## do nothing
INSERT INTO <table_name> (<column_list>) 
VALUES (<values_list>) 
ON CONFLICT (<unique_column>) DO NOTHING;

## update to latest 
INSERT INTO <table_name> (<column_list>) 
VALUES (<values_list>) 
ON CONFLICT (<unique_column>) DO UPDATE 
SET <unique_column>=EXCLUDED.<unique_column>, [...];

## add foreign key
CREATE TABLE <other_table_name> (
    <primary_key_name_other_table> <SERIAL/BIGSERIAL/UUID> NOT NULL PRIMARY KEY
    <entries>
);

CREATE TABLE <table_name> (
    <primary_key_name> <SERIAL/BIGSERIAL/UUID> NOT NULL PRIMARY KEY
    <entries>
    <foreign_key_name> <BIGINT/UUID> [NOT NULL] REFERENCES <other_table_name> (<primary_key_name_other_table>) ,
    [UNIQUE (<foreign_key_name>)]
);

UPDATE <table_name> 
SET <foreign_key_name> = <primary_key_name_other_table_value> 
WHERE <primary_key_name> = <primary_key_value>;

## inner join
SELECT <columns> FROM <table_name> 
JOIN <other_table_name> 
ON <table_name>.<foreign_key_name>=<other_table_name>.<primary_key_name_other_table>;

SELECT <columns> FROM <table_name> 
JOIN <other_table_name> 
USING (foreign_key_name);

## left join
SELECT <columns> FROM <table_name> 
LEFT JOIN <other_table_name> 
ON <table_name>.<foreign_key_name>=<other_table_name>.<primary_key_name_other_table>;

SELECT <columns> FROM <table_name> 
LEFT JOIN <other_table_name> 
USING (foreign_key_name);


## show left join entry(s) without relation 
SELECT <columns> FROM <table_name> 
LEFT JOIN <other_table_name> 
ON <table_name>.<foreign_key_name>=<other_table_name>.<primary_key_name_other_table>;
WHERE <other_table_name>.* IS NULL

## show last id number generated with serial/bigserial
SELECT * <primary_key_name>_seq;

## sequence nextval() increments last id number generated
SELECT nextval('<primary_key_name>_seq'::regclass);

## alter sequence last id number generated
ALTER SEQUENCE <primary_key_name>_seq RESTART WITH <new_value>;

## show available extensions in PSQL
SELECT * FROM pg_available_extensions;

## install an extension
CREATE EXTENSION IF NOT EXISTS "<ext_name>";

## generate a UUID
CREATE TABLE <table_name> (
    <primary_key_name> UUID NOT NULL PRIMARY KEY
    <entries>
);

SELECT uuid_generate_v4();

INSERT INTO <table_name> ( <primary_key_name>, <columns> ) VALUES ( uuid_generate_v4(), <values> );

