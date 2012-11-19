CREATE TABLE `compositions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `comp_group` varchar(64) DEFAULT NULL COMMENT 'Works that are part of the same piece will be grouped with this field.',
  `movement_name` varchar(64) DEFAULT NULL COMMENT 'like Allegro or the speed of the composition',
  `movement_num` tinyint(10) unsigned DEFAULT NULL,
  `catalog_num1` varchar(64) DEFAULT NULL COMMENT 'Usually the opus number, but some composers use different schemes for numbering',
  `catalog_num2` varchar(64) DEFAULT NULL COMMENT 'Some composers have two numbering schemes.  This field may not be used.',
  `catalog_num3` varchar(64) DEFAULT NULL COMMENT 'Only used for those with three numbering schemes',
  `year_composed_begin` smallint(4) DEFAULT NULL,
  `year_composed_end` smallint(4) DEFAULT NULL COMMENT 'Only use year_composed_end if you need a range, otherwise use only _begin',
  `musical_key_id` int(10) unsigned DEFAULT NULL COMMENT 'fk to musical_keys table.',
  `person_id` int(10) unsigned NOT NULL COMMENT 'fk to person table.  Who composed this work?',
  `rating` float(3,1) unsigned DEFAULT NULL COMMENT 'The average calculated rating for this composition 1-10',
  `rank` int(10) unsigned DEFAULT '0' COMMENT 'Calculated value of current rank for this composition',
  `views` int(10) unsigned DEFAULT '0' COMMENT 'Sum of all views of this composition',
  `created_on` date DEFAULT NULL,
  `updated_on` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comp_person_id_idx` (`person_id`),
  KEY `comp_comp_name_idx` (`title_id`),
  KEY `comp_group_idx` (`comp_group`),
  KEY `comp_musical_key_id_idx` (`musical_key_id`),
  KEY `index_title_on_compositions` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=5937 DEFAULT CHARSET=utf8 COMMENT='A piano work';

CREATE TABLE `compositions_urls` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `composition_id` int(10) unsigned DEFAULT NULL COMMENT 'fk to composition table.',
  `url_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comp_url_comp_id_idx` (`composition_id`),
  KEY `comp_url_url_id_idx` (`url_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16121 DEFAULT CHARSET=utf8 COMMENT='Connects composition to urls (e.g. a wiki page or sheet musi';

CREATE TABLE `countries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8 COMMENT='Country where people might live.';

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
) ENGINE=InnoDB AUTO_INCREMENT=2381 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `locations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `region_id` int(11) unsigned DEFAULT NULL COMMENT 'fk to region table',
  PRIMARY KEY (`id`),
  KEY `location_region_id_idx` (`region_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1275 DEFAULT CHARSET=utf8 COMMENT='Uniquely identifies a place of birth, death, etc.';

CREATE TABLE `musical_keys` (
  `id` int(10) unsigned NOT NULL,
  `key_name` varchar(24) NOT NULL,
  `short_key_name` varchar(2) NOT NULL COMMENT 'c#, C#, e, fb, fB, Bb, bb, b, B',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Things like D major';

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
) ENGINE=InnoDB AUTO_INCREMENT=10000919 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `performance_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='The type of media for a performance.';

CREATE TABLE `performances` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `composition_id` int(10) unsigned NOT NULL COMMENT 'fk to the composition',
  `performance_type_id` int(10) unsigned NOT NULL COMMENT 'fk to the type of performance',
  `url_id` int(10) unsigned DEFAULT NULL COMMENT 'embedded XHTML link',
  `person_id` int(10) unsigned NOT NULL COMMENT 'fk to person that performed',
  `perf_year` year(4) DEFAULT NULL COMMENT 'Performance year',
  `notes` mediumtext COMMENT 'Notes about this performance',
  `rating` float(3,1) unsigned DEFAULT NULL COMMENT 'The average calculated rating for this performance 1-10',
  `rank` int(10) unsigned DEFAULT '0' COMMENT 'Calculated value of current rank for this performance',
  `views` int(10) unsigned DEFAULT '0' COMMENT 'Sum of all views of this performances',
  `created_on` date DEFAULT NULL,
  `updated_on` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `performance_composition_id_idx` (`composition_id`),
  KEY `performance_performance_type_id_idx` (`performance_type_id`),
  KEY `performance_person_id_idx` (`person_id`),
  KEY `performance_url_id_idx` (`url_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1275 DEFAULT CHARSET=utf8 COMMENT='Stores a row for each single piano performance.';

CREATE TABLE `regions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `country_id` int(10) unsigned NOT NULL COMMENT 'fk to country table',
  PRIMARY KEY (`id`),
  KEY `region_region_name_idx` (`name`),
  KEY `regions_country_id_idx` (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8 COMMENT='The region within a country of a location.';

CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `titles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `composition_id` int(10) unsigned NOT NULL COMMENT 'fk to composition table',
  `composition_name` varchar(128) NOT NULL COMMENT 'A name for a piece',
  PRIMARY KEY (`id`),
  KEY `comp_name_comp_id_idx` (`composition_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7621 DEFAULT CHARSET=utf8 COMMENT='Connects compositions to alternative names for them.';

CREATE TABLE `urls` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `anchor_text` varchar(32) NOT NULL,
  `http` varchar(1024) NOT NULL,
  `embeded_code` varchar(2048) DEFAULT NULL COMMENT 'Code to embed it in our site.',
  `url_type_id` int(10) unsigned DEFAULT NULL,
  `last_verified` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `url_url_type_id_idx` (`url_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19392 DEFAULT CHARSET=utf8 COMMENT='Stores URLs';

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_email` (`email`),
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO schema_migrations (version) VALUES ('20120401045147');

INSERT INTO schema_migrations (version) VALUES ('20120401045349');

INSERT INTO schema_migrations (version) VALUES ('20120402040428');