use warehouse frostyfriday;
use database frostyfriday;
use schema frostyfriday;
create STAGE IDENTIFIER('"FROSTYFRIDAY"."FROSTYFRIDAY"."FROSTYFRIDAYS301"')
URL = 's3://frostyfridaychallenges/challenge_1/' DIRECTORY = ( ENABLE = true ); -- create the stage

select $1 from '@FROSTYFRIDAYS301'; --query the files

CREATE FILE FORMAT my_csv_format
  TYPE = 'CSV'
  FIELD_DELIMITER = ','
  SKIP_HEADER = 0
  NULL_IF = ('NULL', 'null'); --fileformat

 CREATE OR REPLACE table frostyfridaycsv (column1 VARCHAR(255));

copy into frostyfridaycsv from '@FROSTYFRIDAYS301'  file_format = my_csv_format;

