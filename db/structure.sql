CREATE TABLE `epithets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` int(11) DEFAULT NULL,
  `language_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `forename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `middle_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `prefix` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `surname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `suffix` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `stage_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `people` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `canonical_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `composer` tinyint(1) DEFAULT NULL,
  `performer` tinyint(1) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `birth_location_id` int(11) DEFAULT NULL,
  `death_location_id` int(11) DEFAULT NULL,
  `date_of_death` date DEFAULT NULL,
  `current_location_id` int(11) DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `created_on` datetime DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO schema_migrations (version) VALUES ('20120401045147');

INSERT INTO schema_migrations (version) VALUES ('20120401045349');