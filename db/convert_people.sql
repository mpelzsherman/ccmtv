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
(id, canonical_name, composer, performer,
 date_of_birth, birth_location_id,
 date_of_death, death_location_id,
 current_location_id,
 created_on, updated_on)
select
id, ordinal, composer_flag, performer_flag,
DATE(concat(date_of_birth_year, '-', date_of_birth_month, '-',  date_of_birth_day)), birth_location_id,
DATE(concat(date_of_death_year, '-',  date_of_death_month, '-',  date_of_death_day)), death_location_id,
current_location_id,
created_on, updated_on
from piano_source.people;

-- mysql> desc people_names;
-- +-------------+------------------+------+-----+---------+----------------+
-- | Field       | Type             | Null | Key | Default | Extra          |
-- +-------------+------------------+------+-----+---------+----------------+
-- | id          | int(10) unsigned | NO   | PRI | NULL    | auto_increment |
-- | person_id   | int(10) unsigned | NO   | MUL | NULL    |                |
-- | language_id | int(10) unsigned | NO   | MUL | 0       |                |
-- | title       | varchar(32)      | YES  |     |         |                |
-- | forename    | varchar(32)      | NO   |     | NULL    |                |
-- | middle_name | varchar(64)      | YES  |     |         |                |
-- | prefix      | varchar(32)      | YES  |     |         |                |
-- | surname     | varchar(64)      | NO   | MUL | NULL    |                |
-- | suffix      | varchar(16)      | YES  |     |         |                |
-- | stage_name  | varchar(64)      | YES  |     |         |                |
-- +-------------+------------------+------+-----+---------+----------------+

-- mysql> desc epithets;
-- +-------------+--------------+------+-----+---------+----------------+
-- | Field       | Type         | Null | Key | Default | Extra          |
-- +-------------+--------------+------+-----+---------+----------------+
-- | id          | int(11)      | NO   | PRI | NULL    | auto_increment |
-- | person_id   | int(11)      | YES  |     | NULL    |                |
-- | language_id | int(11)      | YES  |     | NULL    |                |
-- | title       | varchar(255) | YES  |     | NULL    |                |
-- | forename    | varchar(255) | YES  |     | NULL    |                |
-- | middle_name | varchar(255) | YES  |     | NULL    |                |
-- | prefix      | varchar(255) | YES  |     | NULL    |                |
-- | surname     | varchar(255) | YES  |     | NULL    |                |
-- | suffix      | varchar(255) | YES  |     | NULL    |                |
-- | stage_name  | varchar(255) | YES  |     | NULL    |                |
-- | created_on  | datetime     | YES  |     | NULL    |                |
-- | updated_on  | datetime     | YES  |     | NULL    |                |
-- +-------------+--------------+------+-----+---------+----------------+
insert into epithets
(id,
 person_id,
 language_id,
 title,
 forename,
 middle_name,
 prefix,
 surname,
 suffix,
 stage_name
)
select
*
from piano_source.people_names;

update epithets set title = NULL where length(title) = 0;
update epithets set middle_name = NULL where length(middle_name) = 0;
update epithets set prefix = NULL where length(prefix) = 0;
update epithets set suffix = NULL where length(suffix) = 0;
update epithets set stage_name = NULL where length(stage_name) = 0;

-- Epithet.all.each { |x| x.person.update_attribute(:canonical_name, x.canonical + (x.canonical_name.blank? ? '' : " [#{x.canonical_name}]") }}
