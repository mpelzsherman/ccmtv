-- +-------------------+--------------+------+-----+---------+----------------+
-- | Field             | Type         | Null | Key | Default | Extra          |
-- +-------------------+--------------+------+-----+---------+----------------+
-- | id                | int(11)      | NO   | PRI | NULL    | auto_increment |
-- | canonical_name    | varchar(255) | YES  |     | NULL    |                |
-- | composer          | tinyint(1)   | YES  |     | NULL    |                |
-- | performer         | tinyint(1)   | YES  |     | NULL    |                |
-- | date_of_birth     | datetime     | YES  |     | NULL    |                |
-- | birth_location_id | int(11)      | YES  |     | NULL    |                |
-- | death_location_id | int(11)      | YES  |     | NULL    |                |
-- | date_of_death     | datetime     | YES  |     | NULL    |                |
-- | published         | tinyint(1)   | YES  |     | NULL    |                |
-- | created_on        | datetime     | YES  |     | NULL    |                |
-- | updated_on        | datetime     | YES  |     | NULL    |                |

insert into people
(id, canonical_name, composer, performer, date_of_birth, birth_location_id, date_of_death, death_location_id, current_location_id, created_on, updated_on)
select
id,
ordinal,
composer_flag,
performer_flag,
DATE(concat(date_of_birth_year, '-', date_of_birth_month, '-',  date_of_birth_day)),
birth_location_id,
DATE(concat(date_of_death_year, '-',  date_of_death_month, '-',  date_of_death_day)),
death_location_id,
current_location_id,
created_on,
updated_on
from piano_source.people;
