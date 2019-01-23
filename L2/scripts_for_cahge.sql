USE `country_and_cities`;
ALTER TABLE `countries` CHANGE COLUMN `name` `title` VARCHAR(150),
 ADD INDEX (`title`);

ALTER TABLE `regions` CHANGE COLUMN `name` `title` VARCHAR(150),
 ADD INDEX (`title`);

ALTER TABLE `regions` 
 DROP FOREIGN KEY `fk_region_country`,
 ADD CONSTRAINT `fk_region_country`
  FOREIGN KEY (`id_country`)
  REFERENCES `country_and_cities`.`countries` (`id`)
  ON DELETE RESTRICT
  ON UPDATE CASCADE;

ALTER TABLE `cities` 
 CHANGE COLUMN `name` `title` VARCHAR(150) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL AFTER `id_type`,
 CHANGE COLUMN `id_dictricts` `id_dictricts` INT,
 ADD INDEX `title` (`title` ASC) VISIBLE,
 DROP COLUMN `id_type`,
 DROP COLUMN `id_dictricts`,
 ADD COLUMN `impotant` TINYINT(1) NOT NULL AFTER `id_country`,
 CHANGE COLUMN `id_country` `id_country` INT AFTER `id`,
 ADD INDEX `fk_cities_countries_idx` (`id_country` ASC) VISIBLE,
 ADD INDEX `fk_cities_regions_idx` (`id_region` ASC) VISIBLE;

ALTER TABLE `country_and_cities`.`cities` 
ADD CONSTRAINT `fk_cities_country`
  FOREIGN KEY (`id_country`)
  REFERENCES `country_and_cities`.`countries` (`id`)
  ON DELETE RESTRICT
  ON UPDATE CASCADE,
ADD CONSTRAINT `fk_cities_regions`
  FOREIGN KEY (`id_region`)
  REFERENCES `country_and_cities`.`regions` (`id`)
  ON DELETE RESTRICT
  ON UPDATE CASCADE;

ALTER TABLE `country_and_cities`.`cities` 
CHANGE COLUMN `id_country` `id_country` INT NOT NULL ,
CHANGE COLUMN `id_region` `id_region` INT NOT NULL ;

DROP TABLE `types_of_city`;
DROP TABLE `dictricts`;
